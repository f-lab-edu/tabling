package com.flab.tabling.global.env;

import org.springframework.http.HttpMethod;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@RequiredArgsConstructor
public class SecurityProperties {
	private final String loginPath;
	private final HttpMethod loginMethod;
	private final String memberAddPath;
	private final HttpMethod memberAddMethod;
	private final String bytesEncryptorPassword;
	private final String bytesEncryptorSalt;
}
