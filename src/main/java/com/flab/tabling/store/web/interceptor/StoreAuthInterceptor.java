package com.flab.tabling.store.web.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.flab.tabling.member.service.RoleTypeCheckService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class StoreAuthInterceptor implements HandlerInterceptor {
	private final RoleTypeCheckService roleTypeCheckService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("LOGIN_SESSION") == null) { // TODO: 2023-10-07 로그인 기능 추가 후 세션 이름 교체
			throw new RuntimeException("NO_SESSION"); // TODO: 2023-10-04 커스텀 인증 예외로 교체 필요
		}

		Object sessionValue = session.getAttribute("LOGIN_SESSION"); // TODO: 2023-10-07 로그인 기능 추가 후 세션 이름 교체
		Long loginMemberId = Long.valueOf(sessionValue.toString());
		boolean isSeller = roleTypeCheckService.isSeller(loginMemberId);
		if (!isSeller) {
			throw new RuntimeException("INCORRECT_MEMBER_ROLE_TYPE"); // TODO: 2023-10-06 잘못된 회원 타입을 명시하는 커스텀 예외로 교체
		}
		return true;
	}
}
