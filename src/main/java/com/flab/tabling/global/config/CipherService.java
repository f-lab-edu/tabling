package com.flab.tabling.global.config;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;

import org.springframework.security.crypto.encrypt.BytesEncryptor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CipherService {
	private final BytesEncryptor bytesEncryptor;
	private final PasswordEncoder passwordEncoder;

	public String encryptEmail(String email) {
		byte[] encrypt = bytesEncryptor.encrypt(email.getBytes(StandardCharsets.UTF_8));
		return byteArrayToString(encrypt);
	}

	public String decryptEmail(String encryptedEmail) {
		byte[] bytes = stringToByteArray(encryptedEmail);
		byte[] decrypt = bytesEncryptor.decrypt(bytes);
		return new String(decrypt, StandardCharsets.UTF_8);
	}

	public String encryptPassword(String password) {
		return passwordEncoder.encode(password);
	}

	public boolean matchPassword(String rawPassword, String encryptedPassword) {
		return passwordEncoder.matches(rawPassword, encryptedPassword);
	}

	private String byteArrayToString(byte[] bytes) {
		String result = "";
		for (byte element : bytes) {
			result += element;
			result += " ";
		}
		return result;
	}

	private byte[] stringToByteArray(String byteString) {
		String[] elements = byteString.split("\\s");
		ByteBuffer buffer = ByteBuffer.allocate(elements.length);
		for (String element : elements) {
			buffer.put((byte)Integer.parseInt(element));
		}
		return buffer.array();
	}
}
