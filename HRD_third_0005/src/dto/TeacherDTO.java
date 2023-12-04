package dto;

public class TeacherDTO {
	private String teacher_code;
	private String class_name;
	private String teacher_name;
	private int class_price;
	private String teach_resist_date;
	
	private int sum;
	
	public TeacherDTO(String teacher_code, String class_name, String teacher_name, int sum) {
		super();
		this.teacher_code = teacher_code;
		this.class_name = class_name;
		this.teacher_name = teacher_name;
		this.sum = sum;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public TeacherDTO(String teacher_code, String teacher_name, String class_name, int class_price,
			String teach_resist_date) {
		super();
		this.teacher_code = teacher_code;
		this.teacher_name = teacher_name;
		this.class_name = class_name;
		this.class_price = class_price;
		this.teach_resist_date = teach_resist_date;
	}
	public String getTeacher_code() {
		return teacher_code;
	}
	public void setTeacher_code(String teacher_code) {
		this.teacher_code = teacher_code;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getClass_price() {
		return class_price;
	}
	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}
	public String getTeach_resist_date() {
		return teach_resist_date;
	}
	public void setTeach_resist_date(String teach_resist_date) {
		this.teach_resist_date = teach_resist_date;
	}
	
	
}
