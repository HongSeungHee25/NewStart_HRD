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

	public List<ClassDTO> getTotalList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select a.teacher_code, b.class_name, b.teacher_name, sum(a.tuition) as total\r\n" + 
				"from TBL_CLASS_202201 a join TBL_TEACHER_202201 b\r\n" + 
				"on a.teacher_code = b.teacher_code\r\n" + 
				"group by a.teacher_code,b.class_name, b.teacher_name \r\n" + 
				"order by a.teacher_code";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<ClassDTO> list = new ArrayList<ClassDTO>();
		while(rs.next()) {
			ClassDTO dto = new ClassDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
			list.add(dto);
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
	
	public List<ClassDTO> getClassPay() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select class_name, class_price,teacher_code\r\n" + 
				"from TBL_TEACHER_202201";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<ClassDTO> list = new ArrayList<ClassDTO>();
		
		while(rs.next()) {
			ClassDTO dto = new ClassDTO(rs.getString(1), rs.getInt(2), rs.getString(3));
			list.add(dto);
		}
		
		rs.close();ps.close();conn.close();
		return list;
	}
	
	public int insert(ClassDTO dto) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "INSERT INTO TBL_CLASS_202201 VALUES (?,?,?,?,?)";
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
}
