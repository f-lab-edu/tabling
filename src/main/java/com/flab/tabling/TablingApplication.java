package com.flab.tabling;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

/**
 * @EnableJpaAuditing : JPA auditing 활성화
 * @SpringBootApplication : 스프링 부투의 기본적인 설정 선언
 * 1) @ComponentScan : @Component 어노테이션이 포함된 어노테이션을 스캔하여 빈으로 등록
 * 2) @EnableAutoConfiguration : 사전에 정의한 라이브러리들을 특정 조건이 만족될 경우 빈으로 등록
 */
@EnableJpaAuditing
@SpringBootApplication
public class TablingApplication {
	public static void main(String[] args) {
		SpringApplication.run(TablingApplication.class, args);
	}

}
