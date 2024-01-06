package com.flab.tabling.global.env;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.http.HttpMethod;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

/**
 * @ConfigurationProperties : application.yml의 설정정보를 빈으로 등록
 */
@Getter
@RequiredArgsConstructor
@ConfigurationProperties(prefix = "tabling.security-credentials")
public class SecurityProperties {
	private final String loginPath;
	private final HttpMethod loginMethod;
	private final String memberAddPath;
	private final HttpMethod memberAddMethod;
	private final String bytesEncryptorPassword;
	private final String bytesEncryptorSalt;
}
