package com.flab.tabling.global.config;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

/**
 * @Aspect : advice와 pointcut 모듈화한 것
 * @Before : before advice, 포인트 컷이 실행되기 전 지정한 어드바이스 실행
 */

@Component
@Aspect
@Slf4j
public class LogAspect {

	@Before("within(com.flab.tabling.global.exception.GlobalExceptionAdvice)")
	public void log(JoinPoint joinPoint) {
		Object[] args = joinPoint.getArgs();
		for (Object arg : args) {
			Exception e = (Exception)arg;
			log.warn(e.getClass().getName(), e);
		}
	}
}
