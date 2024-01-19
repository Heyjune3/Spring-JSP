package vo;

public class MemberVO {
	
	private String uid;
	private String upw;
	private String uname;
	
	// 기본생성자
	public MemberVO() {}

	public MemberVO(String uid, String upw, String uname) {
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
	}
	
	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getUpw() {
		return upw;
	}


	public void setUpw(String upw) {
		this.upw = upw;
	}


	public String getUname() {
		return uname;
	}


	public void setUname(String uname) {
		this.uname = uname;
	}

	@Override
	public String toString() {
		return "MemberVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + "]";
	}

}
