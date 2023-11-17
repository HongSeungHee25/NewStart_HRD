package dao;

public class HospDAO {
	
	private static HospDAO dao = new HospDAO();
	private HospDAO() {}
	public static HospDAO getHospDAO() {
		return dao;
	}

}
