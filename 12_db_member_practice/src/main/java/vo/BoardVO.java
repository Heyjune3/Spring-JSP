package vo;

import java.util.Date;

/**
 * 질문과 답변형 게시물 정보를
 * 저장할 class 
 */
public class BoardVO {

	private int qna_num;
	private String qna_name;
	private String qna_title;
	private String qna_content;
	
	// 답변용
	private int qna_re_ref;		// group
	private int qna_re_lev;		// view 출력
	private int qna_re_seq;		// 답변글 정렬
	
	private int qna_write_num;
	private int qna_readcount;
	private Date qna_date;
	
	private char qna_delete;	// 게시글 삭제 요청 여부
	
	/**
	 * 답변 용 컬럼이 추가된 생성자 
	 */
	public BoardVO(int qna_num, String qna_name, String qna_title, String qna_content, int qna_re_ref,
			int qna_re_lev, int qna_re_seq, int qna_write_num, int qna_readcount, Date qna_date) {
		this.qna_num = qna_num;
		this.qna_name = qna_name;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_re_ref = qna_re_ref;
		this.qna_re_lev = qna_re_lev;
		this.qna_re_seq = qna_re_seq;
		this.qna_write_num = qna_write_num;
		this.qna_readcount = qna_readcount;
		this.qna_date = qna_date;
	}
	

	public BoardVO() {
	}
	

	// 게시글 삽입에 필요한 생성자
	public BoardVO(String qna_name, String qna_title, String qna_content, int qna_write_num) {
		this.qna_name = qna_name;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_write_num = qna_write_num;
	}

	// 리스트, 상세보기용 전체 글 정보를 이용해서 생성자 조회
	public BoardVO(int qna_num, String qna_name, String qna_title, String qna_content, int qna_write_num,
			int qna_readcount, Date qna_date) {
		this.qna_num = qna_num;
		this.qna_name = qna_name;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_write_num = qna_write_num;
		this.qna_readcount = qna_readcount;
		this.qna_date = qna_date;
	}

	public int getQna_re_ref() {
		return qna_re_ref;
	}

	public void setQna_re_ref(int qna_re_ref) {
		this.qna_re_ref = qna_re_ref;
	}

	public int getQna_re_lev() {
		return qna_re_lev;
	}

	public void setQna_re_lev(int qna_re_lev) {
		this.qna_re_lev = qna_re_lev;
	}

	public int getQna_re_seq() {
		return qna_re_seq;
	}

	public void setQna_re_seq(int qna_re_seq) {
		this.qna_re_seq = qna_re_seq;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getQna_name() {
		return qna_name;
	}

	public void setQna_name(String qna_name) {
		this.qna_name = qna_name;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public int getQna_write_num() {
		return qna_write_num;
	}

	public void setQna_write_num(int qna_write_num) {
		this.qna_write_num = qna_write_num;
	}

	public int getQna_readcount() {
		return qna_readcount;
	}

	public void setQna_readcount(int qna_readcount) {
		this.qna_readcount = qna_readcount;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	
	public char getQna_delete() {
		return qna_delete;
	}
	
	public void setQna_delete(char qna_delete) {
		this.qna_delete = qna_delete;
	}

	@Override
	public String toString() {
		return "BoardVO [qna_num=" + qna_num + ", qna_name=" + qna_name + ", qna_title=" + qna_title + ", qna_content="
				+ qna_content + ", qna_write_num=" + qna_write_num + ", qna_readcount=" + qna_readcount + ", qna_date="
				+ qna_date + "]";
	}	

}
