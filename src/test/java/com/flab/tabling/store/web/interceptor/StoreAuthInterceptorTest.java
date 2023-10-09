package com.flab.tabling.store.web.interceptor;

import static org.assertj.core.api.Assertions.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpMethod;
import org.springframework.mock.web.MockHttpServletRequest;

@ExtendWith(MockitoExtension.class)
class StoreAuthInterceptorTest {

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
}
