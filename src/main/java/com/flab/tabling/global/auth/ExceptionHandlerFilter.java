package com.flab.tabling.global.auth;

import java.io.IOException;

import org.springframework.http.MediaType;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.flab.tabling.global.exception.BusinessException;
import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.global.exception.ErrorResponse;
import com.flab.tabling.member.exception.AuthenticationException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
public class ExceptionHandlerFilter implements Filter {
	private final ObjectMapper objectMapper;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws
		IOException,
		ServletException {
		try {
			chain.doFilter(request, response);
		} catch (AuthenticationException e) {
			setErrorResponse(response, e);
		} catch (Exception e) {
			log.warn(e.getMessage(), e);
			throw e;
		}
	}

	private void setErrorResponse(ServletResponse response, BusinessException ex) {
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		httpResponse.setStatus(ex.getErrorCode().getStatus());
		response.setContentType(MediaType.APPLICATION_JSON_VALUE);
		ErrorResponse errorResponse = new ErrorResponse(ex.getErrorCode(), ex.getMessage());
		try {
			response.getWriter().write(objectMapper.writeValueAsString(errorResponse));
		} catch (IOException e) {
			log.warn(e.getMessage(), e);
		}
	}
}
