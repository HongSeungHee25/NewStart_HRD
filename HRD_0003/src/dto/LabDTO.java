package dto;

public class LabDTO {
	private String t_code;
	private String t_name;
	
	public LabDTO(String t_code, String t_name) {
		super();
		this.t_code = t_code;
		this.t_name = t_name;
	}

	public LabDTO() {
		super();
	}

	public String getT_code() {
		return t_code;
	}

	public void setT_code(String t_code) {
		this.t_code = t_code;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	
	

}
