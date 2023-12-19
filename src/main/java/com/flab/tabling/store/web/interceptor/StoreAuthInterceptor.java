package com.flab.tabling.store.web.interceptor;

import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.flab.tabling.global.constant.SessionConstant;
import com.flab.tabling.global.exception.AuthorizationException;
import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.member.exception.MemberNotFoundException;
import com.flab.tabling.member.service.MemberQueryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class StoreAuthInterceptor implements HandlerInterceptor {
	private final MemberQueryService memberQueryService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		String httpMethod = request.getMethod();
		if (httpMethod.equals(HttpMethod.GET.name())) {
			return true;
		}
		HttpSession session = request.getSession();
		memberRoleTypeValidation(session);
		return true;
	}

	private void memberRoleTypeValidation(HttpSession session) {
		Long sessionMemberId = getSessionMemberId(session);
		boolean isSeller = memberQueryService.isSeller(sessionMemberId);
		if (!isSeller) {
			throw new AuthorizationException(ErrorCode.AUTHORIZATION_FAILED, "member is not a seller");
		}
	}

	private Long getSessionMemberId(HttpSession session) {
		Object sessionMemberId = session.getAttribute(SessionConstant.MEMBER_ID.name());
		boolean isLongType = sessionMemberId instanceof Long;
		if (!isLongType) {
			throw new MemberNotFoundException(ErrorCode.MEMBER_NOT_FOUND, "member is not found");
		}
		return (Long)session.getAttribute(SessionConstant.MEMBER_ID.name());
	}
}
