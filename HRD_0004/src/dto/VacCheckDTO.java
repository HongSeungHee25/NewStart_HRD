package dto;

public class VacCheckDTO {
	
	private int resvno;
	private String name;
	private String jumin;
	private String hospname;
	private String resvdate;
	private int resvtime;
	private String vcode;
	private String hospaddr;
	
	public VacCheckDTO(int resvno, String name, String jumin, String hospname, String resvdate, int resvtime,
			String vcode, String hospaddr) {
		super();
		this.resvno = resvno;
		this.name = name;
		this.jumin = jumin;
		this.hospname = hospname;
		this.resvdate = resvdate;
		this.resvtime = resvtime;
		this.vcode = vcode;
		this.hospaddr = hospaddr;
	}

	public VacCheckDTO() {
		super();
	}

	public int getResvno() {
		return resvno;
	}

	public void setResvno(int resvno) {
		this.resvno = resvno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJumin() {
		return jumin;
	}

	public void setJumin(String jumin) {
		this.jumin = jumin;
	}

	public String getHospname() {
		return hospname;
	}

	public void setHospname(String hospname) {
		this.hospname = hospname;
	}

	public String getResvdate() {
		return resvdate;
	}

	public void setResvdate(String resvdate) {
		this.resvdate = resvdate;
	}

	public int getResvtime() {
		return resvtime;
	}

	public void setResvtime(int resvtime) {
		this.resvtime = resvtime;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	public String getHospaddr() {
		return hospaddr;
	}

	public void setHospaddr(String hospaddr) {
		this.hospaddr = hospaddr;
	}
	
	

}
