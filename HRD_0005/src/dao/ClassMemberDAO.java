package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.MemberDTO;
import util.OracleUtil;

public class ClassMemberDAO {
	
	private static ClassMemberDAO dao = new ClassMemberDAO();
	private ClassMemberDAO() {}
	public static ClassMemberDAO getMemberDAO() {
		return dao;
	}
	
	public List<MemberDTO> memberList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select b.resist_month, a.c_no, a.c_name, c.class_name, b.class_area,b.tuition,a.grade\r\n" + 
				"from TBL_CLASS_202201 b join TBL_MEMBER_202201 a  \r\n" + 
				"on b.c_no = a.c_no\r\n" + 
				"join TBL_TEACHER_202201 c\r\n" + 
				"on b.teacher_code = c.teacher_code";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		
		while(rs.next()) {
			MemberDTO dto = new MemberDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6), rs.getString(7));
			list.add(dto);
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}

	public List<MemberDTO> getMember() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select c_no, c_name\r\n" + 
				"from tbl_member_202201";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		
		while(rs.next()) {
			MemberDTO dto = new MemberDTO(rs.getString(1), rs.getString(2));
			list.add(dto);
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
	
}
