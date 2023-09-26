package com.flab.tabling.global.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.BytesEncryptor;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @Configuration : 빈 정의와 런타임 때 빈에 대한 서비스 요청을 생성하기 위해
 * 스프링 컨테이너에 의해 처리될 수 있음
 * @Bean: 스프링 컨테이너에 의해 관리되는 빈 생성
 */

@PropertySource("classpath:application.yml")
@Configuration
public class SecurityConfig {
	@Value("${bytes-encryptor-password}")
	private String encryptorPassword;
	@Value("${bytes-encryptor-salt}")
	private String encryptorSalt;

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	/**
	 * TODO : application.yml에서  encryptor password 및 salt 시크릿 변수로 관리
	 */
	@Bean
	public BytesEncryptor bytesEncryptor() {
		return Encryptors.stronger(encryptorPassword, encryptorSalt);
	}
}
