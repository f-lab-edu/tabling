# 테이블링 서비스

**현장에서 직접 대기하지 않고, 식당에 대기 할 수 있는 서비스**

* 식당 이용객은 순서를 기다리기 위해 현장에서 대기하지 않아도 된다.
* 식당측은 간편하게 대기열을 관리할 수 있다.

<br>
<br>
<br>
<br>
<br>

## 기술 스택

* Backend: `Java 17`, `Spring Boot 3.1.3`, `Spring Data JPA`, `Spring Rest Docs`
* DevOps: `MySQL 8.2.0`, `Redis`, `Docker`, `Naver Cloud Platform`, `Prometheus`, `Grafana`, `Ngrinder`

<br>
<br>
<br>
<br>
<br>

## 인프라 아키텍처

![project_structure](https://github.com/user-attachments/assets/e5669be8-c2e7-41b3-8a4f-c222a15a6644)

<br>
<br>
<br>
<br>
<br>

## 시퀀스 다이어그램

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
<br>
<br>
<br>

## 프로젝트 컨벤션

* [객체지향 설계를 위한 규칙](https://github.com/f-lab-edu/tabling/wiki/Convention#객체지향-설계)
* [커밋 메시지 규칙](https://github.com/f-lab-edu/tabling/wiki/Convention#commit-message)
* [PR 규칙](https://github.com/f-lab-edu/tabling/wiki/Convention#pr-guideline)
* [코딩 스타일](https://github.com/f-lab-edu/tabling/wiki/Convention#java-coding-style)
* [빌더 패턴 규칙](https://github.com/f-lab-edu/tabling/wiki/Convention#builder-pattern)
* [브랜치 전략](https://github.com/f-lab-edu/tabling/wiki/브랜치-전략#github-flow)
* [유스케이스](https://github.com/f-lab-edu/tabling/wiki/유스-케이스)

<br>
<br>

## 문제 해결 및 성능 개선
* [식당 대기 시스템의 동시성 문제 해결 및 성능 개선](https://github.com/f-lab-edu/tabling/wiki/식당-대기-시스템의-동시성-문제-해결-및-성능-개선)
* [Java 21 마이그레이션 및 Virtual thread 성능 측정](https://github.com/f-lab-edu/tabling/wiki/Java-21-마이그레이션-및-Virtual-thread-성능-측정)

<br>
<br>

## 트레이드 오프 및 고찰
* [테스트 커버리지 비율 80%를 달성한 후 생긴 고민](https://github.com/f-lab-edu/tabling/wiki/테스트-커버리지-비율-80%25를-달성한-후-생긴-고민)
* [DTO 관리 전략: 외부 클래스와 정적 중접 클래스](https://github.com/f-lab-edu/tabling/wiki/DTO-관리-전략:-외부-클래스와-정적-중첩-클래스)

<br>
<br>
<br>
<br>
<br>

## ERD

<br>
<img width="682" alt="image" src="https://github.com/user-attachments/assets/d611af9e-4593-4bfb-b054-fbe3b600bf36">
<br>

* [DB 설계](https://github.com/f-lab-edu/tabling/wiki/DB-%EC%84%A4%EA%B3%84#datetime-vs-timestamp)

<br>
<br>


