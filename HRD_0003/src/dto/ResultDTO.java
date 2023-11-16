package dto;

import java.sql.Date;

public class ResultDTO {
	private String p_no;
	private String p_name;
	private String t_code;
	private String t_name;
	private Date t_sdate;
	private String t_status;
	private Date t_ldate;
	private String t_result;
	
	
	public ResultDTO(String p_no,String p_name, String t_name, Date t_sdate, String t_status, Date t_ldate, String t_result) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.t_name = t_name;
		this.t_sdate = t_sdate;
		this.t_status = t_status;
		this.t_ldate = t_ldate;
		this.t_result = t_result;
	}
	

	public String getT_name() {
		return t_name;
	}


	public void setT_name(String t_name) {
		this.t_name = t_name;
	}


	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public ResultDTO() {
		super();
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getT_code() {
		return t_code;
	}

	public void setT_code(String t_code) {
		this.t_code = t_code;
	}

	public Date getT_sdate() {
		return t_sdate;
	}

	public void setT_sdate(Date t_sdate) {
		this.t_sdate = t_sdate;
	}

	public String getT_status() {
		return t_status;
	}

	public void setT_status(String t_status) {
		this.t_status = t_status;
	}

	public Date getT_ldate() {
		return t_ldate;
	}

	public void setT_ldate(Date t_ldate) {
		this.t_ldate = t_ldate;
	}

	public String getT_result() {
		return t_result;
	}

	public void setT_result(String t_result) {
		this.t_result = t_result;
	}
	
	
}
