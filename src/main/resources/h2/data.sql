-- 사용자
INSERT
INTO member
(id, name, email, password, role_type, created_at, modified_at, created_by, modified_by)
VALUES (1, '관리자', '$2a$10$ZfjDzRbZgEIzQcijDwS0v.8XcMxwVmVU7twnkjpJqGzX8MjqBYTAC',
        '$2a$10$NGg5NhI4uHS1WFDl92QakONnG5s6nbVj8jKL5t1OTmkjcceL7TZXm', 'ADMIN', '2023-09-17', null, null, null);
INSERT
INTO member
(id, name, email, password, role_type, created_at, modified_at, created_by, modified_by)
VALUES (2, '식당사장A', '$2a$10$8LBlz0VBco/iJaPQ4fCd.OXDN0PL45MaQMFEMSm52tErlP08AO5Ey',
        '$2a$10$0Jp1lNstfC2C2WfoDoJox.Qsk5v1zySXCHts6AlvYealUKswGiP1y', 'SELLER', '2023-09-18', null, null, null);
INSERT
INTO member
(id, name, email, password, role_type, created_at, modified_at, created_by, modified_by)
VALUES (3, '식당사장B', '$2a$10$aK0B/nk2X54YwFcfFQP4UOCfjqkC.HYXoeJ9Q7u.a7xfkmiqXTmMe',
        '$2a$10$u5orIwBDxTXNrFdcYnbC0OLJbAQl2gwsypbMUhC3sec4bghhvcJa2', 'SELLER', '2023-09-19', null, null, null);
INSERT
INTO member
(id, name, email, password, role_type, created_at, modified_at, created_by, modified_by)
VALUES (4, '일반사용자A', '$2a$10$62ciJVk8M.pkWhY.Wg93ourJGQUJYLR.HZ9FhhZwdjaB4/lIcAzYG',
        '$2a$10$mZHX5D/rR.MIebDlDwsrz.PhQic60ClnqaCC.yn/g0WUE.oW7SBFu', 'CUSTOMER', '2023-09-19', null, null,
        null);
INSERT
INTO member
(id, name, email, password, role_type, created_at, modified_at, created_by, modified_by)
VALUES (5, '일반사용자B', '$2a$10$9jMwfm1VrV1ZhRLjwaUiy.7YJbDkqXcLdm5pinKhvbtjdFbKvQ99i',
        '$2a$10$s.Llje0qHdj3HI3/NggnvuN0k5ua2at80.h7q.jtI.uTUZY.DhhCC', 'CUSTOMER', '2023-09-19', null, null,
        null);
INSERT
INTO member
(id, name, email, password, role_type, created_at, modified_at, created_by, modified_by)
VALUES (6, '일반사용자C', '$2a$10$.rpLS7LeaNG3U1tfx8ble.EVy72AVbbjdkfN63rwyifr5fyJoP/ea',
        '$2a$10$jgxvYu4Qs5BeBRfBkRVUzeI3tnozZbZAv3KUaoyPOenJN4zajePSS', 'CUSTOMER', '2023-09-20', null, null,
        null);
INSERT
INTO member
(id, name, email, password, role_type, created_at, modified_at, created_by, modified_by)
VALUES (7, '일반사용자D', '$2a$10$PRrVaDyflXeR/kB1L.zAheEXHpQ.ybyb0wWasV6sK9Kp.NfJ8Ak6S',
        '$2a$10$6d0ln9fIVTQljT7PAjvNh.3.82AP5bmtEKiggzJNKCGuzBthicbPO', 'CUSTOMER', '2023-09-20', null, null,
        null);
INSERT
INTO member
(id, name, email, password, role_type, created_at, modified_at, created_by, modified_by)
VALUES (8, '일반사용자E', '$2a$10$6LVfRXnFgD40otvXD5v5DeUYR21KaE38G1uj4Fmbyty391Prun1mu',
        '$2a$10$Ff48rwa/BfGZvNfVlIML1uFxeldF5X13ZMnlY8QaJ0D87n0M5JR0G', 'CUSTOMER', '2023-09-20', null, null,
        null);
INSERT
INTO member
(id, name, email, password, role_type, created_at, modified_at, created_by, modified_by)
VALUES (9, '일반사용자F', '$2a$10$HNCm9XsZav7dWrDc3XQmRelhHxLNXgAnGRq2ZgUo/9U.Q.jVO7vbe',
        '$2a$10$kfpWXBHEAcC5hJrj3K6NvutQK9QTCCHKgn4g7wokcz4TUVGjiOuZ2', 'CUSTOMER', '2023-09-20', null, null,
        null);
INSERT
INTO member
(id, name, email, password, role_type, created_at, modified_at, created_by, modified_by)
VALUES (10, '일반사용자G', '$2a$10$V1nmXxqvSXzRPWZ9iMJweuLFTQ4iyqwMMrz73Q4DocOD2Xf9DMYgS',
        '$2a$10$cOhTOagX5Q9/Jdf7hRWxJOjicBm1JCHUnvURqG26GwyXmrTF99e8O', 'CUSTOMER', '2023-09-21', null, null,
        null);

-- 식당
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (1, 2, '중식', '식당A', 'xx대학교 북문 앞 중식당입니다.', 10, '2023-09-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (2, 3, '분식', '식당B', 'xx역 x번 출구 앞에 위치한 분식점입니다.', 10, '2023-09-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (3, 2, '양식', '식당C', 'xx해변에 위치한 레스토랑 입니다.', 30, '2023-09-19', null, null, null);

-- 영업 시간
INSERT
INTO business_hour
(id, store_id, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (1, 1, '08:00:00', '21:00:00', '2023-09-18', null, null, null);
INSERT
INTO business_hour
(id, store_id, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (2, 2, '09:00:00', '15:00:00', '2023-09-19', null, null, null);
INSERT
INTO business_hour
(id, store_id, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (3, 2, '18:00:00', '01:00:00', '2023-09-19', null, null, null);
INSERT
INTO business_hour
(id, store_id, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (4, 3, '11:00:00', '16:00:00', '2023-09-19', null, null, null);
INSERT
INTO business_hour
(id, store_id, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (5, 3, '18:00:00', '23:00:00', '2023-09-19', null, null, null);

-- 메뉴
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (1, 1, '자장면', '자장면 입니다.', 6000, '2023-09-18', null, null, null);
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (2, 1, '짬뽕', '짬뽕 입니다.', 10000, '2023-09-18', null, null, null);
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (3, 1, '볶음밥', '볶음밥 입니다.', 8000, '2023-09-18', null, null, null);
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (4, 1, '탕수육', '탕수육 입니다.', 21000, '2023-09-18', null, null, null);
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (5, 2, '떡볶이', '떡볶이 입니다.', 3500, '2023-09-19', null, null, null);
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (6, 2, '어묵', '어묵 입니다.', 500, '2023-09-19', null, null, null);
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (7, 2, '순대', '순대 입니다.', 5000, '2023-09-19', null, null, null);
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (8, 2, '모둠튀김', '모둠튀김 입니다.', 5500, '2023-09-19', null, null, null);
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (9, 3, '알리오올리오', '알리오올리오 입니다.', 11000, '2023-09-19', null, null, null);
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (10, 3, '봉골레파스타', '봉골레파스타 입니다.', 13000, '2023-09-19', null, null, null);
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (11, 3, '크림파스타', '크림파스타 입니다.', 14000, '2023-09-19', null, null, null);
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (12, 3, '토마토파스타', '토마토파스타 입니다.', 13000, '2023-09-19', null, null, null);
INSERT
INTO menu
(id, store_id, name, description, price, created_at, modified_at, created_by, modified_by)
VALUES (13, 3, '마르게리타피자', '마르게리타피자 입니다.', 18000, '2023-09-19', null, null, null);
-- 좋아요
INSERT
INTO favorite
(id, store_id, member_id, created_at, modified_at, created_by, modified_by)
VALUES (1, 2, 4, '2023-09-23', null, null, null);
INSERT
INTO favorite
(id, store_id, member_id, created_at, modified_at, created_by, modified_by)
VALUES (2, 3, 4, '2023-09-25', null, null, null);
INSERT
INTO favorite
(id, store_id, member_id, created_at, modified_at, created_by, modified_by)
VALUES (3, 1, 7, '2023-09-25', null, null, null);
INSERT
INTO favorite
(id, store_id, member_id, created_at, modified_at, created_by, modified_by)
VALUES (4, 2, 8, '2023-09-25', null, null, null);
INSERT
INTO favorite
(id, store_id, member_id, created_at, modified_at, created_by, modified_by)
VALUES (5, 2, 10, '2023-09-26', null, null, null);
INSERT
INTO favorite
(id, store_id, member_id, created_at, modified_at, created_by, modified_by)
VALUES (6, 2, 2, '2023-09-27', null, null, null);

-- 웨이팅
INSERT
INTO waiting
(id, store_id, member_id, head_count, created_at, modified_at, created_by, modified_by)
VALUES (1, 1, 4, 3, '2023-09-28', null, null, null);
INSERT
INTO waiting
(id, store_id, member_id, head_count, created_at, modified_at, created_by, modified_by)
VALUES (2, 1, 5, 4, '2023-09-28', null, null, null);
INSERT
INTO waiting
(id, store_id, member_id, head_count, created_at, modified_at, created_by, modified_by)
VALUES (3, 1, 6, 6, '2023-09-28', null, null, null);
INSERT
INTO waiting
(id, store_id, member_id, head_count, created_at, modified_at, created_by, modified_by)
VALUES (4, 2, 7, 2, '2023-09-28', null, null, null);
INSERT
INTO waiting
(id, store_id, member_id, head_count, created_at, modified_at, created_by, modified_by)
VALUES (5, 2, 8, 1, '2023-09-28', null, null, null);
INSERT
INTO waiting
(id, store_id, member_id, head_count, created_at, modified_at, created_by, modified_by)
VALUES (6, 3, 9, 4, '2023-09-28', null, null, null);
INSERT
INTO waiting
(id, store_id, member_id, head_count, created_at, modified_at, created_by, modified_by)
VALUES (7, 3, 10, 2, '2023-09-28', null, null, null);
INSERT
INTO waiting
(id, store_id, member_id, head_count, created_at, modified_at, created_by, modified_by)
VALUES (8, 1, 7, 2, '2023-09-29', null, null, null);
INSERT
INTO waiting
(id, store_id, member_id, head_count, created_at, modified_at, created_by, modified_by)
VALUES (9, 3, 4, 2, '2023-09-29', null, null, null);
INSERT
INTO waiting
(id, store_id, member_id, head_count, created_at, modified_at, created_by, modified_by)
VALUES (10, 3, 5, 4, '2023-09-29', null, null, null);
INSERT
INTO waiting
(id, store_id, member_id, head_count, created_at, modified_at, created_by, modified_by)
VALUES (11, 3, 6, 2, '2023-09-29', null, null, null);

-- 공지사항
INSERT
INTO notice
(id, member_id, title, content, is_deleted, created_at, modified_at, created_by, modified_by)
VALUES (1, 1, '공지사항A', '내용A', 0, '2023-09-17', null, null, null);
INSERT
INTO notice
(id, member_id, title, content, is_deleted, created_at, modified_at, created_by, modified_by)
VALUES (2, 1, '공지사항B', '내용B', 1, '2023-09-18', null, null, null);

-- 페널티
INSERT
INTO penalty
    (id, member_id, type, created_at, modified_at, created_by, modified_by)
VALUES (1, 5, 'NO_SHOW', '2023-09-28', null, null, null);
INSERT
INTO penalty
    (id, member_id, type, created_at, modified_at, created_by, modified_by)
VALUES (2, 5, 'NO_SHOW', '2023-09-29', null, null, null);
INSERT
INTO penalty
    (id, member_id, type, created_at, modified_at, created_by, modified_by)
VALUES (3, 6, 'NO_SHOW', '2023-09-29', null, null, null);

-- 포인트
INSERT
INTO point
(id, member_id, amount, type, created_at, modified_at, created_by, modified_by)
VALUES (1, 7, 10, 'APPLICATION_VISIT', '2023-09-28', null, null, null);
INSERT
INTO point
(id, member_id, amount, type, created_at, modified_at, created_by, modified_by)
VALUES (2, 7, 50, 'STORE_VISIT', '2023-09-28', null, null, null);

-- 식당 주소
INSERT
INTO address
(id, store_id, area1, area2, area3, land_name, land_number1, land_number2, created_at, modified_at, created_by,
 modified_by)
VALUES (1, 1, '부산', null, null, '해운대로', 325, 6, '2023-09-18', null, null, null);
INSERT
INTO address
(id, store_id, area1, area2, area3, land_name, land_number1, land_number2, created_at, modified_at, created_by,
 modified_by)
VALUES (2, 2, '서울', null, null, '을지로', 245, 5, '2023-09-19', null, null, null);
INSERT
INTO address
(id, store_id, area1, area2, area3, land_name, land_number1, land_number2, created_at, modified_at, created_by,
 modified_by)
VALUES (3, 3, '부산', null, null, '해운대로', 325, 7, '2023-09-19', null, null, null);

-- 히스토리
INSERT
INTO history
(id, table_name, record_id, operation_type, snapshot, created_at, modified_at, created_by, modified_by)
VALUES (1, 'favorite', 7, 'BACKUP',
        '{"id":1, "store_id":2, "member_id":9, "created_at":"2023-09-23", "modified_at":null, "created_by":null, "modified_by":null}',
        '2023-09-22', null, null, null);
