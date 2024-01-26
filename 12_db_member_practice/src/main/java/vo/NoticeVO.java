package vo;

import java.util.Date;

/**
 * 공지 게시물 정보를 저장할 class
 */
public class NoticeVO {
	
	private int notice_num;
	private String notice_category;
	private String notice_author;
	private String notice_title;
	private String notice_content;
	private java.util.Date notice_date;
	
	// 공지글 전체 정보를 매개변수로 전달받아 초기화하는 생성자
	public NoticeVO(int notice_num, String notice_category, String notice_author, String notice_title,
			String notice_content, Date notice_date) {
		this.notice_num = notice_num;
		this.notice_category = notice_category;
		this.notice_author = notice_author;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
	}

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public String getNotice_category() {
		return notice_category;
	}

	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}

	public String getNotice_author() {
		return notice_author;
	}

	public void setNotice_author(String notice_author) {
		this.notice_author = notice_author;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice__content(String notice_content) {
		this.notice_content = notice_content;
	}

	public java.util.Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(java.util.Date notice_date) {
		this.notice_date = notice_date;
	}

	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", notice_category=" + notice_category + ", notice_author="
				+ notice_author + ", notice_title=" + notice_title + ", notice__content=" + notice_content
				+ ", notice_date=" + notice_date + "]";
	}

	
	
}
