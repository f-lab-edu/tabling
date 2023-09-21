package com.flab.tabling.global.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @Configuration : 빈 정의와 런타임 때 빈에 대한 서비스 요청을 생성하기 위해
 * 스프링 컨테이너에 의해 처리될 수 있음
 * @Bean: 스프링 컨테이너에 의해 관리되는 빈 생성
 */

@Configuration
public class SecurityConfig {
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
