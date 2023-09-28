package com.flab.tabling.global.config;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Spy;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.encrypt.Encryptors;

@ExtendWith(MockitoExtension.class)
class TwoWayCipherServiceTest {
	private TwoWayCipherService twoWayCipherService;
	@Spy
	StringGenerator stringGenerator;

	@BeforeEach
	void init() {
		String encryptorsPassword = stringGenerator.make();
		String salt = stringGenerator.makeByHexCharacter(32);
		twoWayCipherService = new TwoWayCipherService(Encryptors.stronger(encryptorsPassword, salt));
	}

	@Test
	@DisplayName("이메일 암호화 검사")
	void encryptEmail() {
		//given
		String email = stringGenerator.makeEmail(7);

		//when
		String encryptedEmail = twoWayCipherService.encrypt(email);

		//then
		Assertions.assertThat(encryptedEmail.length() <= 255).isTrue();
		Assertions.assertThat(twoWayCipherService.decrypt(encryptedEmail)).isEqualTo(email);
	}

}
