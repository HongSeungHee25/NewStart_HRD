package dto;

public class JuminDTO {

	private String jumin;
	private String name;
	private String phone;
	private String address;
	
	public JuminDTO(String jumin, String name, String phone, String address) {
		super();
		this.jumin = jumin;
		this.name = name;
		this.phone = phone;
		this.address = address;
	}
	
	public JuminDTO() {
		super();
	}

	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
