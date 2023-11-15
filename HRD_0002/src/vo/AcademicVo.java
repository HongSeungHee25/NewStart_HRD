package vo;

public class AcademicVo {

	private String grade;
	private String class1;
	private String classnum;
	private String sname;
	private int ekor;
	private int emath;
	private int eeng;
	private int ehist;
	private int sum;
	private double avg;
	private int rank;
	
	public AcademicVo(String grade, String class1, String classnum, String sname, int ekor, int emath, int eeng,
			int ehist, int sum, double avg, int rank) {
		super();
		this.grade = grade;
		this.class1 = class1;
		this.classnum = classnum;
		this.sname = sname;
		this.ekor = ekor;
		this.emath = emath;
		this.eeng = eeng;
		this.ehist = ehist;
		this.sum = sum;
		this.avg = avg;
		this.rank = rank;
	}

	public AcademicVo() {
		super();
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

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getEkor() {
		return ekor;
	}

	public void setEkor(int ekor) {
		this.ekor = ekor;
	}

	public int getEmath() {
		return emath;
	}

	public void setEmath(int emath) {
		this.emath = emath;
	}

	public int getEeng() {
		return eeng;
	}

	public void setEeng(int eeng) {
		this.eeng = eeng;
	}

	public int getEhist() {
		return ehist;
	}

	public void setEhist(int ehist) {
		this.ehist = ehist;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}
	
	
}
