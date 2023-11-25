package dto;

public class VaccresvDTO {
	private int resvno;
	private String jumin;
	private String hospcode;
	private String resvdate;
	private int resvtime;
	private String vcode;
	private String name;
	private String hospname;
	private String hospaddr;
	private int count;
	
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public VaccresvDTO(String hospaddr, int count) {
		super();
		this.hospaddr = hospaddr;
		this.count = count;
	}

	public VaccresvDTO(int resvno, String name, String jumin, String hospname, String resvdate, int resvtime,
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
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHospname() {
		return hospname;
	}

	public void setHospname(String hospname) {
		this.hospname = hospname;
	}

	public String getHospaddr() {
		return hospaddr;
	}

	public void setHospaddr(String hospaddr) {
		this.hospaddr = hospaddr;
	}

	public VaccresvDTO(int resvno, String jumin, String hospcode, String resvdate, int resvtime, String vcode) {
		super();
		this.resvno = resvno;
		this.jumin = jumin;
		this.hospcode = hospcode;
		this.resvdate = resvdate;
		this.resvtime = resvtime;
		this.vcode = vcode;
	}

	public VaccresvDTO() {
		super();
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

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
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

	public int getResvtime() {
		return resvtime;
	}

	public void setResvtime(int resvtime) {
		this.resvtime = resvtime;
	}

	
}
