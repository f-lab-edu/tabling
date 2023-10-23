package com.flab.tabling.store.web.interceptor;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpMethod;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;

@ExtendWith(MockitoExtension.class)
class StoreAuthInterceptorTest {
	private final String NOT_LONG_TYPE = "NOT_LONG_TYPE";
	@InjectMocks
	private StoreAuthInterceptor storeAuthInterceptor;

	@Test
	@DisplayName("요청 메서드가 GET이라면 검증 로직을 수행하지 않는다.")
	void doNotConductAuthLogicWithGetMethod() {
		//given
		MockHttpServletRequest requestMock = new MockHttpServletRequest();
		requestMock.setMethod(HttpMethod.GET.name());

		//when
		boolean result = storeAuthInterceptor.preHandle(requestMock, null, null);

		//then
		assertThat(result).isTrue();
	}

	@Test
	@DisplayName("세션 Id 타입이 Long 타입이 아니라면 형변환 예외가 발생한다.")
	void canNotCastSessionMemberId() {
		//given
		MockHttpSession sessionMock = new MockHttpSession();
		sessionMock.setAttribute("LOGIN_SESSION", NOT_LONG_TYPE); // TODO: 2023-10-07 로그인 기능 추가 후 세션 이름 교체

		MockHttpServletRequest requestMock = new MockHttpServletRequest();
		requestMock.setMethod(HttpMethod.POST.name());
		requestMock.setSession(sessionMock);

		//expected
		assertThrows(ClassCastException.class, () -> storeAuthInterceptor.preHandle(requestMock, null, null));
	}
}
