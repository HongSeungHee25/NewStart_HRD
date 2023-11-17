package dto;

public class ClassDTO {

	private String resist_month;
	private String c_no;
	private String class_area;
	private int tuition;
	private String teacher_code;
	
	private String class_name;
	private String teacher_name;
	private int total;		//컬럼에는 없음
	private int class_price;
	
	
	
	public int getClass_price() {
		return class_price;
	}

	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}

	public ClassDTO(String class_name, int class_price,String teacher_code) {
		super();
		this.class_name = class_name;
		this.class_price = class_price;
		this.teacher_code = teacher_code;
	}

	public ClassDTO(String teacher_code, String class_name, String teacher_name, int total) {
		super();
		this.teacher_code = teacher_code;
		this.class_name = class_name;
		this.teacher_name = teacher_name;
		this.total = total;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public ClassDTO(String resist_month, String c_no, String class_area, int tuition, String teacher_code) {
		super();
		this.resist_month = resist_month;
		this.c_no = c_no;
		this.class_area = class_area;
		this.tuition = tuition;
		this.teacher_code = teacher_code;
	}

	public ClassDTO() {
		super();
	}

	public String getResist_month() {
		return resist_month;
	}

	public void setResist_month(String resist_month) {
		this.resist_month = resist_month;
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
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

	public String getTeacher_code() {
		return teacher_code;
	}

	public void setTeacher_code(String teacher_code) {
		this.teacher_code = teacher_code;
	}
	
	
}
