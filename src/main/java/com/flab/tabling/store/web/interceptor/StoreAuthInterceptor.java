package com.flab.tabling.store.web.interceptor;

import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.flab.tabling.member.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class StoreAuthInterceptor implements HandlerInterceptor {
	private final MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		String httpMethod = request.getMethod();
		if (httpMethod.equals(HttpMethod.GET.name())) {
			return true;
		}
		HttpSession session = request.getSession();
		loginValidation(session);
		memberRoleTypeValidation(session);
		return true;
	}

	private void loginValidation(HttpSession session) {
		if (session == null || session.getAttribute("MEMBER_ID") == null) { // TODO: 2023-10-07 로그인 기능 추가 후 세션 이름 교체
			throw new RuntimeException("NO_SESSION"); // TODO: 2023-10-04 커스텀 인증 예외로 교체 필요
		}
	}

	private void memberRoleTypeValidation(HttpSession session) {
		Long sessionMemberId = getSessionMemberId(session);
		boolean isSeller = memberService.isSeller(sessionMemberId);
		if (!isSeller) {
			throw new RuntimeException("INCORRECT_MEMBER_ROLE_TYPE"); // TODO: 2023-10-06 잘못된 회원 타입을 명시하는 커스텀 예외로 교체
		}
	}

	private Long getSessionMemberId(HttpSession session) {
		Object sessionMemberId = session.getAttribute("MEMBER_ID");
		boolean isLongType = sessionMemberId instanceof Long;
		if (!isLongType) {
			throw new ClassCastException("Can not cast from " + sessionMemberId + " to Long.class");
		}
		return (Long)session.getAttribute("MEMBER_ID");
	}
}
