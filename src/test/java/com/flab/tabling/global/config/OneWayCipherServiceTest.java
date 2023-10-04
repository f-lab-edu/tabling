package com.flab.tabling.global.config;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Spy;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @ExtendWith : 테스트 클래스, 테스트 인터페이스, 테스트 메소드, 테스트 매개변수 또는 필드 등 확장을 등록하는데 사용되는 반복가능한 어노테이션
 * @Spy : 기존 인스턴스를 감싼다. 기존 인스턴스와 동일한 방식으로 작동
 * @BeforeEach : @Test 보다 먼저 실행되는 메소드에 지정
 * @Test : 독립적으로 테스트를 수행할 메소드 지정, @Test마다 객체를 생성
 * @DisplayName : 테스트 이름 지정
 */
@ExtendWith(MockitoExtension.class)
class OneWayCipherServiceTest {
	private OneWayCipherService oneWayCipherService;

	@Spy
	private SecurityConfig securityConfig;

	@BeforeEach
	void init() {
		PasswordEncoder passwordEncoder = securityConfig.passwordEncoder();
		oneWayCipherService = new OneWayCipherService(passwordEncoder);
	}

	@Test
	@DisplayName("비밀번호 일치 검사")
	void checkValidPassword() {
		//given
		String password = StringGenerateFixture.makeByNumbersAndAlphabets(10);
		//when
		String encryptedPassword = oneWayCipherService.encrypt(password);
		//then
		Assertions.assertThat(oneWayCipherService.match(password, encryptedPassword)).isTrue();
	}

	@Test
	@DisplayName("비밀번호 불일치 검사")
	void checkInvalidPassword() {
		//given
		String invalidPassword = StringGenerateFixture.makeByNumbersAndAlphabets(10);
		//when
		String password = StringGenerateFixture.makeByNumbersAndAlphabets(10);
		while (invalidPassword.equals(password)) {
			password = StringGenerateFixture.makeByNumbersAndAlphabets(10);
		}
		String encryptedPassword = oneWayCipherService.encrypt(password);
		//then
		Assertions.assertThat(oneWayCipherService.match(invalidPassword, encryptedPassword)).isFalse();
	}
}
