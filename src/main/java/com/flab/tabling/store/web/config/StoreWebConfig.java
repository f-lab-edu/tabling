package com.flab.tabling.store.web.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.flab.tabling.store.web.interceptor.StoreAuthInterceptor;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class StoreWebConfig implements WebMvcConfigurer {
	private final StoreAuthInterceptor storeAuthInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(storeAuthInterceptor)
			.excludePathPatterns("/stores/*/waiting/**")
			.addPathPatterns("/stores/**");
	}
}
