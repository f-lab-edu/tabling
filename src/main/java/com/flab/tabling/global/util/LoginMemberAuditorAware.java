package com.flab.tabling.global.util;

import java.util.Optional;

import org.springframework.data.domain.AuditorAware;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.flab.tabling.global.env.SecurityProperties;
import com.flab.tabling.member.repository.MemberRepository;
import com.flab.tabling.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class LoginMemberAuditorAware implements AuditorAware<String> {
	private final MemberRepository memberRepository;
	private final SessionService sessionService;
	private final SecurityProperties securityProperties;

	@Override
	public Optional<String> getCurrentAuditor() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpSession session = request.getSession(false);
		String name = sessionService.getName(session);
		return Optional.of(name);
	}
}
