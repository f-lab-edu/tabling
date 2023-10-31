package com.flab.tabling.store.web.interceptor;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpMethod;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;

import com.flab.tabling.member.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;

@ExtendWith(MockitoExtension.class)
class StoreAuthInterceptorTest {
	private final String NOT_LONG_TYPE = "NOT_LONG_TYPE";
	@InjectMocks
	private StoreAuthInterceptor storeAuthInterceptor;
	@Mock
	private MemberService memberService;

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
	@DisplayName("로그인한 Member의 RoleType이 SELLER라면 true를 반환한다.")
	void authSuccessWithSeller() throws Exception {
		//given
		MockHttpSession sessionMock = new MockHttpSession();
		sessionMock.setAttribute("LOGIN_SESSION", 1L); // TODO: 2023-10-07 로그인 기능 추가 후 세션 이름 교체

		MockHttpServletRequest requestMock = new MockHttpServletRequest();
		requestMock.setMethod(HttpMethod.POST.name());
		requestMock.setSession(sessionMock);

		doReturn(true).when(memberService)
			.isSeller(1L);

		//when
		boolean result = storeAuthInterceptor.preHandle(requestMock, null, null);

		//then
		assertThat(result).isTrue();
	}

	@DisplayName("로그인한 Member의 RoleType이 SELLER가 아니라면 false를 반환한다.")
	void authFailWithNotSeller() throws Exception {
		//given
		HttpServletRequest requestMock = Mockito.mock(HttpServletRequest.class);
		MockHttpSession sessionMock = new MockHttpSession();
		sessionMock.setAttribute("LOGIN_SESSION", 1L); // TODO: 2023-10-07 로그인 기능 추가 후 세션 이름 교체

		doReturn(sessionMock).when(requestMock)
			.getSession();
		doReturn(false).when(memberService)
			.isSeller(1L);

		//expected todo 커스텀 인증예외로 교체 필요
		assertThrows(RuntimeException.class, () -> storeAuthInterceptor.preHandle(requestMock, null, null));
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

	@Test
	@DisplayName("요청에 세션이 존재하지 않으면 예외가 발생한다.")
	void authFailWithNoSession() {
		//given
		HttpServletRequest requestMock = Mockito.mock(HttpServletRequest.class);

		//expected todo 커스텀 인증예외로 교체 필요
		assertThrows(RuntimeException.class, () -> storeAuthInterceptor.preHandle(requestMock, null, null));
	}

	@Test
	@DisplayName("세션은 존재하지만 인증 받지 않은 요청이 접근하면 예외가 발생한다.")
	void authFailWithNotCertifiedRequest() {
		//given
		MockHttpServletRequest requestMock = new MockHttpServletRequest();
		requestMock.setSession(new MockHttpSession());

		//expected todo 커스텀 인증예외로 교체 필요
		assertThrows(RuntimeException.class, () -> storeAuthInterceptor.preHandle(requestMock, null, null));
	}
}
