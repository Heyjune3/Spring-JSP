package repositories;

import java.util.ArrayList;

import beans.NoticeVO;
import util.Criteria;

public interface NoticeDAO {

	// 게시글 등록 - 삽입
	public boolean noticeWrite(NoticeVO vo);

	// 게시글 목록
	// SELECT * FROM notice_board ORDER BY notice_num DESC
	// limit startRow, count;
	/**
	 * @param startRow - limit 시작 인덱스 번호
	 * @param count    - 검색에 포함할 게시물 개수
	 * @param searchType - 검색 속성 type
	 * @param searchValue - 검색 키워드
	 * @return 페이징 처리된 게시글 목록을 리스트로 반환
	 */
	public ArrayList<NoticeVO> noticeList(Criteria cri);

	/**
	 * @return int : 전체게시물 개수 totalCount
	 */
	public int getTotalCount(Criteria cri);

	// 게시글 상세보기
	/**
	 * @param notice_num - 검색할 게시글 번호
	 * @return 검색된 게시글 정보
	 */
	public NoticeVO noticeDetail(int notice_num);

	// 게시글 수정
	/**
	 * @param 수정할 게시글 정보
	 * @return true - 수정완료 , false 수정 실패
	 */
	public boolean noticeUpdate(NoticeVO vo);

	// 게시글 삭제
	/**
	 * @param notice_num - 삭제할 게시글 번호 - DELETE
	 * @return true : 삭제완료, false : 삭제 실패
	 */
	public boolean noticeDelete(int notice_num);

}
