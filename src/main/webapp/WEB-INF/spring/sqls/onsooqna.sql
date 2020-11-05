--int qnano
--String qnaqwriter
--String qnatitle
--String qnaqcontent
--Date qnaqregdate
--String qnasecret
--String qnaresponse
--String qnaqwriter
--String qnaqcontent
--Date qnaaregdate

DROP SEQUENCE QNASEQ;
CREATE SEQUENCE QNASEQ;

DROP TABLE QNA;
CREATE TABLE QNA(
	-- QNA NO
	QNANO NUMBER PRIMARY KEY, 
	-- QNA WRITER
	QNAWRITER VARCHAR2(100) NOT NULL, 
	-- QNA TITLE
	QNATITLE VARCHAR2(1000) NOT NULL, 
	-- QNA Q CONTENT
	QNAQCONTENT VARCHAR2(4000) NOT NULL, 
	-- QNA Q REGDATE
	QNAQREGDATE DATE NOT NULL, 
	-- QNA SECRET
	QNASECRET VARCHAR2(2) NOT NULL, 
	-- QNA RESPONSE
	QNARESPONSE VARCHAR2(2) NOT NULL,
	-- QNA A CONTENT
	QNAACONTENT VARCHAR2(4000), 
	-- QNA A REGDATE
	QNAAREGDATE DATE, 
	
	-- QNAWRITER는 MEMBER_ID를 참조하는 Foreign Key
	-- (특정 MEMBER_ID가 삭제되면 해당 QNAWRITER도 삭제)
	FOREIGN KEY(QNAWRITER) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
	
	-- 비밀글 여부는 Y or N (NOT NULL)
	CONSTRAINT QNASECRET_CHK CHECK(QNASECRET IN('Y','N')),
	
	-- 답변 여부는 Y or N (NOT NULL - 기본 N)
	CONSTRAINT QNARESPONSE_CHK CHECK(QNARESPONSE IN('Y','N'))
);

SELECT * FROM QNA;



-- 질문글 목록
SELECT QNANO, QNAWRITER, QNATITLE, QNAQREGDATE, QNASECRET, QNARESPONSE
FROM QNA
ORDER BY QNANO, QNAQREGDATE;

-- 질문글 조회 
SELECT QNANO, QNAWRITER, QNATITLE, QNAQCONTENT, QNAQREGDATE, QNASECRET, QNARESPONSE, QNAACONTENT, QNAAREGDATE
FROM QNA
WHERE QNANO = #{qnano}

-- 질문글 작성
INSERT INTO QNA
VALUES(QNASEQ.NEXTVAL, #{qnawriter}, #{qnatitle}, #{qnaqcontent}, SYSDATE, 'N', 'N', NULL, SYSDATE);

-- 비밀글 전환
UPDATE QNA
SET QNASECRET = 'Y'
WHERE QNANO = #{qnano};

-- 질문글 수정 (답변 작성 후 불가)
UPDATE QNA
SET QNATITLE = #{qnatitle}, QNAQCONTENT = #{qnaqcontent}
WHERE QNANO = #{qnano};

-- 답변 작성 (관리자)
UPDATE QNA
SET QNARESPONSE = 'Y', QNAACONTENT = #{qnaacontent}, QNAAREGDATE = SYSDATE
WHERE QNANO = #{qnano};

-- 질문글 삭제 (작성자, 관리자)
DELETE FROM QNA
WHERE QNANO = #{qnano};



-- 테스트용 예시
-- 비밀글 X, 답변 O
INSERT INTO QNA
VALUES(QNASEQ.NEXTVAL, 'student', '동영상 강의와 실시간 강의의 차이?', '나뉘어져 있는 이유가 있나요?<br>차이가 뭔지 궁금해요!', SYSDATE, 'N', 'Y', '온수의 수업 방식은 크게 두 가지로 나뉩니다.<br><br>동영상 강의와 실시간 강의가 있는데요!<br><br>먼저, <b>동영상 강의</b>는 시간 제약 없이 수강생이 수강 가능한 때 <b>언제든 수업을 들을 수</b> 있어요. <br>선생님께서 미리 올려주신 수업을 수강생의 상황에 따라 열심히 수강하고, <br>학습 중 모르는 부분이 있다면 질문을 남길 수도 있습니다.<br><br><b>실시간 강의</b>는 수강생과 선생님 사이에 <b>수업 시간 약속이 선행</b>됩니다! <br>약속한 시각에 선생님과 수강생이 모두 온수에 접속해 주시면, 실시간 화상 방식으로 수업이 진행됩니다.', SYSDATE);

-- 비밀글 X, 답변 X
INSERT INTO QNA
VALUES(QNASEQ.NEXTVAL, 'student', '결제 방식은 어떻게 되나요?', '카드 결제 말고 다른 방법이 궁금해요!<br>어떤 방법들이 있나요?', SYSDATE, 'N', 'N', NULL, SYSDATE);

-- 비밀글 O, 답변 O
INSERT INTO QNA
VALUES(QNASEQ.NEXTVAL, 'teacher', '강사 등록은 어떻게 하나요?', '저도 수업을 하고 싶은데...<br>강사 인증 절차가 많이 복잡한가요?', SYSDATE, 'Y', 'Y', '<b>강사 인증 페이지</b>에서 진행해 주시면 됩니다!<br/><br/>명시되어 있는 서류들을 준비해 주신 후,<br><b>강사 인증 페이지</b>에서 파일 업로드를 해 주시면 됩니다.<br>구비 서류 목록은 강사 인증 페이지에서 확인 가능합니다 :)<br><br>운영진의 검토 후에 회원에서 강사로 전환되면, 수업 등록이 가능합니다!', SYSDATE);

-- 비밀글 O, 답변 X
INSERT INTO QNA
VALUES(QNASEQ.NEXTVAL, 'teacher', '신고는 어떻게 해야 하나요?', '학생이 불쾌한 언행을 합니다.<br>혹시 신고를 하면 수업 진행에 지장이 있나요?', SYSDATE, 'Y', 'N', NULL, SYSDATE);