package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.PatientDTO;
import util.OracleUtil;

public class PatientDAO {
	private static PatientDAO dao = new PatientDAO();
	private PatientDAO() {}
	public static PatientDAO getPatientDAO() {
		return dao;
	}
	
	public List<PatientDTO> getList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select * from TBL_PATIENT_202004";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<PatientDTO> list = new ArrayList<PatientDTO>();
		while(rs.next()) {
			PatientDTO dto = new PatientDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
			list.add(dto);
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
	
	public List<PatientDTO> getCityCount() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select p_city, count(p_city) as count\r\n" + 
				"from TBL_PATIENT_202004 a join TBL_RESULT_202004 b\r\n" + 
				"on a.p_no = b.p_no\r\n" + 
				"group by p_city\r\n" + 
				"order by p_city";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<PatientDTO> list = new ArrayList<PatientDTO>();
		while(rs.next()) {
			PatientDTO dto = new PatientDTO(rs.getString(1), rs.getInt(2));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}

}
