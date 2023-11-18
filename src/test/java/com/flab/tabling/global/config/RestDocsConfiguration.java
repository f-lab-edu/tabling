package com.flab.tabling.global.config;

import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.restdocs.mockmvc.MockMvcRestDocumentation;
import org.springframework.restdocs.mockmvc.RestDocumentationResultHandler;
import org.springframework.restdocs.operation.preprocess.Preprocessors;

/**
 * @TestConfiguration : Test를 위한 추가 빈 등록과 사용자 정의 가능
 */
@TestConfiguration
public class RestDocsConfiguration {
	@Bean
	public RestDocumentationResultHandler write() {
		return MockMvcRestDocumentation.document(
			"{class-name}/{method-name}", // identifier
			Preprocessors.preprocessRequest(Preprocessors.prettyPrint()),
			Preprocessors.preprocessResponse(Preprocessors.prettyPrint())
		);
	}
}
