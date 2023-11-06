package com.flab.tabling.global.service;

import static org.junit.jupiter.api.Assertions.*;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;

import com.flab.tabling.global.exception.SessionNotFoundException;
import com.flab.tabling.global.constant.SessionConstant;

import jakarta.servlet.http.HttpSession;

@ExtendWith(MockitoExtension.class)
class SessionServiceTest {
	@InjectMocks
	SessionService sessionService;
	MockHttpServletRequest request;

	@BeforeEach
	void init() {
		request = new MockHttpServletRequest();
	}

	@Test
	@DisplayName("세션 member Id 조회 성공")
	void getIdSucess() {
		HttpSession session = request.getSession();
		session.setAttribute(SessionConstant.MEMBER_ID.name(), 1L);
		Long id = sessionService.getId(session);
		Assertions.assertThat(id).isEqualTo(1L);
	}

	@Test
	@DisplayName("세션 member Id 조회 실패 : 세션이 null")
	void getIdFailureBySessionNull() {
		HttpSession session = request.getSession(false);
		assertThrows(SessionNotFoundException.class, () -> sessionService.getId(session));
	}

	@Test
	@DisplayName("세션 member Id 조회 실패 : id key에 대한 value를 찾지 못함")
	void getIdFailureByValueNull() {
		HttpSession session = request.getSession();
		assertThrows(SessionNotFoundException.class, () -> sessionService.getId(session));
	}

	@Test
	@DisplayName("세션 member name 조회 실패 : 세션이 null")
	void getNameFailureBySessionNull() {
		HttpSession session = request.getSession(false);
		assertThrows(SessionNotFoundException.class, () -> sessionService.getName(session));
	}

	@Test
	@DisplayName("세션 member name 조회 실패 : id key에 대한 value를 찾지 못함")
	void getNameFailureByValueNull() {
		HttpSession session = request.getSession();
		assertThrows(SessionNotFoundException.class, () -> sessionService.getName(session));
	}

	@Test
	@DisplayName("세션 invalidate 성공")
	void invalidate() {
		MockHttpSession session = new MockHttpSession();
		sessionService.invalidate(session);
		Assertions.assertThat(session.isInvalid()).isTrue();
	}

	@Test
	@DisplayName("세션 키에 값 추가")
	void addKeyAndValue() {
		MockHttpSession session = new MockHttpSession();
		sessionService.add(session, SessionConstant.MEMBER_ID, 1L);
		Assertions.assertThat((Long)session.getAttribute(SessionConstant.MEMBER_ID.name())).isEqualTo(1L);
	}

}
