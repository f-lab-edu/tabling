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
VALUES (1, 2, 'CHINESE_FOOD', '식당A', 'xx대학교 북문 앞 중식당입니다.', 10, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (2, 3, 'SNACK_FOOD', '식당B', 'xx역 x번 출구 앞에 위치한 분식점입니다.', 10, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (3, 2, 'WESTERN_FOOD', '식당C', 'xx해변에 위치한 레스토랑 입니다.', 30, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (4, 2, 'CHINESE_FOOD', '식당_4', '식당_4_설명', 10, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (5, 2, 'SNACK_FOOD', '식당_5', '식당_5_설명', 10, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (6, 2, 'WESTERN_FOOD', '식당_6', '식당_6_설명', 30, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (7, 2, 'CHINESE_FOOD', '식당_7', '식당_7_설명', 18, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (8, 2, 'SNACK_FOOD', '식당_8', '식당_8_설명', 27, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (9, 2, 'WESTERN_FOOD', '식당_9', '식당_9_설명', 21, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (10, 2, 'CHINESE_FOOD', '식당_10', '식당_10_설명', 15, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (11, 2, 'CHINESE_FOOD', '식당_11', '식당_11_설명', 17, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (12, 2, 'SNACK_FOOD', '식당_12', '식당_12_설명', 29, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (13, 2, 'WESTERN_FOOD', '식당_13', '식당_13_설명', 14, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (14, 2, 'CHINESE_FOOD', '식당_14', '식당_14_설명', 19, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (15, 2, 'SNACK_FOOD', '식당_15', '식당_15_설명', 26, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (16, 2, 'WESTERN_FOOD', '식당_16', '식당_16_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (17, 2, 'CHINESE_FOOD', '식당_17', '식당_17_설명', 30, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (18, 2, 'SNACK_FOOD', '식당_18', '식당_18_설명', 23, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (19, 2, 'WESTERN_FOOD', '식당_19', '식당_19_설명', 18, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (20, 2, 'CHINESE_FOOD', '식당_20', '식당_20_설명', 25, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (21, 2, 'CHINESE_FOOD', '식당_21', '식당_21_설명', 16, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (22, 2, 'SNACK_FOOD', '식당_22', '식당_22_설명', 21, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (23, 2, 'WESTERN_FOOD', '식당_23', '식당_23_설명', 26, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (24, 2, 'CHINESE_FOOD', '식당_24', '식당_24_설명', 19, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (25, 2, 'SNACK_FOOD', '식당_25', '식당_25_설명', 24, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (26, 2, 'WESTERN_FOOD', '식당_26', '식당_26_설명', 29, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (27, 2, 'CHINESE_FOOD', '식당_27', '식당_27_설명', 22, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (28, 2, 'SNACK_FOOD', '식당_28', '식당_28_설명', 17, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (29, 2, 'WESTERN_FOOD', '식당_29', '식당_29_설명', 18, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (30, 2, 'CHINESE_FOOD', '식당_30', '식당_30_설명', 25, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (31, 2, 'SNACK_FOOD', '식당_31', '식당_31_설명', 20, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (32, 2, 'WESTERN_FOOD', '식당_32', '식당_32_설명', 23, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (33, 2, 'CHINESE_FOOD', '식당_33', '식당_33_설명', 27, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (34, 2, 'SNACK_FOOD', '식당_34', '식당_34_설명', 18, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (35, 2, 'WESTERN_FOOD', '식당_35', '식당_35_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (36, 2, 'CHINESE_FOOD', '식당_36', '식당_36_설명', 21, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (37, 2, 'SNACK_FOOD', '식당_37', '식당_37_설명', 24, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (38, 2, 'WESTERN_FOOD', '식당_38', '식당_38_설명', 29, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (39, 2, 'CHINESE_FOOD', '식당_39', '식당_39_설명', 16, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (40, 2, 'SNACK_FOOD', '식당_40', '식당_40_설명', 21, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (41, 2, 'WESTERN_FOOD', '식당_41', '식당_41_설명', 26, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (42, 2, 'CHINESE_FOOD', '식당_42', '식당_42_설명', 19, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (43, 2, 'SNACK_FOOD', '식당_43', '식당_43_설명', 24, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (44, 2, 'WESTERN_FOOD', '식당_44', '식당_44_설명', 29, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (45, 2, 'CHINESE_FOOD', '식당_45', '식당_45_설명', 22, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (46, 2, 'SNACK_FOOD', '식당_46', '식당_46_설명', 17, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (47, 2, 'WESTERN_FOOD', '식당_47', '식당_47_설명', 18, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (48, 2, 'CHINESE_FOOD', '식당_48', '식당_48_설명', 25, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (49, 2, 'SNACK_FOOD', '식당_49', '식당_49_설명', 20, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (50, 2, 'WESTERN_FOOD', '식당_50', '식당_50_설명', 23, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (51, 2, 'CHINESE_FOOD', '식당_51', '식당_51_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (52, 2, 'CHINESE_FOOD', '식당_52', '식당_52_설명', 16, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (53, 2, 'SNACK_FOOD', '식당_53', '식당_53_설명', 21, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (54, 2, 'WESTERN_FOOD', '식당_54', '식당_54_설명', 26, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (55, 2, 'CHINESE_FOOD', '식당_55', '식당_55_설명', 19, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (56, 2, 'SNACK_FOOD', '식당_56', '식당_56_설명', 24, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (57, 2, 'WESTERN_FOOD', '식당_57', '식당_57_설명', 29, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (58, 2, 'CHINESE_FOOD', '식당_58', '식당_58_설명', 22, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (59, 2, 'SNACK_FOOD', '식당_59', '식당_59_설명', 17, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (60, 2, 'WESTERN_FOOD', '식당_60', '식당_60_설명', 18, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (61, 2, 'CHINESE_FOOD', '식당_61', '식당_61_설명', 25, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (62, 2, 'SNACK_FOOD', '식당_62', '식당_62_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (63, 2, 'WESTERN_FOOD', '식당_63', '식당_63_설명', 23, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (64, 2, 'CHINESE_FOOD', '식당_64', '식당_64_설명', 27, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (65, 2, 'SNACK_FOOD', '식당_65', '식당_65_설명', 18, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (66, 2, 'WESTERN_FOOD', '식당_66', '식당_66_설명', 30, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (67, 2, 'CHINESE_FOOD', '식당_67', '식당_67_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (68, 2, 'SNACK_FOOD', '식당_68', '식당_68_설명', 24, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (69, 2, 'WESTERN_FOOD', '식당_69', '식당_69_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (70, 2, 'CHINESE_FOOD', '식당_70', '식당_70_설명', 16, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (71, 2, 'SNACK_FOOD', '식당_71', '식당_71_설명', 16, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (72, 2, 'WESTERN_FOOD', '식당_72', '식당_72_설명', 21, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (73, 2, 'CHINESE_FOOD', '식당_73', '식당_73_설명', 26, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (74, 2, 'SNACK_FOOD', '식당_74', '식당_74_설명', 19, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (75, 2, 'WESTERN_FOOD', '식당_75', '식당_75_설명', 24, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (76, 2, 'CHINESE_FOOD', '식당_76', '식당_76_설명', 29, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (77, 2, 'SNACK_FOOD', '식당_77', '식당_77_설명', 22, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (78, 2, 'WESTERN_FOOD', '식당_78', '식당_78_설명', 17, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (79, 2, 'CHINESE_FOOD', '식당_79', '식당_79_설명', 18, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (80, 2, 'SNACK_FOOD', '식당_80', '식당_80_설명', 25, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (81, 2, 'WESTERN_FOOD', '식당_81', '식당_81_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (82, 2, 'CHINESE_FOOD', '식당_82', '식당_82_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (83, 2, 'SNACK_FOOD', '식당_83', '식당_83_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (84, 2, 'WESTERN_FOOD', '식당_84', '식당_84_설명', 21, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (85, 2, 'CHINESE_FOOD', '식당_85', '식당_85_설명', 26, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (86, 2, 'SNACK_FOOD', '식당_86', '식당_86_설명', 19, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (87, 2, 'WESTERN_FOOD', '식당_87', '식당_87_설명', 24, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (88, 2, 'CHINESE_FOOD', '식당_88', '식당_88_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (89, 2, 'SNACK_FOOD', '식당_89', '식당_89_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (90, 2, 'WESTERN_FOOD', '식당_90', '식당_90_설명', 17, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (91, 2, 'CHINESE_FOOD', '식당_91', '식당_91_설명', 18, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (92, 2, 'SNACK_FOOD', '식당_92', '식당_92_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (93, 2, 'WESTERN_FOOD', '식당_93', '식당_93_설명', 20, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (94, 2, 'CHINESE_FOOD', '식당_94', '식당_94_설명', 25, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (95, 2, 'SNACK_FOOD', '식당_95', '식당_95_설명', 30, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (96, 2, 'WESTERN_FOOD', '식당_96', '식당_96_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (97, 2, 'CHINESE_FOOD', '식당_97', '식당_97_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (98, 2, 'SNACK_FOOD', '식당_98', '식당_98_설명', 19, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (99, 2, 'WESTERN_FOOD', '식당_99', '식당_99_설명', 24, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (100, 2, 'CHINESE_FOOD', '식당_100', '식당_100_설명', 29, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (101, 2, 'SNACK_FOOD', '식당_101', '식당_101_설명', 16, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (102, 2, 'WESTERN_FOOD', '식당_102', '식당_102_설명', 21, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (103, 2, 'CHINESE_FOOD', '식당_103', '식당_103_설명', 26, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (104, 2, 'SNACK_FOOD', '식당_104', '식당_104_설명', 19, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (105, 2, 'WESTERN_FOOD', '식당_105', '식당_105_설명', 24, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (106, 2, 'CHINESE_FOOD', '식당_106', '식당_106_설명', 29, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (107, 2, 'SNACK_FOOD', '식당_107', '식당_107_설명', 22, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (108, 2, 'WESTERN_FOOD', '식당_108', '식당_108_설명', 17, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (109, 2, 'CHINESE_FOOD', '식당_109', '식당_109_설명', 18, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (110, 2, 'SNACK_FOOD', '식당_110', '식당_110_설명', 25, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (111, 2, 'WESTERN_FOOD', '식당_111', '식당_111_설명', 20, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (112, 2, 'CHINESE_FOOD', '식당_112', '식당_112_설명', 25, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (113, 2, 'SNACK_FOOD', '식당_113', '식당_113_설명', 30, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (114, 2, 'WESTERN_FOOD', '식당_114', '식당_114_설명', 21, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (115, 2, 'CHINESE_FOOD', '식당_115', '식당_115_설명', 26, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (116, 2, 'SNACK_FOOD', '식당_116', '식당_116_설명', 19, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (117, 2, 'WESTERN_FOOD', '식당_117', '식당_117_설명', 24, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (118, 2, 'CHINESE_FOOD', '식당_118', '식당_118_설명', 29, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (119, 2, 'SNACK_FOOD', '식당_119', '식당_119_설명', 22, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (120, 2, 'WESTERN_FOOD', '식당_120', '식당_120_설명', 17, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (121, 2, 'CHINESE_FOOD', '식당_121', '식당_121_설명', 18, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (122, 2, 'SNACK_FOOD', '식당_122', '식당_122_설명', 25, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (123, 2, 'WESTERN_FOOD', '식당_123', '식당_123_설명', 20, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (124, 2, 'CHINESE_FOOD', '식당_124', '식당_124_설명', 25, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (125, 2, 'SNACK_FOOD', '식당_125', '식당_125_설명', 30, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (126, 2, 'WESTERN_FOOD', '식당_126', '식당_126_설명', 21, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (127, 2, 'CHINESE_FOOD', '식당_127', '식당_127_설명', 26, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (128, 2, 'SNACK_FOOD', '식당_128', '식당_128_설명', 19, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (129, 2, 'WESTERN_FOOD', '식당_129', '식당_129_설명', 24, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (130, 2, 'CHINESE_FOOD', '식당_130', '식당_130_설명', 29, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (131, 2, 'SNACK_FOOD', '식당_131', '식당_131_설명', 16, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (132, 2, 'WESTERN_FOOD', '식당_132', '식당_132_설명', 21, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (133, 2, 'CHINESE_FOOD', '식당_133', '식당_133_설명', 26, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (134, 2, 'SNACK_FOOD', '식당_134', '식당_134_설명', 19, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (135, 2, 'WESTERN_FOOD', '식당_135', '식당_135_설명', 24, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (136, 2, 'CHINESE_FOOD', '식당_136', '식당_136_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (137, 2, 'SNACK_FOOD', '식당_137', '식당_137_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (138, 2, 'WESTERN_FOOD', '식당_138', '식당_138_설명', 17, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (139, 2, 'CHINESE_FOOD', '식당_139', '식당_139_설명', 18, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (140, 2, 'SNACK_FOOD', '식당_140', '식당_140_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (141, 2, 'WESTERN_FOOD', '식당_141', '식당_141_설명', 20, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (142, 2, 'CHINESE_FOOD', '식당_142', '식당_142_설명', 25, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (143, 2, 'SNACK_FOOD', '식당_143', '식당_143_설명', 30, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (144, 2, 'WESTERN_FOOD', '식당_144', '식당_144_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (145, 2, 'CHINESE_FOOD', '식당_145', '식당_145_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (146, 2, 'SNACK_FOOD', '식당_146', '식당_146_설명', 19, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (147, 2, 'WESTERN_FOOD', '식당_147', '식당_147_설명', 24, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (148, 2, 'CHINESE_FOOD', '식당_148', '식당_148_설명', 29, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (149, 2, 'SNACK_FOOD', '식당_149', '식당_149_설명', 22, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (150, 2, 'WESTERN_FOOD', '식당_150', '식당_150_설명', 17, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (151, 2, 'CHINESE_FOOD', '식당_151', '식당_151_설명', 18, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (152, 2, 'SNACK_FOOD', '식당_152', '식당_152_설명', 25, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (153, 2, 'WESTERN_FOOD', '식당_153', '식당_153_설명', 20, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (154, 2, 'CHINESE_FOOD', '식당_154', '식당_154_설명', 25, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (155, 2, 'SNACK_FOOD', '식당_155', '식당_155_설명', 30, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (156, 2, 'WESTERN_FOOD', '식당_156', '식당_156_설명', 21, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (157, 2, 'CHINESE_FOOD', '식당_157', '식당_157_설명', 26, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (158, 2, 'SNACK_FOOD', '식당_158', '식당_158_설명', 19, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (159, 2, 'WESTERN_FOOD', '식당_159', '식당_159_설명', 24, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (160, 2, 'CHINESE_FOOD', '식당_160', '식당_160_설명', 29, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (161, 2, 'SNACK_FOOD', '식당_161', '식당_161_설명', 16, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (162, 2, 'WESTERN_FOOD', '식당_162', '식당_162_설명', 21, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (163, 2, 'CHINESE_FOOD', '식당_163', '식당_163_설명', 26, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (164, 2, 'SNACK_FOOD', '식당_164', '식당_164_설명', 19, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (165, 2, 'WESTERN_FOOD', '식당_165', '식당_165_설명', 24, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (166, 2, 'CHINESE_FOOD', '식당_166', '식당_166_설명', 29, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (167, 2, 'SNACK_FOOD', '식당_167', '식당_167_설명', 22, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (168, 2, 'WESTERN_FOOD', '식당_168', '식당_168_설명', 17, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (169, 2, 'CHINESE_FOOD', '식당_169', '식당_169_설명', 18, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (170, 2, 'SNACK_FOOD', '식당_170', '식당_170_설명', 25, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (171, 2, 'WESTERN_FOOD', '식당_171', '식당_171_설명', 20, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (172, 2, 'CHINESE_FOOD', '식당_172', '식당_172_설명', 25, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (173, 2, 'SNACK_FOOD', '식당_173', '식당_173_설명', 30, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (174, 2, 'WESTERN_FOOD', '식당_174', '식당_174_설명', 21, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (175, 2, 'CHINESE_FOOD', '식당_175', '식당_175_설명', 26, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (176, 2, 'SNACK_FOOD', '식당_176', '식당_176_설명', 19, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (177, 2, 'WESTERN_FOOD', '식당_177', '식당_177_설명', 24, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (178, 2, 'CHINESE_FOOD', '식당_178', '식당_178_설명', 29, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (179, 2, 'SNACK_FOOD', '식당_179', '식당_179_설명', 22, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (180, 2, 'WESTERN_FOOD', '식당_180', '식당_180_설명', 17, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (181, 2, 'CHINESE_FOOD', '식당_181', '식당_181_설명', 18, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (182, 2, 'SNACK_FOOD', '식당_182', '식당_182_설명', 25, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (183, 2, 'WESTERN_FOOD', '식당_183', '식당_183_설명', 20, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (184, 2, 'CHINESE_FOOD', '식당_184', '식당_184_설명', 25, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (185, 2, 'SNACK_FOOD', '식당_185', '식당_185_설명', 30, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (186, 2, 'WESTERN_FOOD', '식당_186', '식당_186_설명', 21, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (187, 2, 'CHINESE_FOOD', '식당_187', '식당_187_설명', 26, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (188, 2, 'SNACK_FOOD', '식당_188', '식당_188_설명', 19, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (189, 2, 'WESTERN_FOOD', '식당_189', '식당_189_설명', 24, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (190, 2, 'CHINESE_FOOD', '식당_190', '식당_190_설명', 29, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (191, 2, 'SNACK_FOOD', '식당_191', '식당_191_설명', 16, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (192, 2, 'WESTERN_FOOD', '식당_192', '식당_192_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (193, 2, 'CHINESE_FOOD', '식당_193', '식당_193_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (194, 2, 'SNACK_FOOD', '식당_194', '식당_194_설명', 19, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (195, 2, 'WESTERN_FOOD', '식당_195', '식당_195_설명', 24, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (196, 2, 'CHINESE_FOOD', '식당_196', '식당_196_설명', 29, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (197, 2, 'SNACK_FOOD', '식당_197', '식당_197_설명', 22, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (198, 2, 'WESTERN_FOOD', '식당_198', '식당_198_설명', 17, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (199, 2, 'CHINESE_FOOD', '식당_199', '식당_199_설명', 18, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (200, 2, 'SNACK_FOOD', '식당_200', '식당_200_설명', 25, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (201, 2, 'WESTERN_FOOD', '식당_201', '식당_201_설명', 20, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (202, 2, 'CHINESE_FOOD', '식당_202', '식당_202_설명', 25, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (203, 2, 'SNACK_FOOD', '식당_203', '식당_203_설명', 30, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (204, 2, 'WESTERN_FOOD', '식당_204', '식당_204_설명', 21, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (205, 2, 'CHINESE_FOOD', '식당_205', '식당_205_설명', 26, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (206, 2, 'SNACK_FOOD', '식당_206', '식당_206_설명', 19, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (207, 2, 'WESTERN_FOOD', '식당_207', '식당_207_설명', 24, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (208, 2, 'CHINESE_FOOD', '식당_208', '식당_208_설명', 29, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (209, 2, 'SNACK_FOOD', '식당_209', '식당_209_설명', 22, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (210, 2, 'WESTERN_FOOD', '식당_210', '식당_210_설명', 17, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (211, 2, 'CHINESE_FOOD', '식당_211', '식당_211_설명', 18, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (212, 2, 'SNACK_FOOD', '식당_212', '식당_212_설명', 25, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (213, 2, 'WESTERN_FOOD', '식당_213', '식당_213_설명', 20, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (214, 2, 'CHINESE_FOOD', '식당_214', '식당_214_설명', 25, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (215, 2, 'SNACK_FOOD', '식당_215', '식당_215_설명', 30, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (216, 2, 'WESTERN_FOOD', '식당_216', '식당_216_설명', 21, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (217, 2, 'CHINESE_FOOD', '식당_217', '식당_217_설명', 26, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (218, 2, 'SNACK_FOOD', '식당_218', '식당_218_설명', 19, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (219, 2, 'WESTERN_FOOD', '식당_219', '식당_219_설명', 24, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (220, 2, 'CHINESE_FOOD', '식당_220', '식당_220_설명', 29, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (221, 2, 'SNACK_FOOD', '식당_221', '식당_221_설명', 22, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (222, 2, 'WESTERN_FOOD', '식당_222', '식당_222_설명', 17, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (223, 2, 'CHINESE_FOOD', '식당_223', '식당_223_설명', 18, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (224, 2, 'SNACK_FOOD', '식당_224', '식당_224_설명', 25, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (225, 2, 'WESTERN_FOOD', '식당_225', '식당_225_설명', 20, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (226, 2, 'CHINESE_FOOD', '식당_226', '식당_226_설명', 25, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (227, 2, 'SNACK_FOOD', '식당_227', '식당_227_설명', 30, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (228, 2, 'WESTERN_FOOD', '식당_228', '식당_228_설명', 21, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (229, 2, 'CHINESE_FOOD', '식당_229', '식당_229_설명', 26, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (230, 2, 'SNACK_FOOD', '식당_230', '식당_230_설명', 19, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (231, 2, 'WESTERN_FOOD', '식당_231', '식당_231_설명', 19, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (232, 2, 'CHINESE_FOOD', '식당_232', '식당_232_설명', 24, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (233, 2, 'SNACK_FOOD', '식당_233', '식당_233_설명', 29, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (234, 2, 'WESTERN_FOOD', '식당_234', '식당_234_설명', 22, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (235, 2, 'CHINESE_FOOD', '식당_235', '식당_235_설명', 27, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (236, 2, 'SNACK_FOOD', '식당_236', '식당_236_설명', 20, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (237, 2, 'WESTERN_FOOD', '식당_237', '식당_237_설명', 25, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (238, 2, 'CHINESE_FOOD', '식당_238', '식당_238_설명', 30, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (239, 2, 'SNACK_FOOD', '식당_239', '식당_239_설명', 23, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (240, 2, 'WESTERN_FOOD', '식당_240', '식당_240_설명', 18, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (241, 2, 'CHINESE_FOOD', '식당_241', '식당_241_설명', 25, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (242, 2, 'SNACK_FOOD', '식당_242', '식당_242_설명', 30, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (243, 2, 'WESTERN_FOOD', '식당_243', '식당_243_설명', 23, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (244, 2, 'CHINESE_FOOD', '식당_244', '식당_244_설명', 28, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (245, 2, 'SNACK_FOOD', '식당_245', '식당_245_설명', 21, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (246, 2, 'WESTERN_FOOD', '식당_246', '식당_246_설명', 26, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (247, 2, 'CHINESE_FOOD', '식당_247', '식당_247_설명', 19, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (248, 2, 'SNACK_FOOD', '식당_248', '식당_248_설명', 24, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (249, 2, 'WESTERN_FOOD', '식당_249', '식당_249_설명', 29, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (250, 2, 'CHINESE_FOOD', '식당_250', '식당_250_설명', 22, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (251, 2, 'SNACK_FOOD', '식당_251', '식당_251_설명', 27, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (252, 2, 'WESTERN_FOOD', '식당_252', '식당_252_설명', 20, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (253, 2, 'CHINESE_FOOD', '식당_253', '식당_253_설명', 25, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (254, 2, 'SNACK_FOOD', '식당_254', '식당_254_설명', 30, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (255, 2, 'WESTERN_FOOD', '식당_255', '식당_255_설명', 23, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (256, 2, 'CHINESE_FOOD', '식당_256', '식당_256_설명', 28, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (257, 2, 'SNACK_FOOD', '식당_257', '식당_257_설명', 21, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (258, 2, 'WESTERN_FOOD', '식당_258', '식당_258_설명', 26, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (259, 2, 'CHINESE_FOOD', '식당_259', '식당_259_설명', 19, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (260, 2, 'SNACK_FOOD', '식당_260', '식당_260_설명', 24, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (261, 2, 'WESTERN_FOOD', '식당_261', '식당_261_설명', 29, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (262, 2, 'CHINESE_FOOD', '식당_262', '식당_262_설명', 22, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (263, 2, 'SNACK_FOOD', '식당_263', '식당_263_설명', 27, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (264, 2, 'WESTERN_FOOD', '식당_264', '식당_264_설명', 20, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (265, 2, 'CHINESE_FOOD', '식당_265', '식당_265_설명', 25, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (266, 2, 'SNACK_FOOD', '식당_266', '식당_266_설명', 30, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (267, 2, 'WESTERN_FOOD', '식당_267', '식당_267_설명', 23, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (268, 2, 'CHINESE_FOOD', '식당_268', '식당_268_설명', 28, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (269, 2, 'SNACK_FOOD', '식당_269', '식당_269_설명', 21, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (270, 2, 'WESTERN_FOOD', '식당_270', '식당_270_설명', 26, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (271, 2, 'CHINESE_FOOD', '식당_271', '식당_271_설명', 29, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (272, 2, 'SNACK_FOOD', '식당_272', '식당_272_설명', 22, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (273, 2, 'WESTERN_FOOD', '식당_273', '식당_273_설명', 27, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (274, 2, 'CHINESE_FOOD', '식당_274', '식당_274_설명', 20, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (275, 2, 'SNACK_FOOD', '식당_275', '식당_275_설명', 25, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (276, 2, 'WESTERN_FOOD', '식당_276', '식당_276_설명', 30, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (277, 2, 'CHINESE_FOOD', '식당_277', '식당_277_설명', 23, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (278, 2, 'SNACK_FOOD', '식당_278', '식당_278_설명', 28, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (279, 2, 'WESTERN_FOOD', '식당_279', '식당_279_설명', 21, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (280, 2, 'CHINESE_FOOD', '식당_280', '식당_280_설명', 26, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (281, 2, 'SNACK_FOOD', '식당_281', '식당_281_설명', 27, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (282, 2, 'WESTERN_FOOD', '식당_282', '식당_282_설명', 22, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (283, 2, 'CHINESE_FOOD', '식당_283', '식당_283_설명', 27, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (284, 2, 'SNACK_FOOD', '식당_284', '식당_284_설명', 30, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (285, 2, 'WESTERN_FOOD', '식당_285', '식당_285_설명', 23, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (286, 2, 'CHINESE_FOOD', '식당_286', '식당_286_설명', 28, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (287, 2, 'SNACK_FOOD', '식당_287', '식당_287_설명', 21, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (288, 2, 'WESTERN_FOOD', '식당_288', '식당_288_설명', 26, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (289, 2, 'CHINESE_FOOD', '식당_289', '식당_289_설명', 19, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (290, 2, 'SNACK_FOOD', '식당_290', '식당_290_설명', 24, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (291, 2, 'WESTERN_FOOD', '식당_291', '식당_291_설명', 29, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (292, 2, 'CHINESE_FOOD', '식당_292', '식당_292_설명', 22, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (293, 2, 'SNACK_FOOD', '식당_293', '식당_293_설명', 27, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (294, 2, 'WESTERN_FOOD', '식당_294', '식당_294_설명', 20, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (295, 2, 'CHINESE_FOOD', '식당_295', '식당_295_설명', 25, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (296, 2, 'SNACK_FOOD', '식당_296', '식당_296_설명', 30, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (297, 2, 'WESTERN_FOOD', '식당_297', '식당_297_설명', 23, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (298, 2, 'CHINESE_FOOD', '식당_298', '식당_298_설명', 28, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (299, 2, 'SNACK_FOOD', '식당_299', '식당_299_설명', 21, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (300, 2, 'WESTERN_FOOD', '식당_300', '식당_300_설명', 26, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (301, 2, 'CHINESE_FOOD', '식당_301', '식당_301_설명', 25, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (302, 2, 'SNACK_FOOD', '식당_302', '식당_302_설명', 30, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (303, 2, 'WESTERN_FOOD', '식당_303', '식당_303_설명', 23, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (304, 2, 'CHINESE_FOOD', '식당_304', '식당_304_설명', 28, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (305, 2, 'SNACK_FOOD', '식당_305', '식당_305_설명', 21, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (306, 2, 'WESTERN_FOOD', '식당_306', '식당_306_설명', 26, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (307, 2, 'CHINESE_FOOD', '식당_307', '식당_307_설명', 19, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (308, 2, 'SNACK_FOOD', '식당_308', '식당_308_설명', 24, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (309, 2, 'WESTERN_FOOD', '식당_309', '식당_309_설명', 29, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (310, 2, 'CHINESE_FOOD', '식당_310', '식당_310_설명', 22, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (311, 2, 'SNACK_FOOD', '식당_311', '식당_311_설명', 27, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (312, 2, 'WESTERN_FOOD', '식당_312', '식당_312_설명', 20, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (313, 2, 'CHINESE_FOOD', '식당_313', '식당_313_설명', 25, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (314, 2, 'SNACK_FOOD', '식당_314', '식당_314_설명', 30, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (315, 2, 'WESTERN_FOOD', '식당_315', '식당_315_설명', 23, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (316, 2, 'CHINESE_FOOD', '식당_316', '식당_316_설명', 28, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (317, 2, 'SNACK_FOOD', '식당_317', '식당_317_설명', 21, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (318, 2, 'WESTERN_FOOD', '식당_318', '식당_318_설명', 26, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (319, 2, 'CHINESE_FOOD', '식당_319', '식당_319_설명', 29, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (320, 2, 'SNACK_FOOD', '식당_320', '식당_320_설명', 22, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (321, 2, 'WESTERN_FOOD', '식당_321', '식당_321_설명', 27, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (322, 2, 'CHINESE_FOOD', '식당_322', '식당_322_설명', 20, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (323, 2, 'SNACK_FOOD', '식당_323', '식당_323_설명', 25, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (324, 2, 'WESTERN_FOOD', '식당_324', '식당_324_설명', 30, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (325, 2, 'CHINESE_FOOD', '식당_325', '식당_325_설명', 23, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (326, 2, 'SNACK_FOOD', '식당_326', '식당_326_설명', 28, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (327, 2, 'WESTERN_FOOD', '식당_327', '식당_327_설명', 21, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (328, 2, 'CHINESE_FOOD', '식당_328', '식당_328_설명', 26, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (329, 2, 'SNACK_FOOD', '식당_329', '식당_329_설명', 29, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (330, 2, 'WESTERN_FOOD', '식당_330', '식당_330_설명', 22, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (331, 2, 'CHINESE_FOOD', '식당_331', '식당_331_설명', 25, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (332, 2, 'SNACK_FOOD', '식당_332', '식당_332_설명', 30, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (333, 2, 'WESTERN_FOOD', '식당_333', '식당_333_설명', 23, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (334, 2, 'CHINESE_FOOD', '식당_334', '식당_334_설명', 28, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (335, 2, 'SNACK_FOOD', '식당_335', '식당_335_설명', 21, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (336, 2, 'WESTERN_FOOD', '식당_336', '식당_336_설명', 26, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (337, 2, 'CHINESE_FOOD', '식당_337', '식당_337_설명', 19, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (338, 2, 'SNACK_FOOD', '식당_338', '식당_338_설명', 24, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (339, 2, 'WESTERN_FOOD', '식당_339', '식당_339_설명', 29, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (340, 2, 'CHINESE_FOOD', '식당_340', '식당_340_설명', 22, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (341, 2, 'SNACK_FOOD', '식당_341', '식당_341_설명', 27, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (342, 2, 'WESTERN_FOOD', '식당_342', '식당_342_설명', 20, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (343, 2, 'CHINESE_FOOD', '식당_343', '식당_343_설명', 25, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (344, 2, 'SNACK_FOOD', '식당_344', '식당_344_설명', 30, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (345, 2, 'WESTERN_FOOD', '식당_345', '식당_345_설명', 23, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (346, 2, 'CHINESE_FOOD', '식당_346', '식당_346_설명', 28, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (347, 2, 'SNACK_FOOD', '식당_347', '식당_347_설명', 21, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (348, 2, 'WESTERN_FOOD', '식당_348', '식당_348_설명', 26, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (349, 2, 'CHINESE_FOOD', '식당_349', '식당_349_설명', 29, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (350, 2, 'SNACK_FOOD', '식당_350', '식당_350_설명', 22, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (351, 2, 'WESTERN_FOOD', '식당_351', '식당_351_설명', 27, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (352, 2, 'CHINESE_FOOD', '식당_352', '식당_352_설명', 20, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (353, 2, 'SNACK_FOOD', '식당_353', '식당_353_설명', 25, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (354, 2, 'WESTERN_FOOD', '식당_354', '식당_354_설명', 30, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (355, 2, 'CHINESE_FOOD', '식당_355', '식당_355_설명', 23, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (356, 2, 'SNACK_FOOD', '식당_356', '식당_356_설명', 28, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (357, 2, 'WESTERN_FOOD', '식당_357', '식당_357_설명', 21, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (358, 2, 'CHINESE_FOOD', '식당_358', '식당_358_설명', 26, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (359, 2, 'SNACK_FOOD', '식당_359', '식당_359_설명', 29, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (360, 2, 'WESTERN_FOOD', '식당_360', '식당_360_설명', 22, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (361, 2, 'CHINESE_FOOD', '식당_361', '식당_361_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (362, 2, 'SNACK_FOOD', '식당_362', '식당_362_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (363, 2, 'WESTERN_FOOD', '식당_363', '식당_363_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (364, 2, 'CHINESE_FOOD', '식당_364', '식당_364_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (365, 2, 'SNACK_FOOD', '식당_365', '식당_365_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (366, 2, 'WESTERN_FOOD', '식당_366', '식당_366_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (367, 2, 'CHINESE_FOOD', '식당_367', '식당_367_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (368, 2, 'SNACK_FOOD', '식당_368', '식당_368_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (369, 2, 'WESTERN_FOOD', '식당_369', '식당_369_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (370, 2, 'CHINESE_FOOD', '식당_370', '식당_370_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (371, 2, 'SNACK_FOOD', '식당_371', '식당_371_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (372, 2, 'WESTERN_FOOD', '식당_372', '식당_372_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (373, 2, 'CHINESE_FOOD', '식당_373', '식당_373_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (374, 2, 'SNACK_FOOD', '식당_374', '식당_374_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (375, 2, 'WESTERN_FOOD', '식당_375', '식당_375_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (376, 2, 'CHINESE_FOOD', '식당_376', '식당_376_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (377, 2, 'SNACK_FOOD', '식당_377', '식당_377_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (378, 2, 'WESTERN_FOOD', '식당_378', '식당_378_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (379, 2, 'CHINESE_FOOD', '식당_379', '식당_379_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (380, 2, 'SNACK_FOOD', '식당_380', '식당_380_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (381, 2, 'WESTERN_FOOD', '식당_381', '식당_381_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (382, 2, 'CHINESE_FOOD', '식당_382', '식당_382_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (383, 2, 'SNACK_FOOD', '식당_383', '식당_383_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (384, 2, 'WESTERN_FOOD', '식당_384', '식당_384_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (385, 2, 'CHINESE_FOOD', '식당_385', '식당_385_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (386, 2, 'SNACK_FOOD', '식당_386', '식당_386_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (387, 2, 'WESTERN_FOOD', '식당_387', '식당_387_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (388, 2, 'CHINESE_FOOD', '식당_388', '식당_388_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (389, 2, 'SNACK_FOOD', '식당_389', '식당_389_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (390, 2, 'WESTERN_FOOD', '식당_390', '식당_390_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (391, 2, 'CHINESE_FOOD', '식당_391', '식당_391_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (392, 2, 'SNACK_FOOD', '식당_392', '식당_392_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (393, 2, 'WESTERN_FOOD', '식당_393', '식당_393_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (394, 2, 'CHINESE_FOOD', '식당_394', '식당_394_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (395, 2, 'SNACK_FOOD', '식당_395', '식당_395_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (396, 2, 'WESTERN_FOOD', '식당_396', '식당_396_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (397, 2, 'CHINESE_FOOD', '식당_397', '식당_397_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (398, 2, 'SNACK_FOOD', '식당_398', '식당_398_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (399, 2, 'WESTERN_FOOD', '식당_399', '식당_399_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (400, 2, 'CHINESE_FOOD', '식당_400', '식당_400_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (401, 2, 'SNACK_FOOD', '식당_401', '식당_401_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (402, 2, 'WESTERN_FOOD', '식당_402', '식당_402_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (403, 2, 'CHINESE_FOOD', '식당_403', '식당_403_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (404, 2, 'SNACK_FOOD', '식당_404', '식당_404_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (405, 2, 'WESTERN_FOOD', '식당_405', '식당_405_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (406, 2, 'CHINESE_FOOD', '식당_406', '식당_406_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (407, 2, 'SNACK_FOOD', '식당_407', '식당_407_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (408, 2, 'WESTERN_FOOD', '식당_408', '식당_408_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (409, 2, 'CHINESE_FOOD', '식당_409', '식당_409_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (410, 2, 'SNACK_FOOD', '식당_410', '식당_410_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (411, 2, 'WESTERN_FOOD', '식당_411', '식당_411_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (412, 2, 'CHINESE_FOOD', '식당_412', '식당_412_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (413, 2, 'SNACK_FOOD', '식당_413', '식당_413_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (414, 2, 'WESTERN_FOOD', '식당_414', '식당_414_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (415, 2, 'CHINESE_FOOD', '식당_415', '식당_415_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (416, 2, 'SNACK_FOOD', '식당_416', '식당_416_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (417, 2, 'WESTERN_FOOD', '식당_417', '식당_417_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (418, 2, 'CHINESE_FOOD', '식당_418', '식당_418_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (419, 2, 'SNACK_FOOD', '식당_419', '식당_419_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (420, 2, 'WESTERN_FOOD', '식당_420', '식당_420_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (421, 2, 'SNACK_FOOD', '식당_421', '식당_421_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (422, 2, 'WESTERN_FOOD', '식당_422', '식당_422_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (423, 2, 'CHINESE_FOOD', '식당_423', '식당_423_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (424, 2, 'SNACK_FOOD', '식당_424', '식당_424_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (425, 2, 'WESTERN_FOOD', '식당_425', '식당_425_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (426, 2, 'CHINESE_FOOD', '식당_426', '식당_426_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (427, 2, 'SNACK_FOOD', '식당_427', '식당_427_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (428, 2, 'WESTERN_FOOD', '식당_428', '식당_428_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (429, 2, 'CHINESE_FOOD', '식당_429', '식당_429_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (430, 2, 'SNACK_FOOD', '식당_430', '식당_430_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (431, 2, 'WESTERN_FOOD', '식당_431', '식당_431_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (432, 2, 'CHINESE_FOOD', '식당_432', '식당_432_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (433, 2, 'SNACK_FOOD', '식당_433', '식당_433_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (434, 2, 'WESTERN_FOOD', '식당_434', '식당_434_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (435, 2, 'CHINESE_FOOD', '식당_435', '식당_435_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (436, 2, 'SNACK_FOOD', '식당_436', '식당_436_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (437, 2, 'WESTERN_FOOD', '식당_437', '식당_437_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (438, 2, 'CHINESE_FOOD', '식당_438', '식당_438_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (439, 2, 'SNACK_FOOD', '식당_439', '식당_439_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (440, 2, 'WESTERN_FOOD', '식당_440', '식당_440_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (441, 2, 'SNACK_FOOD', '식당_441', '식당_441_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (442, 2, 'WESTERN_FOOD', '식당_442', '식당_442_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (443, 2, 'CHINESE_FOOD', '식당_443', '식당_443_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (444, 2, 'SNACK_FOOD', '식당_444', '식당_444_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (445, 2, 'WESTERN_FOOD', '식당_445', '식당_445_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (446, 2, 'CHINESE_FOOD', '식당_446', '식당_446_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (447, 2, 'SNACK_FOOD', '식당_447', '식당_447_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (448, 2, 'WESTERN_FOOD', '식당_448', '식당_448_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (449, 2, 'CHINESE_FOOD', '식당_449', '식당_449_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (450, 2, 'SNACK_FOOD', '식당_450', '식당_450_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (451, 2, 'WESTERN_FOOD', '식당_451', '식당_451_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (452, 2, 'CHINESE_FOOD', '식당_452', '식당_452_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (453, 2, 'SNACK_FOOD', '식당_453', '식당_453_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (454, 2, 'WESTERN_FOOD', '식당_454', '식당_454_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (455, 2, 'CHINESE_FOOD', '식당_455', '식당_455_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (456, 2, 'SNACK_FOOD', '식당_456', '식당_456_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (457, 2, 'WESTERN_FOOD', '식당_457', '식당_457_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (458, 2, 'CHINESE_FOOD', '식당_458', '식당_458_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (459, 2, 'SNACK_FOOD', '식당_459', '식당_459_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (460, 2, 'WESTERN_FOOD', '식당_460', '식당_460_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (461, 2, 'SNACK_FOOD', '식당_461', '식당_461_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (462, 2, 'WESTERN_FOOD', '식당_462', '식당_462_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (463, 2, 'CHINESE_FOOD', '식당_463', '식당_463_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (464, 2, 'SNACK_FOOD', '식당_464', '식당_464_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (465, 2, 'WESTERN_FOOD', '식당_465', '식당_465_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (466, 2, 'CHINESE_FOOD', '식당_466', '식당_466_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (467, 2, 'SNACK_FOOD', '식당_467', '식당_467_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (468, 2, 'WESTERN_FOOD', '식당_468', '식당_468_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (469, 2, 'CHINESE_FOOD', '식당_469', '식당_469_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (470, 2, 'SNACK_FOOD', '식당_470', '식당_470_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (471, 2, 'WESTERN_FOOD', '식당_471', '식당_471_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (472, 2, 'CHINESE_FOOD', '식당_472', '식당_472_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (473, 2, 'SNACK_FOOD', '식당_473', '식당_473_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (474, 2, 'WESTERN_FOOD', '식당_474', '식당_474_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (475, 2, 'CHINESE_FOOD', '식당_475', '식당_475_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (476, 2, 'SNACK_FOOD', '식당_476', '식당_476_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (477, 2, 'WESTERN_FOOD', '식당_477', '식당_477_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (478, 2, 'CHINESE_FOOD', '식당_478', '식당_478_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (479, 2, 'SNACK_FOOD', '식당_479', '식당_479_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (480, 2, 'WESTERN_FOOD', '식당_480', '식당_480_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (481, 2, 'SNACK_FOOD', '식당_481', '식당_481_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (482, 2, 'WESTERN_FOOD', '식당_482', '식당_482_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (483, 2, 'CHINESE_FOOD', '식당_483', '식당_483_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (484, 2, 'SNACK_FOOD', '식당_484', '식당_484_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (485, 2, 'WESTERN_FOOD', '식당_485', '식당_485_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (486, 2, 'CHINESE_FOOD', '식당_486', '식당_486_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (487, 2, 'SNACK_FOOD', '식당_487', '식당_487_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (488, 2, 'WESTERN_FOOD', '식당_488', '식당_488_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (489, 2, 'CHINESE_FOOD', '식당_489', '식당_489_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (490, 2, 'SNACK_FOOD', '식당_490', '식당_490_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (491, 2, 'WESTERN_FOOD', '식당_491', '식당_491_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (492, 2, 'CHINESE_FOOD', '식당_492', '식당_492_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (493, 2, 'SNACK_FOOD', '식당_493', '식당_493_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (494, 2, 'WESTERN_FOOD', '식당_494', '식당_494_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (495, 2, 'CHINESE_FOOD', '식당_495', '식당_495_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (496, 2, 'SNACK_FOOD', '식당_496', '식당_496_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (497, 2, 'WESTERN_FOOD', '식당_497', '식당_497_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (498, 2, 'CHINESE_FOOD', '식당_498', '식당_498_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (499, 2, 'SNACK_FOOD', '식당_499', '식당_499_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (500, 2, 'WESTERN_FOOD', '식당_500', '식당_500_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (501, 2, 'SNACK_FOOD', '식당_501', '식당_501_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (502, 2, 'WESTERN_FOOD', '식당_502', '식당_502_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (503, 2, 'CHINESE_FOOD', '식당_503', '식당_503_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (504, 2, 'SNACK_FOOD', '식당_504', '식당_504_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (505, 2, 'WESTERN_FOOD', '식당_505', '식당_505_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (506, 2, 'CHINESE_FOOD', '식당_506', '식당_506_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (507, 2, 'SNACK_FOOD', '식당_507', '식당_507_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (508, 2, 'WESTERN_FOOD', '식당_508', '식당_508_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (509, 2, 'CHINESE_FOOD', '식당_509', '식당_509_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (510, 2, 'SNACK_FOOD', '식당_510', '식당_510_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (511, 2, 'WESTERN_FOOD', '식당_511', '식당_511_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (512, 2, 'CHINESE_FOOD', '식당_512', '식당_512_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (513, 2, 'SNACK_FOOD', '식당_513', '식당_513_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (514, 2, 'WESTERN_FOOD', '식당_514', '식당_514_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (515, 2, 'CHINESE_FOOD', '식당_515', '식당_515_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (516, 2, 'SNACK_FOOD', '식당_516', '식당_516_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (517, 2, 'WESTERN_FOOD', '식당_517', '식당_517_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (518, 2, 'CHINESE_FOOD', '식당_518', '식당_518_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (519, 2, 'SNACK_FOOD', '식당_519', '식당_519_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (520, 2, 'WESTERN_FOOD', '식당_520', '식당_520_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (521, 2, 'SNACK_FOOD', '식당_521', '식당_521_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (522, 2, 'WESTERN_FOOD', '식당_522', '식당_522_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (523, 2, 'CHINESE_FOOD', '식당_523', '식당_523_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (524, 2, 'SNACK_FOOD', '식당_524', '식당_524_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (525, 2, 'WESTERN_FOOD', '식당_525', '식당_525_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (526, 2, 'CHINESE_FOOD', '식당_526', '식당_526_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (527, 2, 'SNACK_FOOD', '식당_527', '식당_527_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (528, 2, 'WESTERN_FOOD', '식당_528', '식당_528_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (529, 2, 'CHINESE_FOOD', '식당_529', '식당_529_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (530, 2, 'SNACK_FOOD', '식당_530', '식당_530_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (531, 2, 'WESTERN_FOOD', '식당_531', '식당_531_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (532, 2, 'CHINESE_FOOD', '식당_532', '식당_532_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (533, 2, 'SNACK_FOOD', '식당_533', '식당_533_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (534, 2, 'WESTERN_FOOD', '식당_534', '식당_534_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (535, 2, 'CHINESE_FOOD', '식당_535', '식당_535_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (536, 2, 'SNACK_FOOD', '식당_536', '식당_536_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (537, 2, 'WESTERN_FOOD', '식당_537', '식당_537_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (538, 2, 'CHINESE_FOOD', '식당_538', '식당_538_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (539, 2, 'SNACK_FOOD', '식당_539', '식당_539_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (540, 2, 'WESTERN_FOOD', '식당_540', '식당_540_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (541, 2, 'SNACK_FOOD', '식당_541', '식당_541_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (542, 2, 'WESTERN_FOOD', '식당_542', '식당_542_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (543, 2, 'CHINESE_FOOD', '식당_543', '식당_543_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (544, 2, 'SNACK_FOOD', '식당_544', '식당_544_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (545, 2, 'WESTERN_FOOD', '식당_545', '식당_545_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (546, 2, 'CHINESE_FOOD', '식당_546', '식당_546_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (547, 2, 'SNACK_FOOD', '식당_547', '식당_547_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (548, 2, 'WESTERN_FOOD', '식당_548', '식당_548_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (549, 2, 'CHINESE_FOOD', '식당_549', '식당_549_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (550, 2, 'SNACK_FOOD', '식당_550', '식당_550_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (551, 2, 'WESTERN_FOOD', '식당_551', '식당_551_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (552, 2, 'CHINESE_FOOD', '식당_552', '식당_552_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (553, 2, 'SNACK_FOOD', '식당_553', '식당_553_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (554, 2, 'WESTERN_FOOD', '식당_554', '식당_554_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (555, 2, 'CHINESE_FOOD', '식당_555', '식당_555_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (556, 2, 'SNACK_FOOD', '식당_556', '식당_556_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (557, 2, 'WESTERN_FOOD', '식당_557', '식당_557_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (558, 2, 'CHINESE_FOOD', '식당_558', '식당_558_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (559, 2, 'SNACK_FOOD', '식당_559', '식당_559_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (560, 2, 'WESTERN_FOOD', '식당_560', '식당_560_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (561, 2, 'SNACK_FOOD', '식당_561', '식당_561_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (562, 2, 'WESTERN_FOOD', '식당_562', '식당_562_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (563, 2, 'CHINESE_FOOD', '식당_563', '식당_563_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (564, 2, 'SNACK_FOOD', '식당_564', '식당_564_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (565, 2, 'WESTERN_FOOD', '식당_565', '식당_565_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (566, 2, 'CHINESE_FOOD', '식당_566', '식당_566_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (567, 2, 'SNACK_FOOD', '식당_567', '식당_567_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (568, 2, 'WESTERN_FOOD', '식당_568', '식당_568_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (569, 2, 'CHINESE_FOOD', '식당_569', '식당_569_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (570, 2, 'SNACK_FOOD', '식당_570', '식당_570_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (571, 2, 'WESTERN_FOOD', '식당_571', '식당_571_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (572, 2, 'CHINESE_FOOD', '식당_572', '식당_572_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (573, 2, 'SNACK_FOOD', '식당_573', '식당_573_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (574, 2, 'WESTERN_FOOD', '식당_574', '식당_574_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (575, 2, 'CHINESE_FOOD', '식당_575', '식당_575_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (576, 2, 'SNACK_FOOD', '식당_576', '식당_576_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (577, 2, 'WESTERN_FOOD', '식당_577', '식당_577_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (578, 2, 'CHINESE_FOOD', '식당_578', '식당_578_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (579, 2, 'SNACK_FOOD', '식당_579', '식당_579_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (580, 2, 'WESTERN_FOOD', '식당_580', '식당_580_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (581, 2, 'SNACK_FOOD', '식당_581', '식당_581_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (582, 2, 'WESTERN_FOOD', '식당_582', '식당_582_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (583, 2, 'CHINESE_FOOD', '식당_583', '식당_583_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (584, 2, 'SNACK_FOOD', '식당_584', '식당_584_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (585, 2, 'WESTERN_FOOD', '식당_585', '식당_585_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (586, 2, 'CHINESE_FOOD', '식당_586', '식당_586_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (587, 2, 'SNACK_FOOD', '식당_587', '식당_587_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (588, 2, 'WESTERN_FOOD', '식당_588', '식당_588_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (589, 2, 'CHINESE_FOOD', '식당_589', '식당_589_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (590, 2, 'SNACK_FOOD', '식당_590', '식당_590_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (591, 2, 'WESTERN_FOOD', '식당_591', '식당_591_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (592, 2, 'CHINESE_FOOD', '식당_592', '식당_592_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (593, 2, 'SNACK_FOOD', '식당_593', '식당_593_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (594, 2, 'WESTERN_FOOD', '식당_594', '식당_594_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (595, 2, 'CHINESE_FOOD', '식당_595', '식당_595_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (596, 2, 'SNACK_FOOD', '식당_596', '식당_596_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (597, 2, 'WESTERN_FOOD', '식당_597', '식당_597_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (598, 2, 'CHINESE_FOOD', '식당_598', '식당_598_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (599, 2, 'SNACK_FOOD', '식당_599', '식당_599_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (600, 2, 'WESTERN_FOOD', '식당_600', '식당_600_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (601, 2, 'SNACK_FOOD', '식당_601', '식당_601_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (602, 2, 'WESTERN_FOOD', '식당_602', '식당_602_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (603, 2, 'CHINESE_FOOD', '식당_603', '식당_603_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (604, 2, 'SNACK_FOOD', '식당_604', '식당_604_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (605, 2, 'WESTERN_FOOD', '식당_605', '식당_605_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (606, 2, 'CHINESE_FOOD', '식당_606', '식당_606_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (607, 2, 'SNACK_FOOD', '식당_607', '식당_607_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (608, 2, 'WESTERN_FOOD', '식당_608', '식당_608_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (609, 2, 'CHINESE_FOOD', '식당_609', '식당_609_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (610, 2, 'SNACK_FOOD', '식당_610', '식당_610_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (611, 2, 'WESTERN_FOOD', '식당_611', '식당_611_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (612, 2, 'CHINESE_FOOD', '식당_612', '식당_612_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (613, 2, 'SNACK_FOOD', '식당_613', '식당_613_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (614, 2, 'WESTERN_FOOD', '식당_614', '식당_614_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (615, 2, 'CHINESE_FOOD', '식당_615', '식당_615_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (616, 2, 'SNACK_FOOD', '식당_616', '식당_616_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (617, 2, 'WESTERN_FOOD', '식당_617', '식당_617_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (618, 2, 'CHINESE_FOOD', '식당_618', '식당_618_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (619, 2, 'SNACK_FOOD', '식당_619', '식당_619_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (620, 2, 'WESTERN_FOOD', '식당_620', '식당_620_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (621, 2, 'WESTERN_FOOD', '식당_621', '식당_621_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (622, 2, 'CHINESE_FOOD', '식당_622', '식당_622_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (623, 2, 'SNACK_FOOD', '식당_623', '식당_623_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (624, 2, 'WESTERN_FOOD', '식당_624', '식당_624_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (625, 2, 'CHINESE_FOOD', '식당_625', '식당_625_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (626, 2, 'SNACK_FOOD', '식당_626', '식당_626_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (627, 2, 'WESTERN_FOOD', '식당_627', '식당_627_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (628, 2, 'CHINESE_FOOD', '식당_628', '식당_628_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (629, 2, 'SNACK_FOOD', '식당_629', '식당_629_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (630, 2, 'WESTERN_FOOD', '식당_630', '식당_630_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (631, 2, 'SNACK_FOOD', '식당_631', '식당_631_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (632, 2, 'WESTERN_FOOD', '식당_632', '식당_632_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (633, 2, 'CHINESE_FOOD', '식당_633', '식당_633_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (634, 2, 'SNACK_FOOD', '식당_634', '식당_634_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (635, 2, 'WESTERN_FOOD', '식당_635', '식당_635_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (636, 2, 'CHINESE_FOOD', '식당_636', '식당_636_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (637, 2, 'SNACK_FOOD', '식당_637', '식당_637_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (638, 2, 'WESTERN_FOOD', '식당_638', '식당_638_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (639, 2, 'CHINESE_FOOD', '식당_639', '식당_639_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (640, 2, 'SNACK_FOOD', '식당_640', '식당_640_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (641, 2, 'WESTERN_FOOD', '식당_641', '식당_641_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (642, 2, 'CHINESE_FOOD', '식당_642', '식당_642_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (643, 2, 'SNACK_FOOD', '식당_643', '식당_643_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (644, 2, 'WESTERN_FOOD', '식당_644', '식당_644_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (645, 2, 'CHINESE_FOOD', '식당_645', '식당_645_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (646, 2, 'SNACK_FOOD', '식당_646', '식당_646_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (647, 2, 'WESTERN_FOOD', '식당_647', '식당_647_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (648, 2, 'CHINESE_FOOD', '식당_648', '식당_648_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (649, 2, 'SNACK_FOOD', '식당_649', '식당_649_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (650, 2, 'WESTERN_FOOD', '식당_650', '식당_650_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (651, 2, 'SNACK_FOOD', '식당_651', '식당_651_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (652, 2, 'WESTERN_FOOD', '식당_652', '식당_652_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (653, 2, 'CHINESE_FOOD', '식당_653', '식당_653_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (654, 2, 'SNACK_FOOD', '식당_654', '식당_654_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (655, 2, 'WESTERN_FOOD', '식당_655', '식당_655_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (656, 2, 'CHINESE_FOOD', '식당_656', '식당_656_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (657, 2, 'SNACK_FOOD', '식당_657', '식당_657_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (658, 2, 'WESTERN_FOOD', '식당_658', '식당_658_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (659, 2, 'CHINESE_FOOD', '식당_659', '식당_659_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (660, 2, 'SNACK_FOOD', '식당_660', '식당_660_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (661, 2, 'WESTERN_FOOD', '식당_661', '식당_661_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (662, 2, 'CHINESE_FOOD', '식당_662', '식당_662_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (663, 2, 'SNACK_FOOD', '식당_663', '식당_663_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (664, 2, 'WESTERN_FOOD', '식당_664', '식당_664_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (665, 2, 'CHINESE_FOOD', '식당_665', '식당_665_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (666, 2, 'SNACK_FOOD', '식당_666', '식당_666_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (667, 2, 'WESTERN_FOOD', '식당_667', '식당_667_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (668, 2, 'CHINESE_FOOD', '식당_668', '식당_668_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (669, 2, 'SNACK_FOOD', '식당_669', '식당_669_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (670, 2, 'WESTERN_FOOD', '식당_670', '식당_670_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (671, 2, 'SNACK_FOOD', '식당_671', '식당_671_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (672, 2, 'WESTERN_FOOD', '식당_672', '식당_672_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (673, 2, 'CHINESE_FOOD', '식당_673', '식당_673_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (674, 2, 'SNACK_FOOD', '식당_674', '식당_674_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (675, 2, 'WESTERN_FOOD', '식당_675', '식당_675_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (676, 2, 'CHINESE_FOOD', '식당_676', '식당_676_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (677, 2, 'SNACK_FOOD', '식당_677', '식당_677_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (678, 2, 'WESTERN_FOOD', '식당_678', '식당_678_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (679, 2, 'CHINESE_FOOD', '식당_679', '식당_679_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (680, 2, 'SNACK_FOOD', '식당_680', '식당_680_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (681, 2, 'WESTERN_FOOD', '식당_681', '식당_681_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (682, 2, 'CHINESE_FOOD', '식당_682', '식당_682_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (683, 2, 'SNACK_FOOD', '식당_683', '식당_683_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (684, 2, 'WESTERN_FOOD', '식당_684', '식당_684_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (685, 2, 'CHINESE_FOOD', '식당_685', '식당_685_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (686, 2, 'SNACK_FOOD', '식당_686', '식당_686_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (687, 2, 'WESTERN_FOOD', '식당_687', '식당_687_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (688, 2, 'CHINESE_FOOD', '식당_688', '식당_688_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (689, 2, 'SNACK_FOOD', '식당_689', '식당_689_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (690, 2, 'WESTERN_FOOD', '식당_690', '식당_690_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (691, 2, 'SNACK_FOOD', '식당_691', '식당_691_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (692, 2, 'WESTERN_FOOD', '식당_692', '식당_692_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (693, 2, 'CHINESE_FOOD', '식당_693', '식당_693_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (694, 2, 'SNACK_FOOD', '식당_694', '식당_694_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (695, 2, 'WESTERN_FOOD', '식당_695', '식당_695_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (696, 2, 'CHINESE_FOOD', '식당_696', '식당_696_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (697, 2, 'SNACK_FOOD', '식당_697', '식당_697_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (698, 2, 'WESTERN_FOOD', '식당_698', '식당_698_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (699, 2, 'CHINESE_FOOD', '식당_699', '식당_699_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (700, 2, 'SNACK_FOOD', '식당_700', '식당_700_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (701, 2, 'WESTERN_FOOD', '식당_701', '식당_701_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (702, 2, 'CHINESE_FOOD', '식당_702', '식당_702_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (703, 2, 'SNACK_FOOD', '식당_703', '식당_703_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (704, 2, 'WESTERN_FOOD', '식당_704', '식당_704_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (705, 2, 'CHINESE_FOOD', '식당_705', '식당_705_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (706, 2, 'SNACK_FOOD', '식당_706', '식당_706_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (707, 2, 'WESTERN_FOOD', '식당_707', '식당_707_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (708, 2, 'CHINESE_FOOD', '식당_708', '식당_708_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (709, 2, 'SNACK_FOOD', '식당_709', '식당_709_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (710, 2, 'WESTERN_FOOD', '식당_710', '식당_710_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (711, 2, 'SNACK_FOOD', '식당_711', '식당_711_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (712, 2, 'WESTERN_FOOD', '식당_712', '식당_712_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (713, 2, 'CHINESE_FOOD', '식당_713', '식당_713_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (714, 2, 'SNACK_FOOD', '식당_714', '식당_714_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (715, 2, 'WESTERN_FOOD', '식당_715', '식당_715_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (716, 2, 'CHINESE_FOOD', '식당_716', '식당_716_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (717, 2, 'SNACK_FOOD', '식당_717', '식당_717_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (718, 2, 'WESTERN_FOOD', '식당_718', '식당_718_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (719, 2, 'CHINESE_FOOD', '식당_719', '식당_719_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (720, 2, 'SNACK_FOOD', '식당_720', '식당_720_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (721, 2, 'WESTERN_FOOD', '식당_721', '식당_721_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (722, 2, 'CHINESE_FOOD', '식당_722', '식당_722_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (723, 2, 'SNACK_FOOD', '식당_723', '식당_723_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (724, 2, 'WESTERN_FOOD', '식당_724', '식당_724_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (725, 2, 'CHINESE_FOOD', '식당_725', '식당_725_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (726, 2, 'SNACK_FOOD', '식당_726', '식당_726_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (727, 2, 'WESTERN_FOOD', '식당_727', '식당_727_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (728, 2, 'CHINESE_FOOD', '식당_728', '식당_728_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (729, 2, 'SNACK_FOOD', '식당_729', '식당_729_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (730, 2, 'WESTERN_FOOD', '식당_730', '식당_730_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (731, 2, 'SNACK_FOOD', '식당_731', '식당_731_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (732, 2, 'WESTERN_FOOD', '식당_732', '식당_732_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (733, 2, 'CHINESE_FOOD', '식당_733', '식당_733_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (734, 2, 'SNACK_FOOD', '식당_734', '식당_734_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (735, 2, 'WESTERN_FOOD', '식당_735', '식당_735_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (736, 2, 'CHINESE_FOOD', '식당_736', '식당_736_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (737, 2, 'SNACK_FOOD', '식당_737', '식당_737_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (738, 2, 'WESTERN_FOOD', '식당_738', '식당_738_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (739, 2, 'CHINESE_FOOD', '식당_739', '식당_739_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (740, 2, 'SNACK_FOOD', '식당_740', '식당_740_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (741, 2, 'WESTERN_FOOD', '식당_741', '식당_741_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (742, 2, 'CHINESE_FOOD', '식당_742', '식당_742_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (743, 2, 'SNACK_FOOD', '식당_743', '식당_743_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (744, 2, 'WESTERN_FOOD', '식당_744', '식당_744_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (745, 2, 'CHINESE_FOOD', '식당_745', '식당_745_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (746, 2, 'SNACK_FOOD', '식당_746', '식당_746_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (747, 2, 'WESTERN_FOOD', '식당_747', '식당_747_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (748, 2, 'CHINESE_FOOD', '식당_748', '식당_748_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (749, 2, 'SNACK_FOOD', '식당_749', '식당_749_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (750, 2, 'WESTERN_FOOD', '식당_750', '식당_750_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (751, 2, 'SNACK_FOOD', '식당_751', '식당_751_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (752, 2, 'WESTERN_FOOD', '식당_752', '식당_752_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (753, 2, 'CHINESE_FOOD', '식당_753', '식당_753_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (754, 2, 'SNACK_FOOD', '식당_754', '식당_754_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (755, 2, 'WESTERN_FOOD', '식당_755', '식당_755_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (756, 2, 'CHINESE_FOOD', '식당_756', '식당_756_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (757, 2, 'SNACK_FOOD', '식당_757', '식당_757_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (758, 2, 'WESTERN_FOOD', '식당_758', '식당_758_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (759, 2, 'CHINESE_FOOD', '식당_759', '식당_759_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (760, 2, 'SNACK_FOOD', '식당_760', '식당_760_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (761, 2, 'WESTERN_FOOD', '식당_761', '식당_761_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (762, 2, 'CHINESE_FOOD', '식당_762', '식당_762_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (763, 2, 'SNACK_FOOD', '식당_763', '식당_763_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (764, 2, 'WESTERN_FOOD', '식당_764', '식당_764_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (765, 2, 'CHINESE_FOOD', '식당_765', '식당_765_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (766, 2, 'SNACK_FOOD', '식당_766', '식당_766_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (767, 2, 'WESTERN_FOOD', '식당_767', '식당_767_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (768, 2, 'CHINESE_FOOD', '식당_768', '식당_768_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (769, 2, 'SNACK_FOOD', '식당_769', '식당_769_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (770, 2, 'WESTERN_FOOD', '식당_770', '식당_770_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (771, 2, 'SNACK_FOOD', '식당_771', '식당_771_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (772, 2, 'WESTERN_FOOD', '식당_772', '식당_772_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (773, 2, 'CHINESE_FOOD', '식당_773', '식당_773_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (774, 2, 'SNACK_FOOD', '식당_774', '식당_774_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (775, 2, 'WESTERN_FOOD', '식당_775', '식당_775_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (776, 2, 'CHINESE_FOOD', '식당_776', '식당_776_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (777, 2, 'SNACK_FOOD', '식당_777', '식당_777_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (778, 2, 'WESTERN_FOOD', '식당_778', '식당_778_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (779, 2, 'CHINESE_FOOD', '식당_779', '식당_779_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (780, 2, 'SNACK_FOOD', '식당_780', '식당_780_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (781, 2, 'WESTERN_FOOD', '식당_781', '식당_781_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (782, 2, 'CHINESE_FOOD', '식당_782', '식당_782_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (783, 2, 'SNACK_FOOD', '식당_783', '식당_783_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (784, 2, 'WESTERN_FOOD', '식당_784', '식당_784_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (785, 2, 'CHINESE_FOOD', '식당_785', '식당_785_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (786, 2, 'SNACK_FOOD', '식당_786', '식당_786_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (787, 2, 'WESTERN_FOOD', '식당_787', '식당_787_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (788, 2, 'CHINESE_FOOD', '식당_788', '식당_788_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (789, 2, 'SNACK_FOOD', '식당_789', '식당_789_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (790, 2, 'WESTERN_FOOD', '식당_790', '식당_790_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (791, 2, 'SNACK_FOOD', '식당_791', '식당_791_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (792, 2, 'WESTERN_FOOD', '식당_792', '식당_792_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (793, 2, 'CHINESE_FOOD', '식당_793', '식당_793_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (794, 2, 'SNACK_FOOD', '식당_794', '식당_794_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (795, 2, 'WESTERN_FOOD', '식당_795', '식당_795_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (796, 2, 'CHINESE_FOOD', '식당_796', '식당_796_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (797, 2, 'SNACK_FOOD', '식당_797', '식당_797_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (798, 2, 'WESTERN_FOOD', '식당_798', '식당_798_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (799, 2, 'CHINESE_FOOD', '식당_799', '식당_799_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (800, 2, 'SNACK_FOOD', '식당_800', '식당_800_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (801, 2, 'WESTERN_FOOD', '식당_801', '식당_801_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (802, 2, 'CHINESE_FOOD', '식당_802', '식당_802_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (803, 2, 'SNACK_FOOD', '식당_803', '식당_803_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (804, 2, 'WESTERN_FOOD', '식당_804', '식당_804_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (805, 2, 'CHINESE_FOOD', '식당_805', '식당_805_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (806, 2, 'SNACK_FOOD', '식당_806', '식당_806_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (807, 2, 'WESTERN_FOOD', '식당_807', '식당_807_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (808, 2, 'CHINESE_FOOD', '식당_808', '식당_808_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (809, 2, 'SNACK_FOOD', '식당_809', '식당_809_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (810, 2, 'WESTERN_FOOD', '식당_810', '식당_810_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (811, 2, 'SNACK_FOOD', '식당_811', '식당_811_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (812, 2, 'WESTERN_FOOD', '식당_812', '식당_812_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (813, 2, 'CHINESE_FOOD', '식당_813', '식당_813_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (814, 2, 'SNACK_FOOD', '식당_814', '식당_814_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (815, 2, 'WESTERN_FOOD', '식당_815', '식당_815_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (816, 2, 'CHINESE_FOOD', '식당_816', '식당_816_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (817, 2, 'SNACK_FOOD', '식당_817', '식당_817_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (818, 2, 'WESTERN_FOOD', '식당_818', '식당_818_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (819, 2, 'CHINESE_FOOD', '식당_819', '식당_819_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (820, 2, 'SNACK_FOOD', '식당_820', '식당_820_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (821, 2, 'WESTERN_FOOD', '식당_821', '식당_821_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (822, 2, 'CHINESE_FOOD', '식당_822', '식당_822_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (823, 2, 'SNACK_FOOD', '식당_823', '식당_823_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (824, 2, 'WESTERN_FOOD', '식당_824', '식당_824_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (825, 2, 'CHINESE_FOOD', '식당_825', '식당_825_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (826, 2, 'SNACK_FOOD', '식당_826', '식당_826_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (827, 2, 'WESTERN_FOOD', '식당_827', '식당_827_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (828, 2, 'CHINESE_FOOD', '식당_828', '식당_828_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (829, 2, 'SNACK_FOOD', '식당_829', '식당_829_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (830, 2, 'WESTERN_FOOD', '식당_830', '식당_830_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (831, 2, 'SNACK_FOOD', '식당_831', '식당_831_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (832, 2, 'WESTERN_FOOD', '식당_832', '식당_832_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (833, 2, 'CHINESE_FOOD', '식당_833', '식당_833_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (834, 2, 'SNACK_FOOD', '식당_834', '식당_834_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (835, 2, 'WESTERN_FOOD', '식당_835', '식당_835_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (836, 2, 'CHINESE_FOOD', '식당_836', '식당_836_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (837, 2, 'SNACK_FOOD', '식당_837', '식당_837_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (838, 2, 'WESTERN_FOOD', '식당_838', '식당_838_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (839, 2, 'CHINESE_FOOD', '식당_839', '식당_839_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (840, 2, 'SNACK_FOOD', '식당_840', '식당_840_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (841, 2, 'WESTERN_FOOD', '식당_841', '식당_841_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (842, 2, 'CHINESE_FOOD', '식당_842', '식당_842_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (843, 2, 'SNACK_FOOD', '식당_843', '식당_843_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (844, 2, 'WESTERN_FOOD', '식당_844', '식당_844_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (845, 2, 'CHINESE_FOOD', '식당_845', '식당_845_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (846, 2, 'SNACK_FOOD', '식당_846', '식당_846_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (847, 2, 'WESTERN_FOOD', '식당_847', '식당_847_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (848, 2, 'CHINESE_FOOD', '식당_848', '식당_848_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (849, 2, 'SNACK_FOOD', '식당_849', '식당_849_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (850, 2, 'WESTERN_FOOD', '식당_850', '식당_850_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (851, 2, 'SNACK_FOOD', '식당_851', '식당_851_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (852, 2, 'WESTERN_FOOD', '식당_852', '식당_852_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (853, 2, 'CHINESE_FOOD', '식당_853', '식당_853_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (854, 2, 'SNACK_FOOD', '식당_854', '식당_854_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (855, 2, 'WESTERN_FOOD', '식당_855', '식당_855_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (856, 2, 'CHINESE_FOOD', '식당_856', '식당_856_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (857, 2, 'SNACK_FOOD', '식당_857', '식당_857_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (858, 2, 'WESTERN_FOOD', '식당_858', '식당_858_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (859, 2, 'CHINESE_FOOD', '식당_859', '식당_859_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (860, 2, 'SNACK_FOOD', '식당_860', '식당_860_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (861, 2, 'WESTERN_FOOD', '식당_861', '식당_861_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (862, 2, 'CHINESE_FOOD', '식당_862', '식당_862_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (863, 2, 'SNACK_FOOD', '식당_863', '식당_863_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (864, 2, 'WESTERN_FOOD', '식당_864', '식당_864_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (865, 2, 'CHINESE_FOOD', '식당_865', '식당_865_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (866, 2, 'SNACK_FOOD', '식당_866', '식당_866_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (867, 2, 'WESTERN_FOOD', '식당_867', '식당_867_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (868, 2, 'CHINESE_FOOD', '식당_868', '식당_868_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (869, 2, 'SNACK_FOOD', '식당_869', '식당_869_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (870, 2, 'WESTERN_FOOD', '식당_870', '식당_870_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (871, 2, 'SNACK_FOOD', '식당_871', '식당_871_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (872, 2, 'WESTERN_FOOD', '식당_872', '식당_872_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (873, 2, 'CHINESE_FOOD', '식당_873', '식당_873_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (874, 2, 'SNACK_FOOD', '식당_874', '식당_874_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (875, 2, 'WESTERN_FOOD', '식당_875', '식당_875_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (876, 2, 'CHINESE_FOOD', '식당_876', '식당_876_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (877, 2, 'SNACK_FOOD', '식당_877', '식당_877_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (878, 2, 'WESTERN_FOOD', '식당_878', '식당_878_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (879, 2, 'CHINESE_FOOD', '식당_879', '식당_879_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (880, 2, 'SNACK_FOOD', '식당_880', '식당_880_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (881, 2, 'WESTERN_FOOD', '식당_881', '식당_881_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (882, 2, 'CHINESE_FOOD', '식당_882', '식당_882_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (883, 2, 'SNACK_FOOD', '식당_883', '식당_883_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (884, 2, 'WESTERN_FOOD', '식당_884', '식당_884_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (885, 2, 'CHINESE_FOOD', '식당_885', '식당_885_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (886, 2, 'SNACK_FOOD', '식당_886', '식당_886_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (887, 2, 'WESTERN_FOOD', '식당_887', '식당_887_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (888, 2, 'CHINESE_FOOD', '식당_888', '식당_888_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (889, 2, 'SNACK_FOOD', '식당_889', '식당_889_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (890, 2, 'WESTERN_FOOD', '식당_890', '식당_890_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (891, 2, 'SNACK_FOOD', '식당_891', '식당_891_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (892, 2, 'WESTERN_FOOD', '식당_892', '식당_892_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (893, 2, 'CHINESE_FOOD', '식당_893', '식당_893_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (894, 2, 'SNACK_FOOD', '식당_894', '식당_894_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (895, 2, 'WESTERN_FOOD', '식당_895', '식당_895_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (896, 2, 'CHINESE_FOOD', '식당_896', '식당_896_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (897, 2, 'SNACK_FOOD', '식당_897', '식당_897_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (898, 2, 'WESTERN_FOOD', '식당_898', '식당_898_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (899, 2, 'CHINESE_FOOD', '식당_899', '식당_899_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (900, 2, 'SNACK_FOOD', '식당_900', '식당_900_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (901, 2, 'WESTERN_FOOD', '식당_901', '식당_901_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (902, 2, 'CHINESE_FOOD', '식당_902', '식당_902_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (903, 2, 'SNACK_FOOD', '식당_903', '식당_903_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (904, 2, 'WESTERN_FOOD', '식당_904', '식당_904_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (905, 2, 'CHINESE_FOOD', '식당_905', '식당_905_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (906, 2, 'SNACK_FOOD', '식당_906', '식당_906_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (907, 2, 'WESTERN_FOOD', '식당_907', '식당_907_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (908, 2, 'CHINESE_FOOD', '식당_908', '식당_908_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (909, 2, 'SNACK_FOOD', '식당_909', '식당_909_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (910, 2, 'WESTERN_FOOD', '식당_910', '식당_910_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (911, 2, 'SNACK_FOOD', '식당_911', '식당_911_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (912, 2, 'WESTERN_FOOD', '식당_912', '식당_912_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (913, 2, 'CHINESE_FOOD', '식당_913', '식당_913_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (914, 2, 'SNACK_FOOD', '식당_914', '식당_914_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (915, 2, 'WESTERN_FOOD', '식당_915', '식당_915_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (916, 2, 'CHINESE_FOOD', '식당_916', '식당_916_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (917, 2, 'SNACK_FOOD', '식당_917', '식당_917_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (918, 2, 'WESTERN_FOOD', '식당_918', '식당_918_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (919, 2, 'CHINESE_FOOD', '식당_919', '식당_919_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (920, 2, 'SNACK_FOOD', '식당_920', '식당_920_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (921, 2, 'WESTERN_FOOD', '식당_921', '식당_921_설명', 27, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (922, 2, 'CHINESE_FOOD', '식당_922', '식당_922_설명', 20, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (923, 2, 'SNACK_FOOD', '식당_923', '식당_923_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (924, 2, 'WESTERN_FOOD', '식당_924', '식당_924_설명', 30, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (925, 2, 'CHINESE_FOOD', '식당_925', '식당_925_설명', 23, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (926, 2, 'SNACK_FOOD', '식당_926', '식당_926_설명', 28, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (927, 2, 'WESTERN_FOOD', '식당_927', '식당_927_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (928, 2, 'CHINESE_FOOD', '식당_928', '식당_928_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (929, 2, 'SNACK_FOOD', '식당_929', '식당_929_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (930, 2, 'WESTERN_FOOD', '식당_930', '식당_930_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (931, 2, 'SNACK_FOOD', '식당_931', '식당_931_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (932, 2, 'WESTERN_FOOD', '식당_932', '식당_932_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (933, 2, 'CHINESE_FOOD', '식당_933', '식당_933_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (934, 2, 'SNACK_FOOD', '식당_934', '식당_934_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (935, 2, 'WESTERN_FOOD', '식당_935', '식당_935_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (936, 2, 'CHINESE_FOOD', '식당_936', '식당_936_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (937, 2, 'SNACK_FOOD', '식당_937', '식당_937_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (938, 2, 'WESTERN_FOOD', '식당_938', '식당_938_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (939, 2, 'CHINESE_FOOD', '식당_939', '식당_939_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (940, 2, 'SNACK_FOOD', '식당_940', '식당_940_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (941, 2, 'WESTERN_FOOD', '식당_941', '식당_941_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (942, 2, 'CHINESE_FOOD', '식당_942', '식당_942_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (943, 2, 'SNACK_FOOD', '식당_943', '식당_943_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (944, 2, 'WESTERN_FOOD', '식당_944', '식당_944_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (945, 2, 'CHINESE_FOOD', '식당_945', '식당_945_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (946, 2, 'SNACK_FOOD', '식당_946', '식당_946_설명', 28, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (947, 2, 'WESTERN_FOOD', '식당_947', '식당_947_설명', 21, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (948, 2, 'CHINESE_FOOD', '식당_948', '식당_948_설명', 26, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (949, 2, 'SNACK_FOOD', '식당_949', '식당_949_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (950, 2, 'WESTERN_FOOD', '식당_950', '식당_950_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (951, 2, 'SNACK_FOOD', '식당_951', '식당_951_설명', 22, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (952, 2, 'WESTERN_FOOD', '식당_952', '식당_952_설명', 27, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (953, 2, 'CHINESE_FOOD', '식당_953', '식당_953_설명', 20, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (954, 2, 'SNACK_FOOD', '식당_954', '식당_954_설명', 25, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (955, 2, 'WESTERN_FOOD', '식당_955', '식당_955_설명', 30, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (956, 2, 'CHINESE_FOOD', '식당_956', '식당_956_설명', 23, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (957, 2, 'SNACK_FOOD', '식당_957', '식당_957_설명', 28, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (958, 2, 'WESTERN_FOOD', '식당_958', '식당_958_설명', 21, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (959, 2, 'CHINESE_FOOD', '식당_959', '식당_959_설명', 26, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (960, 2, 'SNACK_FOOD', '식당_960', '식당_960_설명', 29, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (961, 2, 'WESTERN_FOOD', '식당_961', '식당_961_설명', 22, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (962, 2, 'SNACK_FOOD', '식당_962', '식당_962_설명', 27, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (963, 2, 'WESTERN_FOOD', '식당_963', '식당_963_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (964, 2, 'CHINESE_FOOD', '식당_964', '식당_964_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (965, 2, 'SNACK_FOOD', '식당_965', '식당_965_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (966, 2, 'WESTERN_FOOD', '식당_966', '식당_966_설명', 23, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (967, 2, 'CHINESE_FOOD', '식당_967', '식당_967_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (968, 2, 'SNACK_FOOD', '식당_968', '식당_968_설명', 24, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (969, 2, 'WESTERN_FOOD', '식당_969', '식당_969_설명', 29, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (970, 2, 'CHINESE_FOOD', '식당_970', '식당_970_설명', 16, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (971, 2, 'SNACK_FOOD', '식당_971', '식당_971_설명', 16, '2024-02-02', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (972, 2, 'WESTERN_FOOD', '식당_972', '식당_972_설명', 21, '2024-02-03', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (973, 2, 'CHINESE_FOOD', '식당_973', '식당_973_설명', 26, '2024-02-04', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (974, 2, 'SNACK_FOOD', '식당_974', '식당_974_설명', 19, '2024-02-05', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (975, 2, 'WESTERN_FOOD', '식당_975', '식당_975_설명', 24, '2024-02-06', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (976, 2, 'CHINESE_FOOD', '식당_976', '식당_976_설명', 29, '2024-02-07', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (977, 2, 'SNACK_FOOD', '식당_977', '식당_977_설명', 22, '2024-02-08', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (978, 2, 'WESTERN_FOOD', '식당_978', '식당_978_설명', 17, '2024-02-09', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (979, 2, 'CHINESE_FOOD', '식당_979', '식당_979_설명', 18, '2024-02-10', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (980, 2, 'SNACK_FOOD', '식당_980', '식당_980_설명', 25, '2024-02-11', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (981, 2, 'WESTERN_FOOD', '식당_981', '식당_981_설명', 20, '2024-02-12', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (982, 2, 'CHINESE_FOOD', '식당_982', '식당_982_설명', 25, '2024-02-13', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (983, 2, 'SNACK_FOOD', '식당_983', '식당_983_설명', 30, '2024-02-14', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (984, 2, 'WESTERN_FOOD', '식당_984', '식당_984_설명', 21, '2024-02-15', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (985, 2, 'CHINESE_FOOD', '식당_985', '식당_985_설명', 26, '2024-02-16', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (986, 2, 'SNACK_FOOD', '식당_986', '식당_986_설명', 19, '2024-02-17', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (987, 2, 'WESTERN_FOOD', '식당_987', '식당_987_설명', 24, '2024-02-18', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (988, 2, 'CHINESE_FOOD', '식당_988', '식당_988_설명', 29, '2024-02-19', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (989, 2, 'SNACK_FOOD', '식당_989', '식당_989_설명', 22, '2024-02-20', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (990, 2, 'WESTERN_FOOD', '식당_990', '식당_990_설명', 17, '2024-02-21', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (991, 2, 'CHINESE_FOOD', '식당_991', '식당_991_설명', 18, '2024-02-22', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (992, 2, 'SNACK_FOOD', '식당_992', '식당_992_설명', 25, '2024-02-23', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (993, 2, 'WESTERN_FOOD', '식당_993', '식당_993_설명', 20, '2024-02-24', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (994, 2, 'CHINESE_FOOD', '식당_994', '식당_994_설명', 25, '2024-02-25', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (995, 2, 'SNACK_FOOD', '식당_995', '식당_995_설명', 30, '2024-02-26', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (996, 2, 'WESTERN_FOOD', '식당_996', '식당_996_설명', 21, '2024-02-27', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (997, 2, 'CHINESE_FOOD', '식당_997', '식당_997_설명', 26, '2024-02-28', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (998, 2, 'SNACK_FOOD', '식당_998', '식당_998_설명', 19, '2024-02-29', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (999, 2, 'WESTERN_FOOD', '식당_999', '식당_999_설명', 24, '2024-02-01', null, null, null);
INSERT
INTO store
(id, member_id, category, name, description, max_waiting_count, created_at, modified_at, created_by, modified_by)
VALUES (1000, 2, 'CHINESE_FOOD', '식당_1000', '식당_1000_설명', 29, '2024-02-02', null, null, null);

-- 영업 시간
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (1, 1, 'MONDAY', '08:00:00', '21:00:00', '2023-09-18', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (2, 2, 'TUESDAY', '09:00:00', '15:00:00', '2023-09-19', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (3, 2, 'TUESDAY', '18:00:00', '23:59:59.999999', '2023-09-19', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (4, 2, 'WEDNESDAY', '00:00:00', '01:00:00', '2023-09-19', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (5, 3, 'TUESDAY', '11:00:00', '16:00:00', '2023-09-19', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (6, 3, 'TUESDAY', '18:00:00', '23:00:00', '2023-09-19', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (7, 7, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (8, 8, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (9, 9, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (10, 10, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (11, 11, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (12, 12, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (13, 13, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (14, 14, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (15, 15, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (16, 16, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (17, 17, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (18, 18, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (19, 19, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (20, 20, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (21, 21, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (22, 22, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (23, 23, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (24, 24, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (25, 25, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (26, 26, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (27, 27, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (28, 28, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (29, 29, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (30, 30, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (31, 31, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (32, 32, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (33, 33, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (34, 34, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (35, 35, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (36, 36, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (37, 37, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (38, 38, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (39, 39, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (40, 40, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (41, 41, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (42, 42, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (43, 43, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (44, 44, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (45, 45, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (46, 46, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (47, 47, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (48, 48, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (49, 49, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (50, 50, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (51, 51, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (52, 52, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (53, 53, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (54, 54, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (55, 55, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (56, 56, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (57, 57, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (58, 58, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (59, 59, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (60, 60, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (61, 61, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (62, 62, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (63, 63, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (64, 64, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (65, 65, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (66, 66, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (67, 67, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (68, 68, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (69, 69, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (70, 70, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (71, 71, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (72, 72, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (73, 73, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (74, 74, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (75, 75, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (76, 76, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (77, 77, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (78, 78, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (79, 79, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (80, 80, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (81, 81, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (82, 82, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (83, 83, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (84, 84, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (85, 85, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (86, 86, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (87, 87, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (88, 88, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (89, 89, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (90, 90, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (91, 91, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (92, 92, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (93, 93, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (94, 94, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (95, 95, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (96, 96, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (97, 97, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (98, 98, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (99, 99, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (100, 100, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (101, 101, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (102, 102, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (103, 103, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (104, 104, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (105, 105, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (106, 106, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (107, 107, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (108, 108, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (109, 109, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (110, 110, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (111, 111, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (112, 112, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (113, 113, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (114, 114, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (115, 115, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (116, 116, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (117, 117, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (118, 118, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (119, 119, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (120, 120, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (121, 121, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (122, 122, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (123, 123, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (124, 124, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (125, 125, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (126, 126, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (127, 127, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (128, 128, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (129, 129, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (130, 130, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (131, 131, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (132, 132, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (133, 133, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (134, 134, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (135, 135, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (136, 136, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (137, 137, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (138, 138, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (139, 139, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (140, 140, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (141, 141, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (142, 142, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (143, 143, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (144, 144, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (145, 145, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (146, 146, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (147, 147, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (148, 148, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (149, 149, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (150, 150, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (151, 151, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (152, 152, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (153, 153, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (154, 154, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (155, 155, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (156, 156, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (157, 157, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (158, 158, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (159, 159, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (160, 160, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (161, 161, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (162, 162, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (163, 163, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (164, 164, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (165, 165, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (166, 166, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (167, 167, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (168, 168, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (169, 169, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (170, 170, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (171, 171, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (172, 172, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (173, 173, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (174, 174, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (175, 175, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (176, 176, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (177, 177, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (178, 178, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (179, 179, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (180, 180, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (181, 181, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (182, 182, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (183, 183, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (184, 184, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (185, 185, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (186, 186, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (187, 187, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (188, 188, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (189, 189, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (190, 190, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (191, 191, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (192, 192, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (193, 193, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (194, 194, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (195, 195, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (196, 196, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (197, 197, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (198, 198, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (199, 199, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (200, 200, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (201, 201, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (202, 202, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (203, 203, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (204, 204, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (205, 205, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (206, 206, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (207, 207, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (208, 208, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (209, 209, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (210, 210, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (211, 211, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (212, 212, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (213, 213, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (214, 214, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (215, 215, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (216, 216, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (217, 217, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (218, 218, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (219, 219, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (220, 220, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (221, 221, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (222, 222, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (223, 223, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (224, 224, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (225, 225, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (226, 226, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (227, 227, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (228, 228, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (229, 229, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (230, 230, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (231, 231, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (232, 232, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (233, 233, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (234, 234, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (235, 235, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (236, 236, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (237, 237, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (238, 238, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (239, 239, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (240, 240, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (241, 241, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (242, 242, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (243, 243, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (244, 244, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (245, 245, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (246, 246, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (247, 247, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (248, 248, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (249, 249, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (250, 250, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (251, 251, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (252, 252, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (253, 253, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (254, 254, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (255, 255, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (256, 256, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (257, 257, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (258, 258, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (259, 259, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (260, 260, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (261, 261, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (262, 262, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (263, 263, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (264, 264, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (265, 265, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (266, 266, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (267, 267, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (268, 268, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (269, 269, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (270, 270, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (271, 271, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (272, 272, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (273, 273, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (274, 274, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (275, 275, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (276, 276, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (277, 277, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (278, 278, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (279, 279, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (280, 280, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (281, 281, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (282, 282, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (283, 283, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (284, 284, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (285, 285, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (286, 286, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (287, 287, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (288, 288, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (289, 289, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (290, 290, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (291, 291, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (292, 292, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (293, 293, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (294, 294, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (295, 295, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (296, 296, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (297, 297, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (298, 298, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (299, 299, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (300, 300, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (301, 301, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (302, 302, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (303, 303, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (304, 304, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (305, 305, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (306, 306, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (307, 307, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (308, 308, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (309, 309, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (310, 310, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (311, 311, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (312, 312, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (313, 313, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (314, 314, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (315, 315, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (316, 316, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (317, 317, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (318, 318, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (319, 319, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (320, 320, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (321, 321, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (322, 322, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (323, 323, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (324, 324, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (325, 325, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (326, 326, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (327, 327, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (328, 328, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (329, 329, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (330, 330, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (331, 331, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (332, 332, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (333, 333, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (334, 334, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (335, 335, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (336, 336, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (337, 337, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (338, 338, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (339, 339, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (340, 340, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (341, 341, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (342, 342, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (343, 343, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (344, 344, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (345, 345, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (346, 346, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (347, 347, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (348, 348, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (349, 349, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (350, 350, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (351, 351, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (352, 352, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (353, 353, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (354, 354, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (355, 355, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (356, 356, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (357, 357, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (358, 358, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (359, 359, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (360, 360, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (361, 361, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (362, 362, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (363, 363, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (364, 364, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (365, 365, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (366, 366, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (367, 367, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (368, 368, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (369, 369, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (370, 370, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (371, 371, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (372, 372, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (373, 373, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (374, 374, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (375, 375, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (376, 376, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (377, 377, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (378, 378, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (379, 379, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (380, 380, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (381, 381, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (382, 382, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (383, 383, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (384, 384, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (385, 385, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (386, 386, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (387, 387, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (388, 388, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (389, 389, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (390, 390, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (391, 391, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (392, 392, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (393, 393, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (394, 394, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (395, 395, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (396, 396, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (397, 397, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (398, 398, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (399, 399, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (400, 400, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (401, 401, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (402, 402, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (403, 403, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (404, 404, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (405, 405, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (406, 406, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (407, 407, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (408, 408, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (409, 409, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (410, 410, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (411, 411, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (412, 412, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (413, 413, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (414, 414, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (415, 415, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (416, 416, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (417, 417, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (418, 418, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (419, 419, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (420, 420, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (421, 421, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (422, 422, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (423, 423, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (424, 424, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (425, 425, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (426, 426, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (427, 427, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (428, 428, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (429, 429, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (430, 430, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (431, 431, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (432, 432, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (433, 433, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (434, 434, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (435, 435, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (436, 436, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (437, 437, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (438, 438, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (439, 439, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (440, 440, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (441, 441, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (442, 442, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (443, 443, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (444, 444, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (445, 445, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (446, 446, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (447, 447, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (448, 448, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (449, 449, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (450, 450, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (451, 451, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (452, 452, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (453, 453, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (454, 454, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (455, 455, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (456, 456, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (457, 457, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (458, 458, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (459, 459, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (460, 460, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (461, 461, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (462, 462, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (463, 463, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (464, 464, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (465, 465, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (466, 466, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (467, 467, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (468, 468, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (469, 469, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (470, 470, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (471, 471, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (472, 472, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (473, 473, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (474, 474, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (475, 475, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (476, 476, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (477, 477, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (478, 478, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (479, 479, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (480, 480, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (481, 481, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (482, 482, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (483, 483, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (484, 484, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (485, 485, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (486, 486, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (487, 487, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (488, 488, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (489, 489, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (490, 490, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (491, 491, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (492, 492, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (493, 493, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (494, 494, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (495, 495, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (496, 496, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (497, 497, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (498, 498, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (499, 499, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (500, 500, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (501, 501, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (502, 502, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (503, 503, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (504, 504, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (505, 505, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (506, 506, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (507, 507, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (508, 508, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (509, 509, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (510, 510, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (511, 511, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (512, 512, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (513, 513, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (514, 514, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (515, 515, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (516, 516, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (517, 517, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (518, 518, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (519, 519, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (520, 520, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (521, 521, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (522, 522, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (523, 523, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (524, 524, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (525, 525, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (526, 526, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (527, 527, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (528, 528, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (529, 529, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (530, 530, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (531, 531, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (532, 532, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (533, 533, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (534, 534, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (535, 535, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (536, 536, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (537, 537, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (538, 538, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (539, 539, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (540, 540, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (541, 541, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (542, 542, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (543, 543, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (544, 544, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (545, 545, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (546, 546, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (547, 547, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (548, 548, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (549, 549, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (550, 550, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (551, 551, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (552, 552, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (553, 553, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (554, 554, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (555, 555, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (556, 556, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (557, 557, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (558, 558, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (559, 559, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (560, 560, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (561, 561, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (562, 562, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (563, 563, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (564, 564, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (565, 565, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (566, 566, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (567, 567, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (568, 568, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (569, 569, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (570, 570, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (571, 571, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (572, 572, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (573, 573, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (574, 574, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (575, 575, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (576, 576, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (577, 577, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (578, 578, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (579, 579, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (580, 580, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (581, 581, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (582, 582, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (583, 583, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (584, 584, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (585, 585, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (586, 586, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (587, 587, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (588, 588, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (589, 589, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (590, 590, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (591, 591, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (592, 592, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (593, 593, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (594, 594, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (595, 595, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (596, 596, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (597, 597, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (598, 598, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (599, 599, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (600, 600, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (601, 601, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (602, 602, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (603, 603, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (604, 604, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (605, 605, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (606, 606, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (607, 607, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (608, 608, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (609, 609, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (610, 610, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (611, 611, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (612, 612, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (613, 613, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (614, 614, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (615, 615, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (616, 616, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (617, 617, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (618, 618, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (619, 619, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (620, 620, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (621, 621, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (622, 622, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (623, 623, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (624, 624, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (625, 625, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (626, 626, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (627, 627, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (628, 628, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (629, 629, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (630, 630, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (631, 631, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (632, 632, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (633, 633, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (634, 634, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (635, 635, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (636, 636, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (637, 637, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (638, 638, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (639, 639, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (640, 640, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (641, 641, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (642, 642, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (643, 643, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (644, 644, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (645, 645, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (646, 646, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (647, 647, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (648, 648, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (649, 649, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (650, 650, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (651, 651, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (652, 652, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (653, 653, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (654, 654, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (655, 655, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (656, 656, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (657, 657, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (658, 658, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (659, 659, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (660, 660, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (661, 661, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (662, 662, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (663, 663, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (664, 664, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (665, 665, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (666, 666, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (667, 667, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (668, 668, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (669, 669, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (670, 670, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (671, 671, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (672, 672, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (673, 673, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (674, 674, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (675, 675, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (676, 676, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (677, 677, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (678, 678, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (679, 679, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (680, 680, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (681, 681, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (682, 682, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (683, 683, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (684, 684, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (685, 685, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (686, 686, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (687, 687, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (688, 688, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (689, 689, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (690, 690, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (691, 691, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (692, 692, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (693, 693, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (694, 694, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (695, 695, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (696, 696, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (697, 697, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (698, 698, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (699, 699, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (700, 700, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (701, 701, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (702, 702, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (703, 703, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (704, 704, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (705, 705, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (706, 706, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (707, 707, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (708, 708, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (709, 709, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (710, 710, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (711, 711, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (712, 712, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (713, 713, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (714, 714, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (715, 715, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (716, 716, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (717, 717, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (718, 718, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (719, 719, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (720, 720, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (721, 721, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (722, 722, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (723, 723, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (724, 724, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (725, 725, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (726, 726, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (727, 727, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (728, 728, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (729, 729, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (730, 730, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (731, 731, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (732, 732, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (733, 733, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (734, 734, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (735, 735, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (736, 736, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (737, 737, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (738, 738, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (739, 739, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (740, 740, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (741, 741, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (742, 742, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (743, 743, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (744, 744, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (745, 745, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (746, 746, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (747, 747, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (748, 748, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (749, 749, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (750, 750, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (751, 751, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (752, 752, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (753, 753, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (754, 754, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (755, 755, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (756, 756, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (757, 757, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (758, 758, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (759, 759, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (760, 760, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (761, 761, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (762, 762, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (763, 763, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (764, 764, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (765, 765, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (766, 766, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (767, 767, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (768, 768, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (769, 769, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (770, 770, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (771, 771, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (772, 772, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (773, 773, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (774, 774, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (775, 775, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (776, 776, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (777, 777, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (778, 778, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (779, 779, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (780, 780, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (781, 781, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (782, 782, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (783, 783, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (784, 784, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (785, 785, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (786, 786, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (787, 787, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (788, 788, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (789, 789, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (790, 790, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (791, 791, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (792, 792, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (793, 793, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (794, 794, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (795, 795, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (796, 796, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (797, 797, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (798, 798, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (799, 799, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (800, 800, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (801, 801, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (802, 802, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (803, 803, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (804, 804, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (805, 805, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (806, 806, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (807, 807, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (808, 808, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (809, 809, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (810, 810, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (811, 811, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (812, 812, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (813, 813, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (814, 814, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (815, 815, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (816, 816, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (817, 817, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (818, 818, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (819, 819, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (820, 820, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (821, 821, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (822, 822, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (823, 823, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (824, 824, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (825, 825, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (826, 826, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (827, 827, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (828, 828, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (829, 829, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (830, 830, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (831, 831, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (832, 832, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (833, 833, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (834, 834, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (835, 835, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (836, 836, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (837, 837, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (838, 838, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (839, 839, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (840, 840, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (841, 841, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (842, 842, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (843, 843, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (844, 844, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (845, 845, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (846, 846, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (847, 847, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (848, 848, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (849, 849, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (850, 850, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (851, 851, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (852, 852, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (853, 853, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (854, 854, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (855, 855, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (856, 856, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (857, 857, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (858, 858, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (859, 859, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (860, 860, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (861, 861, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (862, 862, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (863, 863, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (864, 864, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (865, 865, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (866, 866, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (867, 867, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (868, 868, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (869, 869, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (870, 870, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (871, 871, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (872, 872, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (873, 873, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (874, 874, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (875, 875, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (876, 876, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (877, 877, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (878, 878, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (879, 879, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (880, 880, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (881, 881, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (882, 882, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (883, 883, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (884, 884, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (885, 885, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (886, 886, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (887, 887, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (888, 888, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (889, 889, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (890, 890, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (891, 891, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (892, 892, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (893, 893, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (894, 894, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (895, 895, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (896, 896, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (897, 897, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (898, 898, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (899, 899, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (900, 900, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (901, 901, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (902, 902, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (903, 903, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (904, 904, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (905, 905, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (906, 906, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (907, 907, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (908, 908, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (909, 909, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (910, 910, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (911, 911, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (912, 912, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (913, 913, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (914, 914, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (915, 915, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (916, 916, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (917, 917, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (918, 918, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (919, 919, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (920, 920, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (921, 921, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (922, 922, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (923, 923, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (924, 924, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (925, 925, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (926, 926, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (927, 927, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (928, 928, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (929, 929, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (930, 930, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (931, 931, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (932, 932, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (933, 933, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (934, 934, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (935, 935, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (936, 936, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (937, 937, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (938, 938, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (939, 939, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (940, 940, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (941, 941, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (942, 942, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (943, 943, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (944, 944, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (945, 945, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (946, 946, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (947, 947, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (948, 948, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (949, 949, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (950, 950, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (951, 951, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (952, 952, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (953, 953, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (954, 954, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (955, 955, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (956, 956, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (957, 957, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (958, 958, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (959, 959, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (960, 960, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (961, 961, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (962, 962, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (963, 963, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (964, 964, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (965, 965, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (966, 966, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (967, 967, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (968, 968, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (969, 969, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (970, 970, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (971, 971, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (972, 972, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (973, 973, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (974, 974, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (975, 975, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (976, 976, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (977, 977, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (978, 978, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (979, 979, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (980, 980, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (981, 981, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (982, 982, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (983, 983, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (984, 984, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (985, 985, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (986, 986, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (987, 987, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (988, 988, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (989, 989, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (990, 990, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (991, 991, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (992, 992, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (993, 993, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (994, 994, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (995, 995, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (996, 996, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (997, 997, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (998, 998, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (999, 999, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);
INSERT
INTO business_hour
(id, store_id, day_of_week, start_time, end_time, created_at, modified_at, created_by, modified_by)
VALUES (1000, 1000, 'MONDAY', '08:00:00', '21:00:00', '2024-03-01', null, null, null);

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
(id, store_id, member_id, head_count, status, created_at, modified_at, created_by, modified_by, code)
VALUES (1, 1, 4, 3, 'ONGOING', '2023-09-28', null, null, null, '1:1:2023-09-28');
INSERT
INTO waiting
(id, store_id, member_id, head_count, status, created_at, modified_at, created_by, modified_by, code)
VALUES (2, 1, 5, 4, 'ONGOING', '2023-09-28', null, null, null, '1:5:2023-09-28');
INSERT
INTO waiting
(id, store_id, member_id, head_count, status, created_at, modified_at, created_by, modified_by, code)
VALUES (3, 1, 6, 6, 'ONGOING', '2023-09-28', null, null, null, '1:6:2023-09-28');
INSERT
INTO waiting
(id, store_id, member_id, head_count, status, created_at, modified_at, created_by, modified_by, code)
VALUES (4, 2, 7, 2, 'ONGOING', '2023-09-28', null, null, null, '2:7:2023-09-28');
INSERT
INTO waiting
(id, store_id, member_id, head_count, status, created_at, modified_at, created_by, modified_by, code)
VALUES (5, 2, 8, 1, 'ONGOING', '2023-09-28', null, null, null, '2:8:2023-09-28');
INSERT
INTO waiting
(id, store_id, member_id, head_count, status, created_at, modified_at, created_by, modified_by, code)
VALUES (6, 3, 9, 4, 'ONGOING', '2023-09-28', null, null, null, '3:9:2023-09-28');
INSERT
INTO waiting
(id, store_id, member_id, head_count, status, created_at, modified_at, created_by, modified_by, code)
VALUES (7, 3, 10, 2, 'ONGOING', '2023-09-28', null, null, null, '3:10:2023-09-28');
INSERT
INTO waiting
(id, store_id, member_id, head_count, status, created_at, modified_at, created_by, modified_by, code)
VALUES (8, 1, 7, 2, 'ONGOING', '2023-10-20 15:30:00', null, null, null, '1:7:2023-10-20');
INSERT
INTO waiting
(id, store_id, member_id, head_count, status, created_at, modified_at, created_by, modified_by, code)
VALUES (9, 3, 4, 2, 'ONGOING', '2023-10-20 15:30:00', null, null, null, '3:4:2023-10-20');
INSERT
INTO waiting
(id, store_id, member_id, head_count, status, created_at, modified_at, created_by, modified_by, code)
VALUES (10, 3, 5, 4, 'ONGOING', '2023-10-20 15:30:00', null, null, null, '3:5:2023-10-20');
INSERT
INTO waiting
(id, store_id, member_id, head_count, status, created_at, modified_at, created_by, modified_by, code)
VALUES (11, 3, 6, 2, 'ONGOING', '2023-10-20 15:30:00', null, null, null, '3:6:2023-10-20');

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
