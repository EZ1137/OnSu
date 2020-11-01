DROP SEQUENCE MEMBERSEQ;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
	

DROP TABLE authorities CASCADE CONSTRAINTS;




--ȸ�����̺� 
SELECT * FROM MEMBER;

--���� ���̺� 
SELECT * FROM authorities


/*
--ȸ�������� �ش� ���̵� ������ �ο� 

--���� �ο��� ��� �ش�  ('���̵�','ROLE_USER')  �� ���� �������� �ο� �ؾ��� 

-- �ٸ� ���� ������ �ʿ��� ���  ������� �ش� ������ ���� ADMIN, BLOCK �߰��� INSERT ���ָ� �ȴ� .
 
 ex) �Ϲ�ȸ�� ���� 1�� 
 		INSERT INTO authorities (MEMBER_ID, authority) VALUES ('user', 'ROLE_USER');
 	   
 	   
 	   ������   ���� 2�� 
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
	-- ȸ�� ��ȣ (PK X)
	SEQ NUMBER NOT NULL, 
	
	-- ȸ�� ID (PK)
	MEMBER_ID VARCHAR2(100) NOT NULL,
	
	-- ȸ�� Password
	MEMBER_PW VARCHAR2(100) NOT NULL,
	
	-- ȸ�� �̸�
	MEMBER_NAME VARCHAR2(50) NOT NULL,
	
	-- ȸ�� ����
	MEMBER_GENDER VARCHAR2(30) NOT NULL,
	
	-- ȸ�� ��ȭ��ȣ (Unique)
	MEMBER_PHONE VARCHAR2(20) NOT NULL,
	
	-- ȸ�� EMAIL (Unique)
	MEMBER_EMAIL VARCHAR2(1000) NOT NULL,
	
	-- ȸ�� �ּ�
	MEMBER_ADDR VARCHAR2(2000) NOT NULL,
	
	-- ȸ�� ���� (kakao:mmdd, naver:mm-dd, google:?, facebook:?)
	MEMBER_BIRTH VARCHAR2(20) NOT NULL,
	
	-- ȸ�� ����
	MEMBER_ROLE CHAR(8) NOT NULL,
	
	-- ȸ�� ��������
	MEMBER_REGDATE DATE NOT NULL,
	
	-- ȸ�� Ż������ (NOT NULL X)
	MEMBER_DDATE DATE,
	
	-- ȸ�� �������� (NOT NULL X)
	MEMBER_BDATE DATE, 
	
	--���Ѽ���=1
	enabled    NUMBER	 NULL ,
	
	--integer nummber
	-- ȸ�� ID : PK
	CONSTRAINT ID_MEMBER_PK PRIMARY KEY(MEMBER_ID), 
	
	-- ȸ�� ���� : CHK(F:emale, M:ale)
	CONSTRAINT MEMBER_GENDER_MEMBER_CHK CHECK(MEMBER_GENDER IN('F','M')), 
	
	-- ȸ�� ��ȭ��ȣ : UQ
	CONSTRAINT PHONE_MEMBER_UNQ UNIQUE(MEMBER_PHONE), 
	
	-- ȸ�� EMAIL : UQ
	CONSTRAINT EMAIL_MEMBER_UNQ UNIQUE(MEMBER_EMAIL), 

	-- ȸ�� ���� : CHK(S:tudent(ȸ��), I:ntern(����), T:eacher(����), A:dmin(������), D:eleted(Ż��), B:locked(����))
	CONSTRAINT MEMBER_ROLE_MEMBER_CHK CHECK(MEMBER_ROLE IN('S','I','T','A','D','B'))
	
);



SELECT * FROM MEMBER;

--������ ����
INSERT INTO MEMBER 
VALUES(MEMBERSEQ.NEXTVAL, 'admin', 'admin', '������', 'M', '010-0000-0000', 
	'admin@onsoo.com', '���� ������ ���ﵿ', '1019', 'A', SYSDATE, NULL, NULL,1);



DROP TABLE authorities CASCADE CONSTRAINTS;



SELECT * FROM authorities

--�������̺� �߰� 
CREATE TABLE authorities(
		MEMBER_ID                      		VARCHAR2(20)		 NOT NULL,
		authority                     		VARCHAR2(20)		 NOT NULL
);


ALTER TABLE authorities ADD CONSTRAINT IDX_authorities_PK PRIMARY KEY (MEMBER_ID, authority);
ALTER TABLE authorities ADD CONSTRAINT IDX_authorities_FK0 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID);


