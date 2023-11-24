package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.regexp.internal.RE;

import dto.PatientDTO;
import util.OracleUtil;

public class PatientDAO {
	
	private static PatientDAO dao = new PatientDAO();
	private PatientDAO() {}
	public static PatientDAO getPatientDAO() {
		return dao;
	}
	
	public List<PatientDTO> getPatientList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select * from tbl_patient_202004";
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

}
