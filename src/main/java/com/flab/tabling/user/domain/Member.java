package com.flab.tabling.user.domain;

import com.flab.tabling.global.util.BaseTime;
import com.flab.tabling.user.util.RoleTypeConverter;
import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Member extends BaseTime {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull
    @Size(max = 30)
    private String name;
    @NotNull
    @Size(max = 255)
    private String email;
    @NotNull
    @Size(max = 255)
    private String password;
    @NotNull
    @Column(length = 20)
    @Convert(converter = RoleTypeConverter.class)
    private RoleType roleType;

    @Builder
    public Member(String name, String email, String password, RoleType roleType) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.roleType = roleType;
    }
}
