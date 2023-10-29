package com.flab.tabling.global.env;

import java.util.Map;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.NestedConfigurationProperty;
import org.springframework.http.HttpMethod;

/**
 * @ConfigurationProperties : application.yml의 설정정보를 빈으로 등록
 */

@ConfigurationProperties(prefix = "info")
public class SecurityProperties {
	@NestedConfigurationProperty
	private Map<String, String> security;

	public void setSecurity(Map<String, String> security) {
		this.security = security;
	}

	public String getLoginPath() {
		return security.get("login-path");
	}

	public HttpMethod getLoginMethod() {
		return HttpMethod.valueOf(security.get("login-method"));
	}

	public String getMemberAddPath() {
		return security.get("member-add-path");
	}

	public HttpMethod getMemberAddMethod() {
		return HttpMethod.valueOf(security.get("member-add-method"));
	}

	public String getEncryptorPassword() {
		return security.get("bytes-encryptor-password");
	}

	public String getEncryptorSalt() {
		return security.get("bytes-encryptor-salt");
	}

}
