package vo;

public class MemberVO {
	
	private int num;
	private String id;
	private String pass;
	private String name;
	private String addr;
	private String phone;
	private String gender;
	private int age;
	
	public MemberVO() {}

	public MemberVO(String id) {
		this.id = id;
	}
	
	public MemberVO(int num, String id, String pass, String name, String addr, String phone, String gender, int age) {
		this.num = num;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.gender = gender;
		this.age = age;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public boolean equals(Object o) {
		if(o instanceof MemberVO) {
			return this.id.equals(((MemberVO)o).getId());
		}
		return false;
	}

	@Override
	public String toString() {
		return "MemberVO [num=" + num + ", id=" + id + ", pass=" + pass + ", name=" + name + ", addr=" + addr
				+ ", phone=" + phone + ", gender=" + gender + ", age=" + age + "]";
	}
	
}
