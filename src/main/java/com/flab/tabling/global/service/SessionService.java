package com.flab.tabling.global.service;

import org.springframework.stereotype.Service;

import com.flab.tabling.global.exception.SessionNotFoundException;
import com.flab.tabling.global.session.SessionConstant;

import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {

	public Long getId(HttpSession session) {
		return (Long)getValue(session, SessionConstant.MEMBER_ID);
	}

	public String getName(HttpSession session) {
		return (String)getValue(session, SessionConstant.MEMBER_NAME);
	}

	public void add(HttpSession session, SessionConstant key, Object value) {
		session.setAttribute(key.name(), value);
	}

	private Object getValue(HttpSession session, SessionConstant key) {
		if (session == null) {
			throw new SessionNotFoundException();
		}
		Object value = session.getAttribute(key.name());
		if (value == null) {
			throw new SessionNotFoundException();
		}
		return value;
	}

	public void invalidate(HttpSession session) {
		session.invalidate();
	}
}
