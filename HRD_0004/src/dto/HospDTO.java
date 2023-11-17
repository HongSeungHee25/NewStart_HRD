package dto;

public class HospDTO {

	private String hospcode;
	private String hospname;
	private String hosptel;
	private String hospaddr;
	private int conut;		//컬럼에는 없음
	
	
	
	public int getConut() {
		return conut;
	}


	public void setConut(int conut) {
		this.conut = conut;
	}


	public HospDTO(String hospaddr, int conut) {
		super();
		this.hospaddr = hospaddr;
		this.conut = conut;
	}


	public HospDTO(String hospcode, String hospname, String hosptel, String hospaddr) {
		super();
		this.hospcode = hospcode;
		this.hospname = hospname;
		this.hosptel = hosptel;
		this.hospaddr = hospaddr;
	}
	
	
	public HospDTO() {
		super();
	}


	public String getHospcode() {
		return hospcode;
	}
	public void setHospcode(String hospcode) {
		this.hospcode = hospcode;
	}
	public String getHospname() {
		return hospname;
	}
	public void setHospname(String hospname) {
		this.hospname = hospname;
	}
	public String getHosptel() {
		return hosptel;
	}
	public void setHosptel(String hosptel) {
		this.hosptel = hosptel;
	}
	public String getHospaddr() {
		return hospaddr;
	}
	public void setHospaddr(String hospaddr) {
		this.hospaddr = hospaddr;
	}
	
	
}
