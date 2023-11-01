package com.flab.tabling.global.env;

import org.springframework.http.HttpMethod;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SecurityCredentials {
	private String loginPath;
	private HttpMethod loginMethod;
	private String memberAddPath;
	private HttpMethod memberAddMethod;
	private String bytesEncryptorPassword;
	private String bytesEncryptorSalt;
}
