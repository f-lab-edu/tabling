package com.flab.tabling.global.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.flab.tabling.global.log.MdcLoggingFilter;

@Configuration
public class LogConfig {

	@Bean
	public MdcLoggingFilter mdcLoggingFilter() {
		return new MdcLoggingFilter();
	}
}
