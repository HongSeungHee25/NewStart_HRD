package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.LabDTO;
import util.OracleUtil;

//TBL_LAB_TEST_202004
public class LabDAO {
	
	private static LabDAO dao = new LabDAO();
	private LabDAO() {}
	public static LabDAO getLabDAO() {
		return dao;
	}

	public List<LabDTO> getList()throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "SELECT * FROM TBL_LAB_TEST_202004";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<LabDTO> list = new ArrayList<LabDTO>();
		
		while(rs.next()) {
			LabDTO dto = new LabDTO(rs.getString(1), rs.getString(2));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
	
}
