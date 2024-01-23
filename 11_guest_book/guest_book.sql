show tables;

CREATE TABLE IF NOT EXISTS test_guestbook(
	num INT PRIMARY KEY auto_increment,			-- 방명록 글 번호
	guestName VARCHAR(20) NOT NULL,				-- 방명록 작성자
	password VARCHAR(30) NOT NULL,				-- 방명록 비밀번호
	message TEXT								-- 방명록 글
);

DESC test_guestbook;

commit;

SELECT * FROM test_guestbook;

INSERT INTO test_guestbook(guestName,password,message)
SELECT guestName,password,message FROM test_guestbook;

-- 방명록 번호로 역순으로 정렬한 전체 게시물
SELECT * FROM test_guestbook ORDER BY num DESC;

-- 1page, 한번에 게시물을 10개씩 출력
SELECT * FROM test_guestbook ORDER BY num DESC limit 0, 10;

-- 2page, 한번에 게시물을 10개씩 출력					시작인덱스, 갯수
SELECT * FROM test_guestbook ORDER BY num DESC limit 10, 10;

-- SELECT count(num) FROM test_guestbook; primary key가 있을 경우
SELECT count(*) FROM test_guestbook;