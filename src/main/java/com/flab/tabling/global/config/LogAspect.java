package com.flab.tabling.global.config;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

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
