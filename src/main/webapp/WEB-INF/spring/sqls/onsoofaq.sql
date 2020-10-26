DROP SEQUENCE FAQSEQ;
CREATE SEQUENCE FAQSEQ;

DROP TABLE FAQ;
CREATE TABLE FAQ(
	-- FAQ SEQ (hidden)
	FAQSEQ NUMBER PRIMARY KEY, 
	-- FAQ TITLE
	FAQTITLE VARCHAR2(1000) NOT NULL, 
	-- FAQ CONTENT
	FAQCONTENT VARCHAR2(4000) NOT NULL
);

INSERT INTO FAQ
VALUES(FAQSEQ.NEXTVAL, 
	'동영상 강의와 실시간 강의의 차이가 궁금해요.', 
	'온수의 수업 방식은 크게 두 가지로 나뉩니다.<br><br>동영상 강의와 실시간 강의가 있는데요!<br><br>먼저, <b>동영상 강의</b>는 시간 제약 없이 수강생이 수강 가능한 때 <b>언제든 수업을 들을 수</b> 있어요. <br>선생님께서 미리 올려주신 수업을 수강생의 상황에 따라 열심히 수강하고, <br>학습 중 모르는 부분이 있다면 질문을 남길 수도 있습니다.<br><br><b>실시간 강의</b>는 수강생과 선생님 사이에 <b>수업 시간 약속이 선행</b>됩니다! <br>약속한 시각에 선생님과 수강생이 모두 온수에 접속해 주시면, 실시간 화상 방식으로 수업이 진행됩니다.'
	);

INSERT INTO FAQ
VALUES(FAQSEQ.NEXTVAL, 
	'강사 등록은 어떻게 하나요?', 
	'<b>강사 인증 페이지</b>에서 진행해 주시면 됩니다!<br/><br/>명시되어 있는 서류들을 준비해 주신 후, '
	);

INSERT INTO FAQ
VALUES(FAQSEQ.NEXTVAL, 
	'결제 방식은 어떻게 되나요?', 
	''
	);

INSERT INTO FAQ
VALUES(FAQSEQ.NEXTVAL, 
	'신고는 어떻게 해야 하나요?', 
	''
	);