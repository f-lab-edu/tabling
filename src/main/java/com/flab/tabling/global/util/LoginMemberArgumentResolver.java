package com.flab.tabling.global.util;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.flab.tabling.global.session.SessionConstant;
import com.flab.tabling.member.exception.AuthenticationException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class LoginMemberArgumentResolver implements HandlerMethodArgumentResolver {
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		boolean hasLoginAnnotation = parameter.hasParameterAnnotation(Login.class);
		boolean hasMemberInfoType = MemberInfo.class.isAssignableFrom(parameter.getParameterType());
		return hasLoginAnnotation && hasMemberInfoType;
	}

	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
		NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		HttpServletRequest request = (HttpServletRequest)webRequest.getNativeRequest();
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute(SessionConstant.MEMBER_ID.getKey()) == null) {
			throw new AuthenticationException();
		}
		Long id = (Long)session.getAttribute(SessionConstant.MEMBER_ID.getKey());
		MemberInfo memberInfo = new MemberInfo(id);
		return memberInfo;
	}
}
