package vo;

public class StudentVo {

	private String sno;
	private String sname;
	private String grade;
	private String class1;
	private String classnum;
	private String sgender;
	private String sphone;
	private String saddress;
	
	public StudentVo(String sno, String sname, String grade, String class1, String classnum,String sgender, String sphone,
			 String saddress) {
		super();
		this.sno = sno;
		this.sname = sname;
		this.grade = grade;
		this.class1 = class1;
		this.classnum = classnum;
		this.sgender = sgender;
		this.sphone = sphone;
		this.saddress = saddress;
	}

	public StudentVo() {
		super();
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getClass1() {
		return class1;
	}

	public void setClass1(String class1) {
		this.class1 = class1;
	}

	public String getClassnum() {
		return classnum;
	}

	public void setClassnum(String classnum) {
		this.classnum = classnum;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getSgender() {
		return sgender;
	}

	public void setSgender(String sgender) {
		this.sgender = sgender;
	}

	public String getSaddress() {
		return saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}
	
	
	
	
}
