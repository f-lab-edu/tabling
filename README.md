# 프로젝트 소개
사용자에게 식당 대기 신청을 제공하고 사용자의 대기 순서를 관리하는 서비스입니다.

<br>
<br>
<br>

# 기술 스택 
* Java 17, Spring Boot, Spring Data JPA, MySQL 8.2.0, Redis, Naver Cloud Platform , Ngrinder , Docker , Spring Rest Docs , Grafana

<br>
<br>
<br>

# 주요 기능
* 식당 등록 및 세부정보 조회
* 사용자 식당 대기 신청 및 취소
* 회원가입 및 로그인

<br>
<br>
<br>

## 유스케이스
* [테이블링 유스케이스](https://github.com/f-lab-edu/tabling/wiki/%EC%9C%A0%EC%8A%A4-%EC%BC%80%EC%9D%B4%EC%8A%A4)

## API 명세
* [API 명세 Github 페이지](https://f-lab-edu.github.io/tabling/)

<br>
<br>
<br>

# ERD
<br>
<img width="682" alt="image" src="https://github.com/f-lab-edu/tabling/assets/106499310/d9c16404-d04c-47ed-8f54-cfa4d4804736">
<br>

* [DB 설계](https://github.com/f-lab-edu/tabling/wiki/DB-%EC%84%A4%EA%B3%84#datetime-vs-timestamp)



# 인프라 구조
## 서버 아키텍처
<img width="944" alt="image" src="https://github.com/f-lab-edu/tabling/assets/106499310/aaea7263-b263-416d-9ee3-c909cf919cff">

<br>
<br>
<br>

## CI/CD
<img width="774" alt="image" src="https://github.com/f-lab-edu/tabling/assets/106499310/33050d07-d698-48ab-ad7c-335a4275c88d">

<br>
<br>
<br>

# 트러블 슈팅
* DTO 관리 방법에 대한 고찰: 책임과 기준
* Spring Security 없이 세션 인증 구현 : 필터와 인터셉터 
* 세션 저장소를 Redis로 바꾸게 된 이유
* 식당 대기큐에서 동시성 이슈 해결
* 성능테스트와 성능 개선

