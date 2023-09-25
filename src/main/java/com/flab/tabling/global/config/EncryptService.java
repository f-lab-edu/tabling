package com.flab.tabling.global.config;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;

import org.springframework.security.crypto.encrypt.BytesEncryptor;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EncryptService {
	private final BytesEncryptor bytesEncryptor;

	public String encrypt(String value) {
		byte[] encrypt = bytesEncryptor.encrypt(value.getBytes(StandardCharsets.UTF_8));
		return byteArrayToString(encrypt);
	}

	public String decrypt(String value) {
		byte[] bytes = stringToByteArray(value);
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
			buffer.put((byte) Integer.parseInt(element));
		}
		return buffer.array();
	}
}
