package com.flab.tabling.global.config;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Spy;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

@ExtendWith(MockitoExtension.class)
class OneWayCipherServiceTest {
	private OneWayCipherService oneWayCipherService;

	@Spy
	private SecurityConfig securityConfig;

	@Spy
	private StringGenerator stringGenerator;

	@BeforeEach
	void init() {
		PasswordEncoder passwordEncoder = securityConfig.passwordEncoder();
		oneWayCipherService = new OneWayCipherService(passwordEncoder);
	}

	@Test
	@DisplayName("비밀번호 일치 검사")
	void checkValidPassword() {
		//given
		String password = stringGenerator.makePassword(10);
		//when
		String encryptedPassword = oneWayCipherService.encrypt(password);
		//then
		Assertions.assertThat(oneWayCipherService.match(password, encryptedPassword)).isTrue();
	}

	@Test
	@DisplayName("비밀번호 불일치 검사")
	void checkInvalidPassword() {
		//given
		String invalidPassword = stringGenerator.makePassword(10);
		//when
		String password = stringGenerator.makePassword(10);
		while (invalidPassword.equals(password)) {
			password = stringGenerator.makePassword(10);
		}
		String encryptedPassword = oneWayCipherService.encrypt(password);
		//then
		Assertions.assertThat(oneWayCipherService.match(invalidPassword, encryptedPassword)).isFalse();
	}
}
