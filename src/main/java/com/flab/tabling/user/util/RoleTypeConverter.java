package com.flab.tabling.user.util;

import com.flab.tabling.user.domain.RoleType;
import jakarta.persistence.AttributeConverter;

public class RoleTypeConverter implements AttributeConverter<RoleType, String> {
    @Override
    public String convertToDatabaseColumn(RoleType attribute) {
        return attribute.getCode();
    }

    @Override
    public RoleType convertToEntityAttribute(String dbData) {
        return RoleType.ofRole(dbData);
    }
}
