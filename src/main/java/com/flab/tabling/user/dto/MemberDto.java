package com.flab.tabling.user.dto;

import com.flab.tabling.user.domain.RoleType;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

@Getter
public class MemberDto {
    @NotNull(message = "NO_NICKNAME")
    private String name;
    @Email(message = "INVALID_EMAIL")
    private String email;

    private RoleType roleType;

    @Min(value = 8, message = "INVALID_PASSWORD")
    private String password;
}
