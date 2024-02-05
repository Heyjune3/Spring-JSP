DROP TABLE mvc_member;

CREATE TABLE mvc_member(
	num INT primary key auto_increment,		-- 회원번호
	id VARCHAR(50) UNIQUE NOT NULL,			-- 사용자 아이디
	pass VARCHAR(50) NOT NULL,				-- 비밀번호
	name VARCHAR(50) NOT NULL,				-- 이름
	age INT(3) default 0,					-- 나이
	gender VARCHAR(10),						-- 성별
	joinYN char(1) DEFAULT 'Y',				-- 회원 탈퇴 여부
	regdate TIMESTAMP default now(),		-- 회원 등록일
	updatedate TIMESTAMP default now()		-- 회원 정보 수정일
);

-- 관리자 계정 추가
INSERT INTO mvc_member(id,pass,name,age,gender) 
VALUES('admin','admin','MASTER',0,'male');

commit;

-- 회원탈퇴 시
-- UPDATE mvc_member SET joinYN = 'N' WHERE num = 회원번호;
commit;

SELECT * FROM mvc_member ORDER BY num DESC;

-- 관리자가 아니고 탈퇴한 회원이 아닌 정보 출력
SELECT * FROM mvc_member 
WHERE id != 'admin' AND joinYN = 'Y' 
ORDER BY num DESC;


/* 
 	공지형 게시판 테이블
 */
DROP TABLE notice;

CREATE TABLE IF NOT EXISTS notice(
	notice_num INT PRIMARY KEY AUTO_INCREMENT,	 -- 공지 번호
	notice_category VARCHAR(20) NOT NULL,		 -- 공지 분류
	notice_author VARCHAR(50)   NOT NULL,		 -- 작성자
	notice_title VARCHAR(50) NOT NULL,			 -- 제목
	notice_content TEXT NOT NULL,				 -- 내용
	notice_date TIMESTAMP NOT NULL DEFAULT now() -- 작성 시간
);

DESCRIBE notice;

ALTER TABLE notice_board MODIFY 
COLUMN notice_date TIMESTAMP NOT NULL DEFAULT now();


INSERT INTO notice_board(notice_category,notice_author,notice_title,notice_content)
VALUES('공지','관리자','안녕하세요','처음입니다 우리사이트를 방문해주셔서 감사합니다.');

INSERT INTO notice_board
VALUES(null,'공지','관리자','방문해주셔서 감사합니다. 제곧내','냉무',now());

INSERT INTO notice_board
VALUES(null,'공지','관리자','방문해주셔서 감사합니다. 제곧내','냉무',now());

commit;

SELECT * FROM notice_board;

-- 페이징 처리 확인 용 sample data 추가
INSERT INTO notice_board(notice_category,notice_author,notice_title,notice_content)
SELECT 
	notice_category,notice_author,notice_title,notice_content 
FROM notice_board;

DROP TABLE IF EXISTS qna;

commit;

-- 질문과답변 - 자유게시판 table 
CREATE TABLE IF NOT EXISTS qna(
	qna_num INT PRIMARY KEY AUTO_INCREMENT,		-- 글번호
	qna_name VARCHAR(20) NOT NULL,				-- 작성자 이름
	qna_title VARCHAR(50) NOT NULL,				-- 글 제목
	qna_content TEXT NOT NULL,					-- 글 내용
	qna_re_ref INT NOT NULL DEFAULT 0,			-- 그룹 번호
	qna_re_lev INT NOT NULL DEFAULT 0,			-- view  
	qna_re_seq INT NOT NULL DEFAULT 0,			-- 답글 순서 
	qna_writer_num INT NOT NULL,				-- 글작성자 회원 번호
	qna_readcount INT DEFAULT 0,				-- 조회수
	qna_delete char(1) DEFAULT 'N',				-- 게시글 삭제 여부
	qna_date TIMESTAMP DEFAULT now(),			-- 글 작성 시간
	CONSTRAINT fk_member_writer FOREIGN KEY(qna_writer_num) REFERENCES mvc_member(num)
);

-- 비밀번호 찾기로 발송된 코드 정보를 저장할 테이블
CREATE TABLE test_code(
	id VARCHAR(300),			-- 발신한 이메일
	code char(5)				-- 이메일로 발신한 랜덤 코드
);

SELECT * FROM test_code;


SELECT * FROM qna;






