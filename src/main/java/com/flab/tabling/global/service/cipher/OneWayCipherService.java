package com.flab.tabling.global.service.cipher;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OneWayCipherService implements CipherService {

	private final PasswordEncoder passwordEncoder;

	@Override
	public String encrypt(String value) {
		return passwordEncoder.encode(value);
	}

	@Override
	public boolean match(String rawValue, String encryptedValue) {
		return passwordEncoder.matches(rawValue, encryptedValue);
	}
}
