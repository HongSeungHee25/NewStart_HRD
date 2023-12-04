package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ClassDTO;
import util.OracleUtil;

public class ClassDAO {
	private static ClassDAO dao = new ClassDAO();
	private ClassDAO() {}
	public static ClassDAO getClassDAO() {
		return dao;
	}
	
	public int insert(ClassDTO dto) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "insert into tbl_class_202201 values(?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, dto.getResist_month());
		ps.setString(2, dto.getC_no());
		ps.setString(3, dto.getClass_area());
		ps.setInt(4, dto.getTuition());
		ps.setString(5, dto.getTeacher_code());
		
		int result = ps.executeUpdate();
		
		ps.close();
		conn.close();
		
		return result;
	}
	
	public List<ClassDTO> getMemberList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select a.resist_month, a.c_no, b.c_name, c.class_name, a.class_area, a.tuition, b.grade\r\n" + 
				"from TBL_CLASS_202201 a join TBL_MEMBER_202201 b \r\n" + 
				"on a.c_no = b.c_no join TBL_TEACHER_202201 c\r\n" + 
				"on a.teacher_code = c.teacher_code";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<ClassDTO> list = new ArrayList<ClassDTO>();
		while(rs.next()) {
			ClassDTO dto = new ClassDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
}
