package controller;

import java.io.IOException;
import java.util.ArrayList;

import beans.BoardVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MemberService;
import service.QNABoardService;
import service.QNABoardServiceImpl;
import util.FactoryUtil;

/**
 * *.qna 에 대한 요청 처리
 */
@WebServlet("*.qna")
public class QnABoardController extends HttpServlet {

	private static final long serialVersionUID = 8176622360769258073L;
	
	QNABoardService qbs = new QNABoardServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 자동 로그인 요청 사용자 인지 체크
		MemberService.loginCheck(req);
		
		// contextPath를 제외한 요청 URL
		String command = FactoryUtil.getCommand(req);
		
		String nextPage = null;
		
		if(command.equals("boardList.qna")) {
			// 질문과 답변 게시물 목록(list) 페이지 출력 요청 처리
			ArrayList<BoardVO> list = qbs.getBoardList(req);
			req.setAttribute("list", list);
			nextPage = "/board/qna/qna_list.jsp";
		}
		
		if(command.equals("boardWrite.qna")) {
			// 질문글 - 원본글 작성 페이지 요청
			nextPage = "/board/qna/qna_write.jsp";
		}
		
		// 상세보기 페이지 요청
		if(command.equals("qnaAbout.qna")){
			BoardVO vo = qbs.getBoardVO(req);
			req.setAttribute("qna", vo);
			nextPage = "/board/qna/qna_detail.jsp";
		}
		
		// 답변글 작성 페이지 요청
		if(command.equals("boardReply.qna")) {
			//  답변을 달려는 원본글 정보와 함께  답변글 작성 페이지 출력
			BoardVO original = qbs.boardReply(req);
			req.setAttribute("original", original);
			nextPage = "/board/qna/qna_reply.jsp";
		}
		// 게시글 수정 페이지 요청
		if(command.equals("boardUpdate.qna")) {
			BoardVO board = qbs.getBoardVOByUpdate(req);
			req.setAttribute("qna",board);
			nextPage = "/board/qna/qna_update.jsp";
		}
		// 게시글 삭제 요청
		if(command.equals("boardRemove.qna")) {
			// 삭제요청 처리
			qbs.boardDelete(req, resp);
		}
		
		// forward 방식으로 jsp 페이지 출력
		FactoryUtil.nextPage(req, resp, nextPage);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String command = FactoryUtil.getCommand(req);
		
		String nextPage = null;
		
		// 질문글 - 원본글 등록 요청
		if(command.equals("qnaSubmit.qna")) {
			qbs.boardWrite(req);
			// nextPage = "/board/qna/qna_list.jsp";
			resp.sendRedirect("boardList.qna");
		}
		
		// 답변글 등록 요청 처리
		if(command.equals("replySubmit.qna")) {
			qbs.boardReplySubmit(req);
			resp.sendRedirect("boardList.qna");
		}
		
		// 게시글 수정 요청 처리
		if(command.equals("updateSubmit.qna")) {
			qbs.boardUpdate(req, resp);
		}
		
		FactoryUtil.nextPage(req, resp, nextPage);
		
	}

	
	
}



