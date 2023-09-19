package com.flab.tabling.user.domain;

import java.util.Arrays;
import java.util.NoSuchElementException;
import lombok.Getter;

@Getter
public enum RoleType {
    CUSTOMER("ROLE_CUSTOMER"), ADMIN("ROLE_ADMIN"), STORE("ROLE_STORE");

    private final String code;
    RoleType(String code) {
        this.code = code;
    }

    public static RoleType ofRole(String code) {
        return Arrays.stream(RoleType.values())
                .filter((e -> e.getCode().equals(code)))
                .findAny()
                .orElseThrow(NoSuchElementException::new);
    }


}
