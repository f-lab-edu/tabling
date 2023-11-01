package com.flab.tabling.global.service;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;

import org.springframework.security.crypto.encrypt.BytesEncryptor;
import org.springframework.stereotype.Service;

import com.flab.tabling.global.service.CipherService;
import com.flab.tabling.global.service.DecryptService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TwoWayCipherService implements CipherService, DecryptService {
	private final BytesEncryptor bytesEncryptor;

	@Override
	public String encrypt(String value) {
		byte[] encrypt = bytesEncryptor.encrypt(value.getBytes(StandardCharsets.UTF_8));
		return byteArrayToString(encrypt);
	}

	@Override
	public boolean match(String rawValue, String encryptedValue) {
		return encrypt(rawValue).equals(encryptedValue);
	}

	@Override
	public String decrypt(String encryptedValue) {
		byte[] bytes = stringToByteArray(encryptedValue);
		byte[] decrypt = bytesEncryptor.decrypt(bytes);
		return new String(decrypt, StandardCharsets.UTF_8);
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
