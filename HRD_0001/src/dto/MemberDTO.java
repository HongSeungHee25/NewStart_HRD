package dto;

public class MemberDTO {
	private String m_no;
	private String m_name;
	private String p_code;
	private String p_school;
	private String m_jumin;
	private String m_city;
	
	public MemberDTO(String m_no, String m_name, String p_code, String p_school, String m_jumin, String m_city) {
		super();
		this.m_no = m_no;
		this.m_name = m_name;
		this.p_code = p_code;
		this.p_school = p_school;
		this.m_jumin = m_jumin;
		this.m_city = m_city;
	}

	public MemberDTO() {
		super();
	}

	public String getM_no() {
		return m_no;
	}

	public void setM_no(String m_no) {
		this.m_no = m_no;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getP_school() {
		return p_school;
	}

	public void setP_school(String p_school) {
		this.p_school = p_school;
	}

	public String getM_jumin() {
		return m_jumin;
	}

	public void setM_jumin(String m_jumin) {
		this.m_jumin = m_jumin;
	}

	public String getM_city() {
		return m_city;
	}

	public void setM_city(String m_city) {
		this.m_city = m_city;
	}
	
	
	
}
