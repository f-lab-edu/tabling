package com.flab.tabling.global.auth;

import java.io.IOException;

import org.springframework.boot.autoconfigure.h2.H2ConsoleProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.http.HttpMethod;
import org.springframework.util.PatternMatchUtils;

import com.flab.tabling.global.constant.SessionConstant;
import com.flab.tabling.global.env.SecurityProperties;
import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.member.exception.AuthenticationException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@EnableConfigurationProperties({SecurityProperties.class})
@RequiredArgsConstructor
public class AuthenticationFilter implements Filter {
	private final SecurityProperties securityProperties;
	private final H2ConsoleProperties h2ConsoleProperties;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws
		IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession(false);
		if (isAuthenticationRequired(httpRequest)) {
			if (session == null || session.getAttribute(SessionConstant.MEMBER_ID.name()) == null) {
				throw new AuthenticationException(ErrorCode.AUTHENTICATION_FAILED, "authentication is failed");
			}
		}
		chain.doFilter(request, response);
	}

	private boolean isAuthenticationRequired(HttpServletRequest request) {
		boolean isH2ConsolePath = startsWith(request, h2ConsoleProperties.getPath());
		boolean isLogin = matches(request, securityProperties.getLoginMethod(), securityProperties.getLoginPath());
		boolean isMemberCreation = matches(request, securityProperties.getMemberAddMethod(),
			securityProperties.getMemberAddPath());
		return !(isH2ConsolePath || isLogin || isMemberCreation);
	}

	private boolean matches(HttpServletRequest request, HttpMethod httpMethod, String pattern) {
		boolean isMatchedURI = PatternMatchUtils.simpleMatch(pattern, request.getRequestURI());
		boolean isMatchedMethod = request.getMethod().equals(httpMethod.name());
		return isMatchedURI && isMatchedMethod;
	}

	private boolean startsWith(HttpServletRequest request, String pattern) {
		boolean isRootURI = PatternMatchUtils.simpleMatch(pattern, request.getRequestURI());
		boolean isSubURI = PatternMatchUtils.simpleMatch(pattern + "/*", request.getRequestURI());
		return isRootURI || isSubURI;
	}

}
