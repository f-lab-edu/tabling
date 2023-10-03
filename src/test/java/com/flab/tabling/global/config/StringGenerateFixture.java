package com.flab.tabling.global.config;

import java.util.Random;

public class StringGenerateFixture {
	private static final Random random = new Random();
	private static final int leftLimit = '0';
	private static final int rightLimit = 'z';

	private static final int min = 1;
	private static final int max = 50;

	private static final String emailDomain = "@test.com";

	public static String makePassword(int length) {
		return random.ints(leftLimit, rightLimit + 1)
			.filter(i -> ('0' <= i && i <= '9') || ('a' <= i && i <= 'z') || ('A' <= i && i <= 'Z'))
			.limit(length)
			.collect(StringBuilder::new,
				StringBuilder::appendCodePoint, StringBuilder::append)
			.toString();
	}

	public static String makeEmail(int length) {
		return makeByNumbersAndLowerLetters(length) + emailDomain;
	}

	public static String makeByNumbersAndLowerLetters(int length) {
		return random.ints(leftLimit, rightLimit + 1)
			.filter(i -> ('0' <= i && i <= '9') || ('a' <= i && i <= 'z'))
			.limit(length)
			.collect(StringBuilder::new,
				StringBuilder::appendCodePoint, StringBuilder::append)
			.toString();
	}

	public static String makeByHexCharacter(int length) {
		return random.ints(leftLimit, rightLimit + 1)
			.filter(i -> ('0' <= i && i <= '9') || ('A' <= i && i <= 'F') || 'a' <= i && i <= 'f')
			.limit(length)
			.collect(StringBuilder::new,
				StringBuilder::appendCodePoint, StringBuilder::append)
			.toString();
	}

	public static String makeByNumbersAndAlphabets() {
		int length = random.nextInt(min, max);
		return random.ints(leftLimit, rightLimit + 1)
			.filter(i -> ('0' <= i && i <= '9') || ('a' <= i && i <= 'z') || ('A' <= i && i <= 'Z'))
			.limit(length)
			.collect(StringBuilder::new,
				StringBuilder::appendCodePoint, StringBuilder::append)
			.toString();
	}
}
