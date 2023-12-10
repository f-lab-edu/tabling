CREATE TABLE `member`
(
    `id`          bigint PRIMARY KEY AUTO_INCREMENT,
    `name`        varchar(30)  NOT NULL,
    `email`       varchar(255) NOT NULL COMMENT '암호화해서 저장',
    `password`    varchar(255) NOT NULL COMMENT '암호화해서 저장',
    `role_type`   varchar(20)  NOT NULL,
    `created_at`  datetime(6)  NOT NULL,
    `modified_at` datetime(6),
    `created_by`  varchar(50),
    `modified_by` varchar(50)
);

CREATE TABLE `store`
(
    `id`                bigint PRIMARY KEY AUTO_INCREMENT,
    `member_id`         bigint      NOT NULL,
    `category`          varchar(20) NOT NULL,
    `name`              varchar(30) NOT NULL,
    `description`       TEXT,
    `max_waiting_count` integer COMMENT '대기할 수 있는 최대 사람 수',
    `created_at`        datetime(6),
    `modified_at`       datetime(6),
    `created_by`        varchar(50),
    `modified_by`       varchar(50)
);

CREATE TABLE `business_hour`
(
    `id`          bigint PRIMARY KEY AUTO_INCREMENT,
    `store_id`    integer,
    `day_of_week` varchar(10),
    `start_time`  time(6),
    `end_time`    time(6),
    `created_at`  datetime(6),
    `modified_at` datetime(6),
    `created_by`  varchar(50),
    `modified_by` varchar(50)
);

CREATE TABLE `menu`
(
    `id`          bigint PRIMARY KEY AUTO_INCREMENT,
    `store_id`    bigint      NOT NULL,
    `name`        varchar(20) NOT NULL COMMENT '메뉴 이름',
    `description` TEXT,
    `price`       integer     NOT NULL COMMENT '메뉴 가격',
    `created_at`  datetime(6),
    `modified_at` datetime(6),
    `created_by`  varchar(50),
    `modified_by` varchar(50)
);

CREATE TABLE `favorite`
(
    `id`          long PRIMARY KEY AUTO_INCREMENT,
    `store_id`    long NOT NULL,
    `member_id`   long NOT NULL,
    `created_at`  datetime(6),
    `modified_at` datetime(6),
    `created_by`  varchar(50),
    `modified_by` varchar(50)
);

CREATE TABLE `waiting`
(
    `id`          bigint PRIMARY KEY AUTO_INCREMENT,
    `store_id`    bigint  NOT NULL,
    `member_id`   bigint  NOT NULL,
    `head_count`  integer NOT NULL COMMENT '예약하는 인원 수',
    `status`      varchar(20),
    `code`  varchar(50) NOT NULL COMMENT '{store_id}:{member_id}:{created_at}',
    `created_at`  datetime(6),
    `modified_at` datetime(6),
    `created_by`  varchar(50),
    `modified_by` varchar(50),
    unique(code)
);

CREATE TABLE `notice`
(
    `id`          bigint PRIMARY KEY AUTO_INCREMENT,
    `member_id`   bigint      NOT NULL,
    `title`       varchar(50) NOT NULL,
    `content`     text        NOT NULL,
    `is_deleted`  tinyint COMMENT '논리적 삭제',
    `created_at`  datetime(6) NOT NULL,
    `modified_at` datetime(6),
    `created_by`  varchar(50),
    `modified_by` varchar(50)
);

CREATE TABLE `penalty`
(
    `id`          bigint PRIMARY KEY AUTO_INCREMENT,
    `member_id`   bigint      NOT NULL,
    `type`        varchar(20),
    `created_at`  datetime(6) NOT NULL,
    `modified_at` datetime(6),
    `created_by`  varchar(50),
    `modified_by` varchar(50)
);

CREATE TABLE `point`
(
    `id`          bigint PRIMARY KEY AUTO_INCREMENT,
    `member_id`   bigint      NOT NULL,
    `amount`      integer     NOT NULL,
    `type`        varchar(20) NOT NULL,
    `created_at`  datetime(6) NOT NULL,
    `modified_at` datetime(6),
    `created_by`  varchar(50),
    `modified_by` varchar(50)
);

CREATE TABLE `address`
(
    `id`           bigint PRIMARY KEY AUTO_INCREMENT,
    `store_id`     bigint,
    `area1`        varchar(20) COMMENT '시도',
    `area2`        varchar(20) COMMENT '시군구',
    `area3`        varchar(20) COMMENT '읍면',
    `land_name`    varchar(80) COMMENT '도로명',
    `land_number1` integer COMMENT '지번본번',
    `land_number2` integer COMMENT '지번부번',
    `created_at`   datetime(6),
    `modified_at`  datetime(6),
    `created_by`   varchar(50),
    `modified_by`  varchar(50)
);

CREATE TABLE `history`
(
    `id`             bigint PRIMARY KEY AUTO_INCREMENT,
    `table_name`     varchar(30),
    `record_id`      bigint,
    `operation_type` varchar(20) COMMENT '상태값',
    `snapshot`       json,
    `created_at`     datetime(6),
    `modified_at`    datetime(6),
    `created_by`     varchar(50),
    `modified_by`    varchar(50)
);
