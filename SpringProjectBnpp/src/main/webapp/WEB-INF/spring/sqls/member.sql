<<<<<<< HEAD
DROP TABLE MEMBER CASCADE CONSTRAINTS;

CREATE TABLE MEMBER(
	MEMBER_ID VARCHAR2(100) NOT NULL PRIMARY KEY,
	MEMBER_PW VARCHAR2(1000) NOT NULL,
	MEMBER_NAME VARCHAR2(20),
	MEMBER_EMAIL VARCHAR2(300),
	MEMBER_PHONE VARCHAR2(20),
	MEMBER_ADDRESS VARCHAR2(1000),
	MEMBER_ROLE VARCHAR2(5) DEFAULT 'M' NOT NULL,
	MEMBER_CATEGORY VARCHAR2(300),
	MEMBER_CERTI VARCHAR2(1000),
	MEMBER_CAREER VARCHAR2(2000),
	MEMBER_REGDATE DATE,
	CONSTRAINT MEMBER_ROLE_CHK CHECK (MEMBER_ROLE IN ('M','T','A'))
);

SELECT * FROM all_all_tables

ALTER TABLE MEMBER ADD MEMBER_IMG_PATH VARCHAR2(500);
ALTER TABLE MEMBER ADD MEMBER_IMG_NAME VARCHAR2(300);

SELECT * FROM MEMBER;


SELECT COUNT(*) 
FROM MEMBER
WHERE MEMBER_ID='member01';

INSERT INTO MEMBER
VALUES('member01','member01','Tommy', 'tommy@naver.com', '010-0000-0001', '서울시 서초구', 'M', null, null, null, SYSDATE);

INSERT INTO MEMBER
VALUES('teacher01','teacher01','Roki', 'Roki@naver.com', '010-0001-0000', '서울시 강남구', 'T',  '한식', '한식조리장', '조선호텔 2년, 강남회관 3년', SYSDATE);

INSERT INTO MEMBER
VALUES('admin','admin','KH', 'admin@admin', '000-0000-0000', '한국', 'A', null, null, null, SYSDATE);

INSERT INTO MEMBER
VALUES('member02', 'member02', 'Yoon', '', '','', DEFAULT,'','','',SYSDATE);

INSERT INTO MEMBER
VALUES('member04', 'member04', '4', '', '','', DEFAULT,'','','',SYSDATE);

DELETE MEMBER
WHERE MEMBER_ID = 'member04';
=======
DROP TABLE MEMBER CASCADE CONSTRAINTS;

CREATE TABLE MEMBER(
	MEMBER_ID VARCHAR2(100) NOT NULL PRIMARY KEY,
	MEMBER_PW VARCHAR2(1000) NOT NULL,
	MEMBER_NAME VARCHAR2(20),
	MEMBER_EMAIL VARCHAR2(300),
	MEMBER_PHONE VARCHAR2(20),
	MEMBER_ADDRESS VARCHAR2(1000),
	MEMBER_ROLE VARCHAR2(5) DEFAULT 'M' NOT NULL,
	MEMBER_CATEGORY VARCHAR2(300),
	MEMBER_INTRO VARCHAR2(1000) DEFAULT '안녕하세요 잘부탁드립니다!',
	MEMBER_CERTI VARCHAR2(1000),
	MEMBER_CAREER VARCHAR2(2000),
	MEMBER_REGDATE DATE,
	MEMBER_IMG_PATH VARCHAR2(500),
	MEMBER_IMG_NAME VARCHAR2(300),
	CONSTRAINT MEMBER_ROLE_CHK CHECK (MEMBER_ROLE IN ('M','T','A'))
);

ALTER TABLE MEMBER ADD MEMBER_IMG_PATH VARCHAR2(500);
ALTER TABLE MEMBER ADD MEMBER_IMG_NAME VARCHAR2(300);

SELECT * FROM all_all_tables

SELECT * FROM MEMBER;

SELECT COUNT(*) 
FROM MEMBER
WHERE MEMBER_ID='member01';

INSERT INTO MEMBER
VALUES('member01','member01','Tommy', 'tommy@naver.com', '010-0000-0001', '서울시 서초구', 'M', null,null, null, null, SYSDATE);

INSERT INTO MEMBER
VALUES('teacher01','teacher01','Roki', 'Roki@naver.com', '010-0001-0000', '서울시 강남구', 'T',  '한식', '김밥달인','한식조리장', '조선호텔 2년, 강남회관 3년', SYSDATE , '', '');

INSERT INTO MEMBER
VALUES('admin','admin','KH', 'admin@admin', '000-0000-0000', '한국', 'A', DEFAULT ,null, null, null, SYSDATE);

INSERT INTO MEMBER
VALUES('member02', 'member02', 'Yoon', '', '','', DEFAULT, '','','','',SYSDATE);

INSERT INTO MEMBER
VALUES('member04', 'member04', '4', '', '','', DEFAULT, '','','','',SYSDATE);

DELETE MEMBER
WHERE MEMBER_ID = 'member04';

<<<<<<< HEAD
DELETE MEMBER
WHERE MEMBER_ID = '윤인섭Na';

DELETE MEMBER
WHERE MEMBER_ID = '윤인섭ka';
=======

ALTER TABLE MEMBER ADD MEMBER_IMG_PATH VARCHAR2(500);
ALTER TABLE MEMBER ADD MEMBER_IMG_NAME VARCHAR2(300);

>>>>>>> origin/test
>>>>>>> origin/test
