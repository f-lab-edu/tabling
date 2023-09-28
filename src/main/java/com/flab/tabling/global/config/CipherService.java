package com.flab.tabling.global.config;

public interface CipherService {
	String encrypt(String value);

	boolean match(String rawValue, String encryptedValue);

}
