package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.PatientDTO;
import dto.ResultDTO;
import util.OracleUtil;

public class ResultDAO {
	private static ResultDAO dao = new ResultDAO();
	private ResultDAO() {}
	public static ResultDAO getResultDAO() {
		return dao;
	}
	
	public List<ResultDTO> getResultList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "SELECT a.p_no, b.p_name, c.t_name, a.t_sdate, a.t_status, a.t_ldate, a.t_result" + 
				"				FROM TBL_RESULT_202004 a" + 
				"				JOIN TBL_PATIENT_202004 b ON a.p_no = b.p_no" + 
				"				JOIN TBL_LAB_TEST_202004 c ON a.t_code = c.t_code";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<ResultDTO> list = new ArrayList<ResultDTO>();
		while(rs.next()) {
			ResultDTO dto = new ResultDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
	
	public List<PatientDTO> getRegionList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select p.p_city,count(*) AS COUNT\r\n" + 
				"from tbl_patient_202004 p, tbl_result_202004 r\r\n" + 
				"where p.p_no = r.p_no\r\n" + 
				"group by p.p_city\r\n" + 
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
	
	public int insert(ResultDTO dto) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "insert into TBL_RESULT_202004 values(?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, dto.getP_no());
		ps.setString(2, dto.getT_code());
		ps.setString(3, dto.getT_sdate());
		ps.setString(4, dto.getT_status());
		ps.setString(5, dto.getT_ldate());
		ps.setString(6, dto.getT_result());
		
		int result = ps.executeUpdate();
		
		ps.close();
		conn.close();
		
		return result;
		
		
	}

}
