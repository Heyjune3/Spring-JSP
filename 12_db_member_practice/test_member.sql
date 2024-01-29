-- num(int) / id / pass / name / addr / phone / gender / age(int)
CREATE TABLE test_member(
	num INT PRIMARY KEY auto_increment,
	id VARCHAR(30) UNIQUE NOT NULL,
	pass VARCHAR(30) NOT NULL,
	name VARCHAR(50),
	addr TEXT,
	phone VARCHAR(20),
	gender VARCHAR(10),
	age int(3)
);

-- 관리자 계정 추가 - id : admin , pass - admin , name - MASTER
INSERT INTO test_member 
VALUES(null,'admin','admin','MASTER',
	   '부산광역시','01011111111','남성',30);
INSERT INTO test_member 
VALUE
(null,'id023','pw023','이기근','부산광역시','01011111111','남성',30),
(null,'id024','pw024','공기근','부산광역시','01011111111','남성',30),
(null,'id025','pw025','박기근','부산광역시','01011111111','남성',30),
(null,'id026','pw026','조기근','부산광역시','01011111111','남성',30),
(null,'id027','pw027','엄기근','부산광역시','01011111111','남성',30),
(null,'id028','pw028','조기근','부산광역시','01011111111','남성',30),
(null,'id029','pw029','최기근','부산광역시','01011111111','남성',30),
(null,'id030','pw030','김기근','부산광역시','01011111111','남성',30),
(null,'id031','pw031','송기근','부산광역시','01011111111','남성',30),
(null,'id032','pw032','엄기근','부산광역시','01011111111','남성',30),
(null,'id033','pw033','이기근','부산광역시','01011111111','남성',30),
(null,'id034','pw034','공기근','부산광역시','01011111111','남성',30),
(null,'id035','pw035','박기근','부산광역시','01011111111','남성',30),
(null,'id036','pw036','조기근','부산광역시','01011111111','남성',30),
(null,'id037','pw037','엄기근','부산광역시','01011111111','남성',30),
(null,'id038','pw038','조기근','부산광역시','01011111111','남성',30),
(null,'id039','pw039','최기근','부산광역시','01011111111','남성',30),
(null,'id040','pw040','김기근','부산광역시','01011111111','남성',30),
(null,'id041','pw041','송기근','부산광역시','01011111111','남성',30),
(null,'id042','pw042','엄기근','부산광역시','01011111111','남성',30),
(null,'id043','pw043','이기근','부산광역시','01011111111','남성',30),
(null,'id044','pw044','공기근','부산광역시','01011111111','남성',30),
(null,'id045','pw045','박기근','부산광역시','01011111111','남성',30),
(null,'id046','pw046','조기근','부산광역시','01011111111','남성',30),
(null,'id047','pw047','엄기근','부산광역시','01011111111','남성',30),
(null,'id048','pw048','조기근','부산광역시','01011111111','남성',30),
(null,'id049','pw049','최기근','부산광역시','01011111111','남성',30),
(null,'id050','pw050','김기근','부산광역시','01011111111','남성',30),
(null,'id051','pw051','송기근','부산광역시','01011111111','남성',30),
(null,'id052','pw052','엄기근','부산광역시','01011111111','남성',30);
SELECT * FROM test_member;

commit;


SELECT * FROM test_member WHERE  name LIKE CONCAT('%','이','%');

-- 공지형 게시판
CREATE TABLE IF NOT EXISTS notice_board(
	notice_num INT PRIMARY KEY AUTO_INCREMENT,		-- 공지 글 번호
	notice_category VARCHAR(20) NOT NULL,			-- 공지 분류
	notice_author VARCHAR(50) NOT NULL,				-- 작성자
	notice_title VARCHAR(200) NOT NULL,				-- 제목
	notice_content TEXT NOT NULL,					-- 내용
	notice_date TIMESTAMP NOT NULL DEFAULT now()	-- 작성시간
);

-- 질문과 답변 - 자유게시판 table
CREATE TABLE IF NOT EXISTS qna_board(
	qna_num INT PRIMARY KEY AUTO_INCREMENT,		-- 글번호
	qna_name VARCHAR(20) NOT NULL,				-- 작성자
	qna_title VARCHAR(200) NOT NULL,			-- 글 제목
	qna_content TEXT NOT NULL,					-- 글 내용
	qna_write_num INT NOT NULL,					-- 글 작성자 회원 번호
	qna_readcount INT DEFAULT 0,				-- 조회수
	qna_date TIMESTAMP DEFAULT now()			-- 글 작성 시간
);

SELECT * FROM qna_board;

DESC qna_board;

-- 조회수 증가
UPDATE qna_board SET qna_readcount = qna_readcount + 1 WHERE qna_num = 1;

commit;

INSERT INTO qna_board (qna_name, qna_title, qna_content, qna_write_num)
SELECT qna_name, qna_title, qna_content, qna_write_num FROM qna_board;
-- WHERE qna_num NOT IN (1,2)

SELECT * FROM qna_board ORDER BY qna_num DESC;

-- 원본글(질문글)일 경우 자신의 게시글 번호를 저장
-- 답변글일 경우 자신이 답변하는 원본글의 번호를 저장
-- 동일한 그룹 번호일 경우 묶어서 출력
ALTER TABLE qna_board ADD COLUMN
qna_re_ref INT NOT NULL DEFAULT 0 AFTER qna_content;

-- 기존에 등록된 행정보에 자기 글 번호로 qna_re_ref 컬럼 수정
UPDATE qna_board SET qna_re_ref = qna_num;

SELECT * FROM qna_board ORDER BY qna_re_ref DESC;

INSERT INTO qna_board VALUES (null,'이지앙','3번의 답변글','없음',3,2,0,now());

-- view 화면에서 출력될 답변 글의 깊이
ALTER TABLE qna_board ADD COLUMN
qna_re_lev INT NOT NULL DEFAULT 0 AFTER qna_re_ref;

-- 원본글과 답변글 끼리의 정렬 순서 기준
ALTER TABLE qna_board ADD COLUMN
qna_re_seq INT NOT NULL DEFAULT 0 AFTER qna_re_lev;

UPDATE qna_board SET qna_re_lev = qna_re_lev + 1, qna_re_seq = qna_re_seq+1 
WHERE qna_num = 4;

SELECT * FROM qna_board ORDER BY qna_re_ref DESC, qna_re_seq ASC;

INSERT INTO qna_board(qna_name, qna_title, qna_content, qna_write_num) VALUES('최기근','안녕하세요 첫 질문입니다.','Mysql이 뭔가요???',6);

INSERT INTO qna_board(qna_name, qna_title, qna_content, qna_write_num) VALUES('이영학','안녕하세요 질문이 있습니다!','트랜젝션이 뭔가요???',7);

SELECT max(qna_num) FROM qna_board;

SELECT LAST_INSERT_ID();	-- 동일 커넥션에 동일 트렌젝션에서만 사용 가능

-- Window -> Preference -> Data Management -> Sql Management -> sql Editor -> SQL File/Scrapbook -> Connection Commit Mode -> Manual

rollback;



