package com.flab.tabling.global.config;

import org.springframework.boot.autoconfigure.h2.H2ConsoleProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.AesBytesEncryptor;
import org.springframework.security.crypto.encrypt.BytesEncryptor;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.flab.tabling.global.auth.AuthenticationFilter;
import com.flab.tabling.global.auth.ExceptionHandlerFilter;
import com.flab.tabling.global.env.SecurityProperties;

import jakarta.servlet.Filter;
import lombok.RequiredArgsConstructor;

/**
 * @Configuration : 빈 정의와 런타임 때 빈에 대한 서비스 요청을 생성하기 위해
 * 스프링 컨테이너에 의해 처리될 수 있음
 * @Bean: 스프링 컨테이너에 의해 관리되는 빈 생성
 * @PropertySource : 설정된 파일을 읽어서 스프링 Environment 오브젝트에 저장
 * @Value : 외부 변수의 값을 읽어 온다.
 */

@Configuration
@RequiredArgsConstructor
@EnableConfigurationProperties({H2ConsoleProperties.class, SecurityProperties.class})
public class SecurityConfig {
	private final SecurityProperties securityProperties;
	private final H2ConsoleProperties h2ConsoleProperties;
	private final ObjectMapper objectMapper;

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	/**
	 * TODO : application.yml에서  encryptor password 및 salt 시크릿 변수로 관리
	 */
	@Bean
	public BytesEncryptor bytesEncryptor() {
		return new AesBytesEncryptor(securityProperties.getBytesEncryptorPassword(),
			securityProperties.getBytesEncryptorSalt());
	}

	@Bean
	public FilterRegistrationBean<Filter> authenticationFilter() {
		FilterRegistrationBean<Filter> bean = new FilterRegistrationBean<>();
		bean.setFilter(new AuthenticationFilter(securityProperties, h2ConsoleProperties));
		bean.setOrder(2);
		return bean;
	}

	@Bean
	public FilterRegistrationBean<Filter> exceptionHandlerFilter() {
		FilterRegistrationBean<Filter> bean = new FilterRegistrationBean<>();
		bean.setFilter(new ExceptionHandlerFilter(objectMapper));
		bean.setOrder(1);
		return bean;
	}
}
