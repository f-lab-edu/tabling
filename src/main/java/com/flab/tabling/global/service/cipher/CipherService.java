package com.flab.tabling.global.service.cipher;

public interface CipherService {
	String encrypt(String value);

	boolean match(String rawValue, String encryptedValue);

}
