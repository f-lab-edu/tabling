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
	private SecurityCredentials securityCredentials;

	public void setSecurityCredentials(SecurityCredentials securityCredentials) {
		this.securityCredentials = securityCredentials;
	}

	public String getLoginPath() {
		return securityCredentials.getLoginPath();
	}

	public HttpMethod getLoginMethod() {
		return securityCredentials.getLoginMethod();
	}

	public String getMemberAddPath() {
		return securityCredentials.getMemberAddPath();
	}

	public HttpMethod getMemberAddMethod() {
		return securityCredentials.getMemberAddMethod();
	}

	public String getEncryptorPassword() {
		return securityCredentials.getBytesEncryptorPassword();
	}

	public String getEncryptorSalt() {
		return securityCredentials.getBytesEncryptorSalt();
	}

}
