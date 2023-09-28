package com.flab.tabling.global.config;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class StringGenerator {
	private final Random random = new Random();
	private final int leftLimit = '0';
	private final int rightLimit = 'z';

	private final int min = 1;
	private final int max = 50;

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
		return makeByNumbersAndLowerLetters(length) + emailDomain;
	}

	public String makeByNumbersAndLowerLetters(int length) {
		return random.ints(leftLimit, rightLimit + 1)
			.filter(i -> ('0' <= i && i <= '9') || ('a' <= i && i <= 'z'))
			.limit(length)
			.collect(StringBuilder::new,
				StringBuilder::appendCodePoint, StringBuilder::append)
			.toString();
	}

	public String makeByHexCharacter(int length) {
		return random.ints(leftLimit, rightLimit + 1)
			.filter(i -> ('0' <= i && i <= '9') || ('A' <= i && i <= 'F') || 'a' <= i && i <= 'f')
			.limit(length)
			.collect(StringBuilder::new,
				StringBuilder::appendCodePoint, StringBuilder::append)
			.toString();
	}

	public String make() {
		int length = random.nextInt(min, max);
		return random.ints(leftLimit, rightLimit + 1)
			.filter(i -> ('0' <= i && i <= '9') || ('a' <= i && i <= 'z') || ('A' <= i && i <= 'Z'))
			.limit(length)
			.collect(StringBuilder::new,
				StringBuilder::appendCodePoint, StringBuilder::append)
			.toString();
	}
}
