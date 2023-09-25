package com.flab.tabling.user.domain;

import java.util.Arrays;
import java.util.NoSuchElementException;

import lombok.Getter;

@Getter
public enum RoleType {
	CUSTOMER, ADMIN, SELLER;
}
