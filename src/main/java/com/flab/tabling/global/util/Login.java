package com.flab.tabling.global.util;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @Target : 어노테이션을 적용할 대상을 지정
 * @Retention : 어노테이션의 지속 시간을 결정하는데 사용한다.
 * RetentionPolicy.RUNTIME : 클래스 파일에 존재, 실행 시 사용, 지속 시간이 가장 길다.
 */

@Target(ElementType.PARAMETER)
@Retention(RetentionPolicy.RUNTIME)
public @interface Login {

}
