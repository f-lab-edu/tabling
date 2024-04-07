# 테이블링 서비스

웨이팅이 필요한 식당을 편리하게 이용할 수 있는 서비스입니다.<br>
식당 이용객은 순서를 기다리기 위해 현장에서 대기하지 않아도 되며, 식당측은 간편하게 대기열을 관리할 수 있습니다.

<br>
<br>

# 기술 스택

* Backend: Java 17, Spring Boot 3.1.3, Spring Data JPA, Spring Rest Docs
* DevOps: MySQL 8.2.0, Redis, Docker, Naver Cloud Platform, Prometheus, Grafana, Ngrinder

<br>
<br>

# 인프라 구조

## 서버 아키텍처

![project_structure](https://github.com/f-lab-edu/tabling/assets/118912510/e372f8be-099f-4f53-a91e-dbbf1dbcaa77)

<br>
<br>

## CI/CD

![CI_CD_pipeline_v2](https://github.com/f-lab-edu/tabling/assets/118912510/d970452c-76b3-4756-b760-0998707827fe)

<br>
<br>

# 주요 기능 시퀀스 다이어그램

### 로그인

```mermaid
sequenceDiagram
    actor A as client
    participant AuthController
    participant AuthFacade
    participant TwoWayCipherService
    participant MemberQueryService
    participant MemberRepository
    participant OneWayCipherService
    participant SessionService
    A ->> AuthController: 로그인 요청
    AuthController ->> AuthFacade: 사용자 인증 및 세션 생성
    AuthFacade ->> TwoWayCipherService: 이메일 암호화
    AuthFacade ->> MemberQueryService: 암호화된 이메일로 사용자 조회
    MemberQueryService ->> MemberRepository: 사용자 도메인 조회
    AuthFacade ->> OneWayCipherService: 비밀번호 일치 여부 확인
    AuthFacade ->> SessionService: 사용자 식별자와 이름을 세션에 추가
```

### 식당 조회

```mermaid
sequenceDiagram
    actor A as client
    participant StoreController
    participant StoreFacade
    participant StoreQueryService
    participant StoreRepository
    A ->> StoreController: 식당 조회 요청
    StoreController ->> StoreFacade: 응답 DTO 조회
    StoreFacade ->> StoreQueryService: 응답 DTO 조회
    StoreQueryService ->> StoreRepository: 식당 도메인 조회
```

### 식당 대기

```mermaid
sequenceDiagram
    actor A as client
    participant WaitingController
    participant WaitingFacade
    participant StoreQueryService
    participant MemberQueryService
    participant WaitingService
    participant WaitingRepository
    A ->> WaitingController: 식당 대기 요청
    WaitingController ->> WaitingFacade: 대기열 생성
    WaitingFacade ->> StoreQueryService: 식당 도메인 조회
    WaitingFacade ->> MemberQueryService: 사용자 도메인 조회
    WaitingFacade ->> WaitingService: 대기열 도메인 생성
    WaitingService ->> WaitingRepository: 생성한 대기열을 DB에 저장
```

<br>
<br>

## 브랜치 전략

* [테이블링 브랜치 전략](https://github.com/f-lab-edu/tabling/wiki/%EB%B8%8C%EB%9E%9C%EC%B9%98-%EC%A0%84%EB%9E%B5)

<br>
<br>

## 유스케이스

* [테이블링 유스케이스](https://github.com/f-lab-edu/tabling/wiki/%EC%9C%A0%EC%8A%A4-%EC%BC%80%EC%9D%B4%EC%8A%A4)

<br>
<br>

## API 명세

* [API 명세 Github 페이지](https://f-lab-edu.github.io/tabling/)

<br>
<br>

# ERD

<br>
<img width="682" alt="image" src="https://github.com/f-lab-edu/tabling/assets/106499310/d9c16404-d04c-47ed-8f54-cfa4d4804736">
<br>

* [DB 설계](https://github.com/f-lab-edu/tabling/wiki/DB-%EC%84%A4%EA%B3%84#datetime-vs-timestamp)

<br>
<br>

# 트러블 슈팅

* DTO 관리 방법에 대한 고찰: 책임과 기준
* 테스트 유효성과 픽스처 관리 방법에 대한 고민
* 올바른 Enum 통신 방법
* Spring Security 없이 세션 인증 구현 : 필터와 인터셉터
* 세션 저장소를 Redis로 바꾸게 된 이유
* 식당 대기큐에서 동시성 이슈 해결
* 성능테스트와 성능 개선

