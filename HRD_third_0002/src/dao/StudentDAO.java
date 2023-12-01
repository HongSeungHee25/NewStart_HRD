package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.StudentDTO;
import util.OracleUtil;

public class StudentDAO {
	private static StudentDAO dao = new StudentDAO();
	private StudentDAO() {}
	public static StudentDAO getStudentDAO() {
		return dao;
	}

	public List<StudentDTO> getStudentList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select * from STUDENT_TBL_03";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<StudentDTO> list = new ArrayList<StudentDTO>();
		
		while(rs.next()) {
			StudentDTO dto = new StudentDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
}
