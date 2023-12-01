package dto;

public class ExamDTO {
	private String sno;
	private String sname;
	private int ekor;
	private int emath;
	private int eeng;
	private int ehist;
	
	private int sum;
	private int avg;
	private int rank;
	
	public String getSname() {
		return sname;
	}


	public void setSname(String sname) {
		this.sname = sname;
	}


	public ExamDTO(String sno, int ekor, int emath, int eeng, int ehist) {
		super();
		this.sno = sno;
		this.ekor = ekor;
		this.emath = emath;
		this.eeng = eeng;
		this.ehist = ehist;
	}
	
	
	public ExamDTO(String sno,String sname, int ekor, int emath, int eeng, int ehist, int sum, int avg, int rank) {
		super();
		this.sno = sno;
		this.sname = sname;
		this.ekor = ekor;
		this.emath = emath;
		this.eeng = eeng;
		this.ehist = ehist;
		this.sum = sum;
		this.avg = avg;
		this.rank = rank;
	}


	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public int getAvg() {
		return avg;
	}

	public void setAvg(int avg) {
		this.avg = avg;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
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
	
	

}
