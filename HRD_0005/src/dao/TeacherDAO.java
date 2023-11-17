package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.TeacherDTO;
import util.OracleUtil;

public class TeacherDAO {
	
	private static TeacherDAO dao = new TeacherDAO();
	private TeacherDAO() {}
	public static TeacherDAO getTeacherDAO() {
		return dao;
	}

	public List<TeacherDTO> getList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "SELECT * FROM TBL_TEACHER_202201";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<TeacherDTO> list = new ArrayList<TeacherDTO>();
		while(rs.next()) {
			TeacherDTO dto = new TeacherDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
}
