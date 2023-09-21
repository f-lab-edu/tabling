package com.flab.tabling.user.dto;

import com.flab.tabling.user.domain.RoleType;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;

/**
 * @NotNull : null이 아니어야 한다.
 * @Size : 문자열 길이 유효성 검증
 * @Length : 문자열 길이 유효성 검증, hibernate 구현체에 의존
 * @Email : 이메일 주소 형식인지 검증
 * @Enumerated :
 */
@Getter
public class MemberDto {
	@NotNull(message = "NO_NICKNAME")
	@Size(min = 1, max = 30, message = "INVALID_NAME")
	private String name;
	@NotNull
	@Email(message = "INVALID_EMAIL")
	private String email;
	@NotNull(message = "NO_ROLE_TYPE")
	private RoleType roleType;
	@NotNull(message = "NO_PASSWORD")
	@Size(min = 8, message = "INVALID_PASSWORD")
	private String password;
}
