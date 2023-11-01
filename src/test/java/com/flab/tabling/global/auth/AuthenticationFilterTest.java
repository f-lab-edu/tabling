package com.flab.tabling.global.auth;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.io.IOException;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.boot.autoconfigure.h2.H2ConsoleProperties;
import org.springframework.http.HttpMethod;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.web.servlet.MockMvc;

import com.flab.tabling.global.env.SecurityCredentials;
import com.flab.tabling.global.env.TablingProperties;
import com.flab.tabling.global.session.SessionConstant;
import com.flab.tabling.member.exception.AuthenticationException;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@ExtendWith(MockitoExtension.class)
class AuthenticationFilterTest {
	@InjectMocks
	private AuthenticationFilter authenticationFilter;
	@Mock
	private TablingProperties tablingProperties = new TablingProperties();
	@Mock
	private H2ConsoleProperties h2ConsoleProperties = new H2ConsoleProperties();

	@Mock
	private FilterChain filterChain;

	MockMvc mockMvc;

	@BeforeEach
	void init() {
		tablingProperties.setSecurityCredentials(new SecurityCredentials());
		doReturn("/login").when(tablingProperties).getLoginPath();
		doReturn(HttpMethod.POST).when(tablingProperties).getLoginMethod();
		doReturn("/members").when(tablingProperties).getMemberAddPath();
		doReturn(HttpMethod.POST).when(tablingProperties).getMemberAddMethod();
		doReturn("/h2-console").when(h2ConsoleProperties).getPath();
	}

	@DisplayName("인증 필요 없는 요청 테스트")
	@Test
	void checkUnAuthenticatedRequest() throws ServletException, IOException {
		List<String> requestURIs = List.of("/login", "/members", "/h2-console", "/h2-console/test");
		List<String> httpMethods = List.of(HttpMethod.POST.name(), HttpMethod.POST.name(), HttpMethod.GET.name(),
			HttpMethod.PUT.name());
		for (int index = 0; index < requestURIs.size(); index++) {
			HttpServletRequest request = new MockHttpServletRequest(httpMethods.get(index), requestURIs.get(index));
			HttpServletResponse response = new MockHttpServletResponse();
			authenticationFilter.doFilter(request, response, filterChain);
		}
		verify(filterChain, times(requestURIs.size())).doFilter(any(), any());
	}

	@DisplayName("인증 필요한 요청 예외 발생 테스트")
	@Test
	void checkAuthenticatedRequestFailure() throws ServletException, IOException {
		List<String> requestURIs = List.of("/loginl", "/members", "/h2-consolel", "/members");
		List<String> httpMethods = List.of(HttpMethod.POST.name(), HttpMethod.GET.name(), HttpMethod.PUT.name(),
			HttpMethod.PUT.name());
		for (int index = 0; index < requestURIs.size(); index++) {
			HttpServletRequest request = new MockHttpServletRequest(httpMethods.get(index), requestURIs.get(index));
			HttpServletResponse response = new MockHttpServletResponse();
			assertThrows(AuthenticationException.class,
				() -> authenticationFilter.doFilter(request, response, filterChain));
		}
	}

	@DisplayName("인증 필요한 요청 정상 처리 테스트")
	@Test
	void checkAuthenticatedRequestSuccess() throws ServletException, IOException {
		List<String> requestURIs = List.of("/loginl", "/members", "/h2-consolel", "/members");
		List<String> httpMethods = List.of(HttpMethod.POST.name(), HttpMethod.GET.name(), HttpMethod.PUT.name(),
			HttpMethod.PUT.name());
		for (int index = 0; index < requestURIs.size(); index++) {
			HttpServletRequest request = new MockHttpServletRequest(httpMethods.get(index), requestURIs.get(index));
			HttpSession session = request.getSession();
			session.setAttribute(SessionConstant.MEMBER_ID.name(), 1L);
			HttpServletResponse response = new MockHttpServletResponse();
			authenticationFilter.doFilter(request, response, filterChain);
		}
		verify(filterChain, times(requestURIs.size())).doFilter(any(), any());
	}

}
