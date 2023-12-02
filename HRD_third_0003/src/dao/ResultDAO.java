package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ResultDTO;
import util.OracleUtil;

public class ResultDAO {
	private static ResultDAO dao = new ResultDAO();
	private ResultDAO() {}
	public static ResultDAO getResultDAO() {
		return dao;
	}
	
	public int insert(ResultDTO dto) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "insert into tbl_result_202004 values(?,?,?,?,?,?)";
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
	
	public List<ResultDTO> getresultList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select a.p_no, b.p_name, c.t_name, a.t_sdate, a.t_status, a.t_ldate, a.t_result\r\n" + 
				"from TBL_RESULT_202004 a join TBL_PATIENT_202004 b \r\n" + 
				"on a.p_no = b.p_no join TBL_LAB_TEST_202004 c\r\n" + 
				"on a.t_code = c.t_code";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<ResultDTO> list = new ArrayList<ResultDTO>();
		while(rs.next()) {
			ResultDTO dto = new ResultDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
}
