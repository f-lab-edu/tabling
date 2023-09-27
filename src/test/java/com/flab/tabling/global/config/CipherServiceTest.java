package com.flab.tabling.global.config;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = {StringGenerator.class, CipherService.class, SecurityConfig.class})
class CipherServiceTest {

	@Autowired
	CipherService cipherService;
	@Autowired
	StringGenerator stringGenerator;

	@Test
	@DisplayName("비밀번호 일치 검사")
	void checkValidPassword() {
		//given
		String password = stringGenerator.makePassword(10);
		//when
		String encryptedPassword = cipherService.encryptPassword(password);
		//then
		Assertions.assertThat(cipherService.matchPassword(password, encryptedPassword)).isTrue();
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
		String encryptedPassword = cipherService.encryptPassword(password);

		//then
		Assertions.assertThat(cipherService.matchPassword(invalidPassword, encryptedPassword)).isFalse();
	}

	@Test
	@DisplayName("이메일 암호화 검사")
	void encryptEmail() {
		//given
		String email = stringGenerator.makeEmail(7);

		//when
		String encryptedEmail = cipherService.encryptEmail(email);

		//then
		Assertions.assertThat(encryptedEmail.length() <= 255).isTrue();
		Assertions.assertThat(cipherService.decryptEmail(encryptedEmail)).isEqualTo(email);
	}

}
