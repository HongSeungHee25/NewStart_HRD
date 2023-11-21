package dto;

public class ScoreDTO {
	private String sno;
	private String ekor;
	private String emath;
	private String eeng;
	private String ehist;
	
	private String grade;
	private String s_class;
	private String num;
	private String name;
	private String kor;
	private String math;
	private String eng;
	private String hist;
	private String total;
	private String average;
	private String rank;
	
	public ScoreDTO(String grade, String s_class, String num, String name, String kor, String math, String eng, String hist,
			String total, String average, String rank) {
		super();
		this.grade = grade;
		this.s_class = s_class;
		this.num = num;
		this.name = name;
		this.kor = kor;
		this.math = math;
		this.eng = eng;
		this.hist = hist;
		this.total = total;
		this.average = average;
		this.rank = rank;
	}
	
	
	
	public String getGrade() {
		return grade;
	}



	public void setGrade(String grade) {
		this.grade = grade;
	}



	public String getS_class() {
		return s_class;
	}



	public void setS_class(String s_class) {
		this.s_class = s_class;
	}



	public String getNum() {
		return num;
	}



	public void setNum(String num) {
		this.num = num;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getKor() {
		return kor;
	}



	public void setKor(String kor) {
		this.kor = kor;
	}



	public String getMath() {
		return math;
	}



	public void setMath(String math) {
		this.math = math;
	}



	public String getEng() {
		return eng;
	}



	public void setEng(String eng) {
		this.eng = eng;
	}



	public String getHist() {
		return hist;
	}



	public void setHist(String hist) {
		this.hist = hist;
	}



	public String getTotal() {
		return total;
	}



	public void setTotal(String total) {
		this.total = total;
	}



	public String getAverage() {
		return average;
	}



	public void setAverage(String average) {
		this.average = average;
	}



	public String getRank() {
		return rank;
	}



	public void setRank(String rank) {
		this.rank = rank;
	}



	public ScoreDTO(String sno, String ekor, String emath, String eeng, String ehist) {
		super();
		this.sno = sno;
		this.ekor = ekor;
		this.emath = emath;
		this.eeng = eeng;
		this.ehist = ehist;
	}
	
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getEkor() {
		return ekor;
	}
	public void setEkor(String ekor) {
		this.ekor = ekor;
	}
	public String getEmath() {
		return emath;
	}
	public void setEmath(String emath) {
		this.emath = emath;
	}
	public String getEeng() {
		return eeng;
	}
	public void setEeng(String eeng) {
		this.eeng = eeng;
	}
	public String getEhist() {
		return ehist;
	}
	public void setEhist(String ehist) {
		this.ehist = ehist;
	}
	
	

}
