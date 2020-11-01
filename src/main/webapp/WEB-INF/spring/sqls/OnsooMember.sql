DROP SEQUENCE MEMBERSEQ;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
	

DROP TABLE authorities CASCADE CONSTRAINTS;




--회원테이블 
SELECT * FROM MEMBER;

--권한 테이블 
SELECT * FROM authorities


/*
--회원가입후 해당 아이디에 권한을 부여 

--권한 부여할 경우 해당  ('아이디값','ROLE_USER')  이 같은 형식으로 부여 해야함 

-- 다만 여러 권한이 필요할 경우  같은경우 해당 계정에 각각 ADMIN, BLOCK 추가로 INSERT 해주면 된다 .
 
 ex) 일반회원 권한 1개 
 		INSERT INTO authorities (MEMBER_ID, authority) VALUES ('user', 'ROLE_USER');
 	   
 	   
 	   관리자   권한 2개 
 	    INSERT INTO authorities (MEMBER_ID, authority) VALUES ('admin', 'ROLE_ADMIN');
		INSERT INTO authorities (MEMBER_ID, authority) VALUES ('admin', 'ROLE_USER');
	
	

*/
SELECT * FROM MEMBER;

SELECT * FROM authorities;


INSERT INTO authorities (MEMBER_ID, authority) VALUES ('toss', 'ROLE_ADMIN');
INSERT INTO authorities (MEMBER_ID, authority) VALUES ('user1', 'ROLE_USER');
INSERT INTO authorities (MEMBER_ID, authority) VALUES ('user', 'ROLE_USER');
INSERT INTO authorities (MEMBER_ID, authority) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO authorities (MEMBER_ID, authority) VALUES ('admin', 'ROLE_USER');





CREATE SEQUENCE MEMBERSEQ;

CREATE TABLE MEMBER(
	-- 회원 번호 (PK X)
	SEQ NUMBER NOT NULL, 
	
	-- 회원 ID (PK)
	MEMBER_ID VARCHAR2(100) NOT NULL,
	
	-- 회원 Password
	MEMBER_PW VARCHAR2(100) NOT NULL,
	
	-- 회원 이름
	MEMBER_NAME VARCHAR2(50) NOT NULL,
	
	-- 회원 성별
	MEMBER_GENDER VARCHAR2(30) NOT NULL,
	
	-- 회원 전화번호 (Unique)
	MEMBER_PHONE VARCHAR2(20) NOT NULL,
	
	-- 회원 EMAIL (Unique)
	MEMBER_EMAIL VARCHAR2(1000) NOT NULL,
	
	-- 회원 주소
	MEMBER_ADDR VARCHAR2(2000) NOT NULL,
	
	-- 회원 생일 (kakao:mmdd, naver:mm-dd, google:?, facebook:?)
	MEMBER_BIRTH VARCHAR2(20) NOT NULL,
	
	-- 회원 상태
	MEMBER_ROLE CHAR(8) NOT NULL,
	
	-- 회원 가입일자
	MEMBER_REGDATE DATE NOT NULL,
	
	-- 회원 탈퇴일자 (NOT NULL X)
	MEMBER_DDATE DATE,
	
	-- 회원 정지일자 (NOT NULL X)
	MEMBER_BDATE DATE, 
	
	--권한설정=1
	enabled    NUMBER	 NULL ,
	
	--integer nummber
	-- 회원 ID : PK
	CONSTRAINT ID_MEMBER_PK PRIMARY KEY(MEMBER_ID), 
	
	-- 회원 성별 : CHK(F:emale, M:ale)
	CONSTRAINT MEMBER_GENDER_MEMBER_CHK CHECK(MEMBER_GENDER IN('F','M')), 
	
	-- 회원 전화번호 : UQ
	CONSTRAINT PHONE_MEMBER_UNQ UNIQUE(MEMBER_PHONE), 
	
	-- 회원 EMAIL : UQ
	CONSTRAINT EMAIL_MEMBER_UNQ UNIQUE(MEMBER_EMAIL), 

	-- 회원 상태 : CHK(S:tudent(회원), I:ntern(교생), T:eacher(강사), A:dmin(관리자), D:eleted(탈퇴), B:locked(정지))
	CONSTRAINT MEMBER_ROLE_MEMBER_CHK CHECK(MEMBER_ROLE IN('S','I','T','A','D','B'))
	
);



SELECT * FROM MEMBER;

--관리자 계정
INSERT INTO MEMBER 
VALUES(MEMBERSEQ.NEXTVAL, 'admin', 'admin', '관리자', 'M', '010-0000-0000', 
	'admin@onsoo.com', '서울 강남구 역삼동', '1019', 'A', SYSDATE, NULL, NULL,1);



DROP TABLE authorities CASCADE CONSTRAINTS;



SELECT * FROM authorities

--권한테이블 추가 
CREATE TABLE authorities(
		MEMBER_ID                      		VARCHAR2(20)		 NOT NULL,
		authority                     		VARCHAR2(20)		 NOT NULL
);


ALTER TABLE authorities ADD CONSTRAINT IDX_authorities_PK PRIMARY KEY (MEMBER_ID, authority);
ALTER TABLE authorities ADD CONSTRAINT IDX_authorities_FK0 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID);


