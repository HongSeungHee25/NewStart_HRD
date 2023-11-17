package dto;

public class MemberDTO {

	private String c_no;
	private String c_name;
	private String phone;
	private String address;
	private String grade;
	
	private String resist_month;
	private String class_name;
	private String class_area;
	private int tuition;
	
	
	public MemberDTO(String c_no, String c_name, String phone, String address, String grade) {
		super();
		this.c_no = c_no;
		this.c_name = c_name;
		this.phone = phone;
		this.address = address;
		this.grade = grade;
	}

	public MemberDTO(String resist_month, String c_no, String c_name, String class_name,String class_area ,int tuition,String grade
			 ) {
		super();
		this.resist_month = resist_month;
		this.c_no = c_no;
		this.c_name = c_name;
		this.class_name = class_name;
		this.class_area = class_area;
		this.tuition = tuition;
		this.grade = grade;
	}
	
	

	public MemberDTO(String c_no, String c_name) {
		super();
		this.c_no = c_no;
		this.c_name = c_name;
	}

	public String getResist_month() {
		return resist_month;
	}

	public void setResist_month(String resist_month) {
		this.resist_month = resist_month;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getClass_area() {
		return class_area;
	}

	public void setClass_area(String class_area) {
		this.class_area = class_area;
	}

	public int getTuition() {
		return tuition;
	}

	public void setTuition(int tuition) {
		this.tuition = tuition;
	}

	public MemberDTO() {
		super();
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
}
