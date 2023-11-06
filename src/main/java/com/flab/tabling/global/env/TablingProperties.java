package com.flab.tabling.global.env;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.NestedConfigurationProperty;
import org.springframework.http.HttpMethod;

/**
 * @ConfigurationProperties : application.yml의 설정정보를 빈으로 등록
 * @NestedConfigurationProperty : spring-boot-configuration-processor가 단일값으로 바인딩 되지 않는다는 힌트를 얻을 수 있음
 */

@ConfigurationProperties(prefix = "tabling")
public class TablingProperties {
	@NestedConfigurationProperty
	private SecurityProperties securityProperties;

	public void setSecurityCredentials(SecurityProperties securityProperties) {
		this.securityProperties = securityProperties;
	}

	public String getLoginPath() {
		return securityProperties.getLoginPath();
	}

	public HttpMethod getLoginMethod() {
		return securityProperties.getLoginMethod();
	}

	public String getMemberAddPath() {
		return securityProperties.getMemberAddPath();
	}

	public HttpMethod getMemberAddMethod() {
		return securityProperties.getMemberAddMethod();
	}

	public String getEncryptorPassword() {
		return securityProperties.getBytesEncryptorPassword();
	}

	public String getEncryptorSalt() {
		return securityProperties.getBytesEncryptorSalt();
	}

}
