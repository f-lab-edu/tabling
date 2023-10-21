package com.flab.tabling.global.util;

import java.util.Optional;

import org.springframework.data.domain.AuditorAware;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.flab.tabling.global.session.SessionConstant;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.exception.MemberNotFoundException;
import com.flab.tabling.member.repository.MemberRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class LoginMemberAuditorAware implements AuditorAware<String> {
	private final MemberRepository memberRepository;
	private final String signInURI = "/members";

	@Override
	public Optional<String> getCurrentAuditor() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpSession session = request.getSession(false);
		if (request.getMethod().equals(HttpMethod.POST.name())
			&& request.getRequestURI().equals(signInURI)) {
			String name = (String)session.getAttribute(SessionConstant.MEMBER_NAME.getKey());
			return Optional.of(name);
		}
		Member member = memberRepository.findById((Long)session.getAttribute(SessionConstant.MEMBER_ID.getKey()))
			.orElseThrow(MemberNotFoundException::new);
		return Optional.of(member.getName());
	}
}
