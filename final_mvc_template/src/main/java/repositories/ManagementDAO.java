package repositories;

import java.util.ArrayList;

import beans.MemberVO;
import util.Criteria;

public interface ManagementDAO {

	// limit startRow, perPageNum
	ArrayList<MemberVO> getMemberList(Criteria cri);

	// 전체 회원 수
	int getMemberTotalCount();
	
	/**
	 * @param - 수정할 회원 정보
	 * @return 성공 여부
	 */
	int updateMember(MemberVO vo);
	
	/**
	 * @param - 삭제할 회원 정보
	 * @return 성공 여부
	 */
	int deleteMember(int num);

}
