package com.flab.tabling.global.config;

import static org.springframework.restdocs.mockmvc.MockMvcRestDocumentation.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.restdocs.AutoConfigureRestDocs;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.mapping.JpaMetamodelMappingContext;
import org.springframework.restdocs.RestDocumentationContextProvider;
import org.springframework.restdocs.RestDocumentationExtension;
import org.springframework.restdocs.mockmvc.RestDocumentationResultHandler;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.flab.tabling.store.web.config.StoreWebConfig;
import com.flab.tabling.store.web.interceptor.StoreAuthInterceptor;

/**
 * @Import : Configuration을 두개 이상 사용하는 경우 하나의 설정을 도입하는 어노테이션
 * @AutoConfigureMockMvc : mockMvc의 auto configuration 가능, 테스트 클래스에서 활용 가능
 * @MockBean(JpaMetamodelMappingContext.class) : JpaMetamodelMappingContext를 MockBean으로 추가
 *
 */
@Import(RestDocsConfiguration.class)
@AutoConfigureMockMvc(addFilters = false)
@AutoConfigureRestDocs
@ExtendWith(RestDocumentationExtension.class)
// @MockBean(JpaMetamodelMappingContext.class)
public abstract class AbstractRestDocsTest {
	@MockBean
	private StoreAuthInterceptor storeAuthInterceptor;
	@MockBean
	private WebConfig webConfig;
	@MockBean
	private StoreWebConfig storeWebConfig;
	@Autowired
	protected RestDocumentationResultHandler restDocs;
	@Autowired
	protected MockMvc mockMvc;
	@Autowired
	protected ObjectMapper objectMapper;
	@BeforeEach
	void setUp(
		final WebApplicationContext context,
		final RestDocumentationContextProvider restDocumentation) {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(context)
			.apply(documentationConfiguration(restDocumentation))
			.alwaysDo(MockMvcResultHandlers.print())
			.alwaysDo(restDocs)
			.addFilters(new CharacterEncodingFilter("UTF-8", true))
			.build();
	}

}
