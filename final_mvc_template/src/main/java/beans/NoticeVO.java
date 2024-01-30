package beans;

import java.util.Date;

/**
 * 공지형 게시물 정보를 저장하는 class
 */
public class NoticeVO {
	
	private int	notice_num;
	private String notice_category;
	private String notice_author;
	private String 	notice_title;
	private String 	notice_content;
	private Date notice_date;
	
	public NoticeVO() {}
	
	/**
	 * 공지 작성용 생성자
	 */
	public NoticeVO(String notice_category, String notice_author, String notice_title, String notice_content) {
		this.notice_category = notice_category;
		this.notice_author = notice_author;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
	}
	
	/**
	 * 공지 목록용 생성자
	 */
	public NoticeVO(int notice_num, String notice_category, String notice_author, String notice_title,
			String notice_content, Date notice_date) {
		super();
		this.notice_num = notice_num;
		this.notice_category = notice_category;
		this.notice_author = notice_author;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
	}
	// getter & setter & toString
	
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
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", notice_category=" + notice_category + ", notice_author="
				+ notice_author + ", notice_title=" + notice_title + ", notice_content=" + notice_content
				+ ", notice_date=" + notice_date + "]";
	}	
	
}








