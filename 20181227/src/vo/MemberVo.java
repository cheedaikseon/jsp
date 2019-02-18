package vo;

public class MemberVo {
	
	String id;
	String pass;
	String name;
	String addr;
	String phone;
	
	// alt + s /a
	public MemberVo() {}
	
	public MemberVo(String id, String pass, String name, String addr, String phone) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
	}
	
	// alt+ s / r
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
	
	// alt+s / s
	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", pass=" + pass + ", name=" + name + ", addr=" + addr + ", phone=" + phone + "]";
	}
}
