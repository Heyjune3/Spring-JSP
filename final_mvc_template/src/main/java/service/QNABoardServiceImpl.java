package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import beans.BoardVO;
import beans.MemberVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repositories.QNABoardDAO;
import repositories.QNABoardDAOImpl;
import util.Criteria;
import util.PageMaker;

public class QNABoardServiceImpl implements QNABoardService {
	// 질문과 답변 게시물에 대한 데이터 베이스 요청 처리
	QNABoardDAO dao = new QNABoardDAOImpl();

	@Override
	public ArrayList<BoardVO> getBoardList(HttpServletRequest request) {
		// 페이징 처리된 게시물 목록을 리스트 반환
		// 사용자가 요청한 페이지 번호
		int page = 1;
		// 요청한 페이지 번호가 존재하면 요청 페이지 번로 변경
		// 요청한 페이지 번호가 없으면 1page 출력
		String pageNum = request.getParameter("page");
		if(pageNum != null) {
			page = Integer.parseInt(pageNum);
		}
		
		// table에서 가지고 올 목록을 요청한 페이지에 따라 계산
		Criteria cri = new Criteria(page, 10);
		ArrayList<BoardVO> list = dao.getBoardList(cri);
		
		// 목록페이지에 출력할 페이지 블럭 정보
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(10);
		// 테이블에 등록된 전체 게시물 개수
		int totalCount = dao.getListCount();
		pm.setTotalCount(totalCount);
		request.setAttribute("pm", pm);
		return list;
	}

	@Override
	public void boardWrite(HttpServletRequest request) {
		String qna_name = request.getParameter("qna_name");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		String num = request.getParameter("qna_writer_num");
		int qna_writer_num = Integer.parseInt(num);
		BoardVO board = new BoardVO(qna_name,qna_title,qna_content,qna_writer_num);
		dao.boardWrite(board);
	}

	@Override
	public BoardVO getBoardVO(HttpServletRequest request) {
		String num = request.getParameter("qna_num");
		int qna_num = Integer.parseInt(num);
		// session 을 이용한 조회수 처리
		HttpSession session = request.getSession();
		
		List<Integer> qnaReadList 
			= (List<Integer>)session.getAttribute("qnaReadList");
		if(qnaReadList == null) {
			// 현재 session에서 게시물 조회한적이 없음
			qnaReadList = new ArrayList<>();
			session.setAttribute("qnaReadList", qnaReadList);
		}
		
		boolean isRead = false;
		for(int readNum : qnaReadList) {
			if(readNum == qna_num) {
				isRead = true;
				break;
			}
		}
		
		// if(!isRead) {
		if(!qnaReadList.contains(qna_num)) {
			// 조회수 증가
			dao.updateReadCount(qna_num);
			qnaReadList.add(qna_num);
		}
		return dao.getBoardVO(qna_num);
	}

	@Override
	public void updateReadCount(HttpServletRequest request) {

	}

	@Override
	public BoardVO boardReply(HttpServletRequest request) {
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		return dao.getBoardVO(qna_num);
	}

	@Override
	public void boardReplySubmit(HttpServletRequest request) {
		String qna_name = request.getParameter("qna_name");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		String num = request.getParameter("qna_writer_num");
		int qna_writer_num = Integer.parseInt(num);
		int qna_re_ref = Integer.parseInt(request.getParameter("qna_re_ref"));
		int qna_re_lev = Integer.parseInt(request.getParameter("qna_re_lev"));
		int qna_re_seq = Integer.parseInt(request.getParameter("qna_re_seq"));
		
		dao.boardReplySubmit(
			new BoardVO(
					qna_name,
					qna_title,
					qna_content,
					qna_re_ref,
					qna_re_lev,
					qna_re_seq,
					qna_writer_num)
			);
	}

	@Override
	public BoardVO getBoardVOByUpdate(HttpServletRequest request) {
		String numStr = request.getParameter("qna_num");
		int qna_num = Integer.parseInt(numStr);
		BoardVO board = dao.getBoardVO(qna_num);
		return board;
	}

	@Override
	public void boardUpdate(HttpServletRequest request, HttpServletResponse response) {
		// 게시글 수정 요청 처리
		String qnaNum = request.getParameter("qna_num");
		int qna_num = Integer.parseInt(qnaNum);
		String qna_name = request.getParameter("qna_name");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		String qna_writer = request.getParameter("qna_writer_num");
		int qna_writer_num = Integer.parseInt(qna_writer);
		BoardVO vo = new BoardVO(
			qna_name,
			qna_title,
			qna_content,
			qna_writer_num
		);
		vo.setQna_num(qna_num);
		dao.boardUpdate(vo);
		
		try {
			response.sendRedirect("qnaAbout.qna?qna_num="+qna_num);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void boardDelete(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			int qna_num = Integer.parseInt(request.getParameter("qna_num"));
			MemberVO member = (MemberVO) request.getSession().getAttribute("member");
			if(member == null) {
				response.sendRedirect("qnaAbout.qna?qna_num="+qna_num);	
				return;
			}
			
			boolean isSuccess = dao.boardDelete(qna_num, member.getNum());
			if(isSuccess) {
				// 삭제 완료시 게시물 리스트 페이지 이동
				response.sendRedirect("boardList.qna");
			}else {
				// 게시물 게시자 정보와 일치하지않아 게시물 삭제 실패 시
				// 해당 게시물 상세 보기 페이지로 이동
				response.sendRedirect("qnaAbout.qna?qna_num="+qna_num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}





