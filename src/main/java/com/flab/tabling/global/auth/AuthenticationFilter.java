package com.flab.tabling.global.auth;

import java.io.IOException;

import org.springframework.http.HttpMethod;
import org.springframework.util.PatternMatchUtils;

import com.flab.tabling.global.session.SessionConstant;
import com.flab.tabling.member.exception.AuthenticationException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class AuthenticationFilter implements Filter {
	private static final String h2ConsolePath = "/h2-console*";
	private static final String[] whiteList = {"/login", "/members"};

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws
		IOException,
		ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession(false);
		if (isAuthenticationCheckPath(httpRequest)) {
			if (session == null || session.getAttribute(SessionConstant.MEMBER_ID.getKey()) == null) {
				throw new AuthenticationException();
			}
		}
		chain.doFilter(request, response);
	}

	private boolean isAuthenticationCheckPath(HttpServletRequest request) {
		return !(PatternMatchUtils.simpleMatch(whiteList, request.getRequestURI())
			&& request.getMethod().equals(HttpMethod.POST.name()) ||
			PatternMatchUtils.simpleMatch(h2ConsolePath, request.getRequestURI()));
	}

}
