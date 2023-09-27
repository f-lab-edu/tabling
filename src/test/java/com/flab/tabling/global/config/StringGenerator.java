package com.flab.tabling.global.config;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class StringGenerator {
	private final Random random = new Random();
	private final int leftLimit = '0';
	private final int rightLimit = 'z';

	private final String emailDomain = "@test.com";

	public String makePassword(int length) {
		return random.ints(leftLimit, rightLimit + 1)
			.filter(i -> ('0' <= i && i <= '9') || ('a' <= i && i <= 'z') || ('A' <= i && i <= 'Z'))
			.limit(length)
			.collect(StringBuilder::new,
				StringBuilder::appendCodePoint, StringBuilder::append)
			.toString();
	}

	public String makeEmail(int length) {
		return makeName(length) + emailDomain;
	}

	public String makeName(int length) {
		return random.ints(leftLimit, rightLimit + 1)
			.filter(i -> ('0' <= i && i <= '9') || ('a' <= i && i <= 'z'))
			.limit(length)
			.collect(StringBuilder::new,
				StringBuilder::appendCodePoint, StringBuilder::append)
			.toString();
	}
}
