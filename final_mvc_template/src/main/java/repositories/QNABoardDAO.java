package repositories;

import java.util.ArrayList;

import beans.BoardVO;
import util.Criteria;

public interface QNABoardDAO {

	// 전체 게시물 개수
	public int getListCount();

	// 페이징 처리된 게시물 목록
	public ArrayList<BoardVO> getBoardList(Criteria cri);

	// 게시글 작성 요청
	public void boardWrite(BoardVO board);

	// 한개의 게시물 정보 요청 처리
	public BoardVO getBoardVO(int board_num);

	// 게시글 조회수 증가
	public void updateReadCount(int board_num);

	// 답변글 작성
	public void boardReplySubmit(BoardVO board);

	// 게시글 수정
	public void boardUpdate(BoardVO board);

	// 게시글 삭제
	public boolean boardDelete(int board_num, int qna_writer_num);

}
