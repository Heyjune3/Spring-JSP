package service;

import java.util.ArrayList;

import beans.BoardVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface QNABoardService {

	// 질문과 답변 게시물 목록
	public ArrayList<BoardVO> getBoardList(HttpServletRequest request);

	// 게시물 등록 요청
	public void boardWrite(HttpServletRequest request);

	// 게시물 상세보기 요청
	public BoardVO getBoardVO(HttpServletRequest request);

	// 게시물 조회수 증가
	public void updateReadCount(HttpServletRequest request);

	// 답글 작성 화면 요청
	public BoardVO boardReply(HttpServletRequest request);

	// 답글 작성 완료 요청
	public void boardReplySubmit(HttpServletRequest request);

	// 수정 페이지 요청
	public BoardVO getBoardVOByUpdate(HttpServletRequest request);

	// 게시물 수정 요청
	public void boardUpdate(HttpServletRequest request, HttpServletResponse response);

	// 게시물 삭제 요청
	public void boardDelete(HttpServletRequest request, HttpServletResponse response);

}
