package dto;

public class VaccresvDTO {
	private int resvno;
	private String jumin;
	private String hospcode;
	private String resvdate;
	private String resvtime;
	private String vcode;
	
	
	public VaccresvDTO(int resvno, String jumin, String hospcode, String resvdate, String resvtime, String vcode) {
		super();
		this.resvno = resvno;
		this.jumin = jumin;
		this.hospcode = hospcode;
		this.resvdate = resvdate;
		this.resvtime = resvtime;
		this.vcode = vcode;
	}
	public int getResvno() {
		return resvno;
	}
	public void setResvno(int resvno) {
		this.resvno = resvno;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getHospcode() {
		return hospcode;
	}
	public void setHospcode(String hospcode) {
		this.hospcode = hospcode;
	}
	public String getResvdate() {
		return resvdate;
	}
	public void setResvdate(String resvdate) {
		this.resvdate = resvdate;
	}
	public String getResvtime() {
		return resvtime;
	}
	public void setResvtime(String resvtime) {
		this.resvtime = resvtime;
	}
	public String getVcode() {
		return vcode;
	}
	public void setVcode(String vcode) {
		this.vcode = vcode;
	}
	
	
}
