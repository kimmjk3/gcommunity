drop database gcommunity;
create database gcommunity;
use gcommunity;

select * from `USER_TB`;			#사용자
select * from `BOARD_TB` ; 			#게시판
select * from `POST_TB`;			#게시글
select * from  `COMMENT_TB`; 		#댓글
select * from  `ATTACHMENTS_TB` ;	#첨부파일

#게시판별 조회
select row_number() over(partition by BOARD_NUMBER order by POST_INPUTDATE) as  순번,
    BOARD_NUMBER,
    POST_TITLE,
    POST_CONTENTS,
    POST_CATEGORY,
    POST_INPUTDATE,
    POST_CORRENT,
    POST_DELETEDATE,
    POST_RECOMMEND,
    POST_VIEWS,
    POST_WRITER
 from POST_TB;

#게시판별 조회2
select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS 
	rownum, 
	post_title, 
	post_category 
from post_tb 
where board_number=2;

DESC `USER_TB`;
DESC `BOARD_TB`;
DESC `POST_TB` ;
DESC `COMMENT_TB`;
DESC `ATTACHMENTS_TB`;

#게시판별 조회(역순)
select row_number() over(partition by BOARD_NUMBER order by POST_INPUTDATE ) as  순번,
    BOARD_NUMBER,
    POST_TITLE,
    POST_CONTENTS,
    POST_CATEGORY,
    POST_INPUTDATE,
    POST_CORRENT,
    POST_DELETEDATE,
    POST_RECOMMEND,
    POST_VIEWS,
    POST_WRITER
 from POST_TB 
 WHERE board_number=2
 ORDER BY 순번 DESC;

#사용자 테이블	생성
CREATE TABLE `USER_TB` (
	`USER_NUMBER`	INT	NOT null AUTO_INCREMENT PRIMARY KEY,				#회원번호
	`USER_ID`	VARCHAR(20)	NOT NULL,										#아이디
	`USER_PW`	VARCHAR(20)	NOT NULL,										#비밀번호
	`USER_NAME`	VARCHAR(20)	NOT NULL,										#이름
	`USER_NICKNAME`	VARCHAR(20)	NOT NULL,									#닉네임
	`USER_GENDER`	VARCHAR(20)	NOT NULL,									#성별
	`USER_DOB`	VARCHAR(20)	NOT NULL,										#생년월일
	`USER_EMAIL`	VARCHAR(30)	NOT NULL,									#이메일
	`USER_PHONENUMBER`	VARCHAR(20)	NOT NULL,								#휴대전화
	`USER_JOINDATE`		DATETIME	NOT NULL	DEFAULT NOW(),				#가입일
	`USER_SECESSIONDATE`	DATETIME	NULL,								#탈퇴일
	`USER_AUTHORITY`	INT	NOT NULL	COMMENT '0 : 관리자 1 : 유저',			#권한
	`USER_STATE`	INT	NOT NULL	COMMENT '0 : 탈퇴   1 : 활동중   2: 정지'	#활동상태
);

#게시판 테이블생성
CREATE TABLE `BOARD_TB` (
	`BOARD_NUMBER`	INT	NOT null AUTO_INCREMENT PRIMARY KEY,				#게시판번호
	`BOARD_NAME`	VARCHAR(20)	NOT NULL,									#게시판이름
	`BOARD_INPUTDATE`	DATETIME	NOT NULL	DEFAULT NOW(),				#게시판등록일
	`BOARD_CORRENT`	DATETIME	NULL,										#게시판수정일
	`BOARD_DELETEDATE`	DATETIME	NULL,									#게시판삭제일
	`BOARD_MANAGER`	INT	NOT NULL											#게시판생성자
);

#게시글 테이블생성
CREATE TABLE `POST_TB` (
	`POST_NUMBER`	INT	NOT null AUTO_INCREMENT PRIMARY KEY,				#게시글번호
	`BOARD_NUMBER`	INT	NOT NULL,											#게시판번호
	`POST_TITLE`	VARCHAR(100)	NOT NULL,								#제목
	`POST_CONTENTS`	VARCHAR(1000)	NOT NULL,								#내용
	`POST_CATEGORY`	VARCHAR(20)	NOT NULL,									#카테고리
	`POST_INPUTDATE`	DATETIME	NOT NULL	DEFAULT NOW(),				#등록일
	`POST_CORRENT`	DATETIME	NULL,										#수정일
	`POST_DELETEDATE`	DATETIME	NULL,									#삭제일
	`POST_RECOMMEND`	INT	NOT NULL	DEFAULT 0,							#추천수
	`POST_VIEWS`	INT	NOT NULL	DEFAULT 0,								#조회수
	`POST_WRITER`	INT	NOT NULL											#작성자
);

#댓글 테이블생성
CREATE TABLE `COMMENT_TB` (
	`COMMENT_NUMBER`	INT	NOT null AUTO_INCREMENT PRIMARY KEY,			#댓글번호
	`BOARD_NUMBER`	INT	NOT NULL,											#게시판번호
	`POST_NUMBER`	INT	NOT null,											#게시글번호
	`COMMENT_CONTENTS`	VARCHAR(1000)	NOT NULL,							#댓글내용
	`COMMENT_INPUTDATE`	DATETIME	NOT NULL	DEFAULT NOW(),				#댓글등록일
	`COMMENT_CORRENT`	DATETIME	NULL,									#댓을수정일
	`COMMENT_DELETEDATE`	DATETIME	NULL,								#댓글삭제일
	`COMMENT_RECOMMEND`	INT	NOT NULL	DEFAULT 0,							#댓글추천수
	`COMMENT_WRITER`	INT	NOT NULL										#댓글작성자
);

#파일첨부 테이블생성
CREATE TABLE `ATTACHMENTS_TB` (
	`FILE_NUMBER`	INT	NOT null AUTO_INCREMENT PRIMARY KEY,				#파일번호
	`BOARD_NUMBER`	INT	NOT NULL,											#게시판번호
	`POST_NUMBER`	INT	NOT NULL,											#게시글번호
	`FILE_NAME`	VARCHAR(20)	NOT NULL,										#파일이름
	`FILE_SIZE`	DOUBLE	NOT NULL,											#파일사이즈
	`FILE_EXTENSION`	VARCHAR(20)	NOT NULL,								#파일확장자
	`FILE_INPUTDATE`	DATETIME	NOT NULL	DEFAULT NOW(),				#파일등록일
	`FILE_DELETEDATE`	DATETIME	NULL									#파일삭제일
);

ALTER TABLE `POST_TB` ADD CONSTRAINT `FK_BOARD_TB_TO_POST_TB_1` FOREIGN KEY (
	`BOARD_NUMBER`
)
REFERENCES `BOARD_TB` (
	`BOARD_NUMBER`
);
ALTER TABLE `POST_TB` ADD CONSTRAINT `FK_USER_TB_TO_POST_TB_1` FOREIGN KEY (
	`POST_WRITER`
)
REFERENCES `USER_TB` (
	`USER_NUMBER`
);
ALTER TABLE `COMMENT_TB` ADD CONSTRAINT `FK_POST_TB_TO_COMMENT_TB_1` FOREIGN KEY (
	`POST_NUMBER`
)
REFERENCES `POST_TB` (
	`POST_NUMBER`
);
ALTER TABLE `COMMENT_TB` ADD CONSTRAINT `FK_POST_TB_TO_COMMENT_TB_2` FOREIGN KEY (
	`BOARD_NUMBER`
)
REFERENCES `POST_TB` (
	`BOARD_NUMBER`
);
ALTER TABLE `COMMENT_TB` ADD CONSTRAINT `FK_USER_TB_TO_COMMENT_TB_1` FOREIGN KEY (
	`COMMENT_WRITER`
)
REFERENCES `USER_TB` (
	`USER_NUMBER`
);
ALTER TABLE `BOARD_TB` ADD CONSTRAINT `FK_USER_TB_TO_BOARD_TB_1` FOREIGN KEY (
	`BOARD_MANAGER`
)
REFERENCES `USER_TB` (
	`USER_NUMBER`
);
ALTER TABLE `ATTACHMENTS_TB` ADD CONSTRAINT `FK_POST_TB_TO_ATTACHMENTS_TB_1` FOREIGN KEY (
	`POST_NUMBER`
)
REFERENCES `POST_TB` (
	`POST_NUMBER`
);
ALTER TABLE `ATTACHMENTS_TB` ADD CONSTRAINT `FK_POST_TB_TO_ATTACHMENTS_TB_2` FOREIGN KEY (
	`BOARD_NUMBER`
)
REFERENCES `POST_TB` (
	`BOARD_NUMBER`
);


#사용자 데이터삽입
INSERT INTO `USER_TB`(
	`USER_NUMBER`,			#회원번호
	`USER_ID`,				#아이디
	`USER_PW`,				#비밀번호
	`USER_NAME`,			#이름
	`USER_NICKNAME`,		#닉네임
	`USER_GENDER`,			#성별
	`USER_DOB`,				#생년월일
	`USER_EMAIL`,			#이메일
	`USER_PHONENUMBER`,		#휴대전화
	`USER_JOINDATE`,		#가입일
	`USER_SECESSIONDATE`,	#탈퇴일
	`USER_AUTHORITY`,		#권한
	`USER_STATE`)			#활동상태
values
	(null,'idid1234','pwpw1234','추홍재','추닉네임','남','1996-08-31','chgfc@naver.com','010-4539-8111',default,null,1,1),
	(null,'kimidid12','kimpwpw1234','김명진','김닉네임','남','1996-12-02','kim@naver.com','010-1234-5678',default,null,1,1),
	(null,'son0001','sonpassword','손대영','손닉네임','남','1993-10-02','son@naver.com','010-1515-7878',default,null,1,1)
;

#게시판 데이터삽입
insert into `BOARD_TB` (
	`BOARD_NUMBER`,			#게시판번호
	`BOARD_NAME`,			#게시판이름
	`BOARD_INPUTDATE`,		#게시판등록일
	`BOARD_CORRENT`,		#게시판수정일
	`BOARD_DELETEDATE`,		#게시판삭제일
	`BOARD_MANAGER`			#게시판생성자
)values
	(null,'게임게시판',default,null,null,1),
	(null,'공지사항',default,null,null,1)
;

#게시글 데이터삽입
insert into `POST_TB`(
	`POST_NUMBER`,			#게시글번호
	`BOARD_NUMBER`,			#게시판번호
	`POST_TITLE`,			#제목
	`POST_CONTENTS`,		#내용
	`POST_CATEGORY`,		#카테고리
	`POST_INPUTDATE`,		#등록일
	`POST_CORRENT`,			#수정일
	`POST_DELETEDATE`,		#삭제일
	`POST_RECOMMEND`,		#추천수
	`POST_VIEWS`,			#조회수
	`POST_WRITER`			#작성자
)values
	(null,1,'이거알려주세요','게임할때 이 설정법 맞나요?','질문',default,null,null,3,2,1),
	(null,2,'공지입니다.','게시판 규칙 준수해 주세요','공지',default,null,null,2,4,2),
	(null,1,'이거 공략좀 알려주세요','공략좀 알려주세요','질문',default,null,null,4,4,3)
;

#댓글 데이터 삽입
insert into `COMMENT_TB`(
	`COMMENT_NUMBER`,		#댓글번호
	`BOARD_NUMBER`,			#게시판번호
	`POST_NUMBER`,			#게시글번호
	`COMMENT_CONTENTS`,		#댓글내용
	`COMMENT_INPUTDATE`,	#댓글등록일
	`COMMENT_CORRENT`,		#댓글수정일
	`COMMENT_DELETEDATE`,	#댓글삭제일
	`COMMENT_RECOMMEND`,	#댓글추천수
	`COMMENT_WRITER`		#댓글작성자
)values
	(null,1,1,'수준ㅋㅋ',default,null,null,0,1),
	(null,2,2,'공지확인요',default,null,null,0,1)
;

#ATTACHMENTS_TB 데이터 삽입
insert into `ATTACHMENTS_TB` (
	`FILE_NUMBER`,			#파일번호
	`BOARD_NUMBER`,			#게시판번호
	`POST_NUMBER`,			#게시글번호
	`FILE_NAME`,			#파일이름
	`FILE_SIZE`,			#파일사이즈
	`FILE_EXTENSION`,		#파일확장자
	`FILE_INPUTDATE`,		#파일등록일
	`FILE_DELETEDATE`		#파일삭제일
)values(null,3,1,'asd',3.6,'jpg',default,null);