package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.MemberDTO;
import util.OracleUtil;

public class MemberDAO {
	private static MemberDAO dao = new MemberDAO();
	private MemberDAO() {}
	public static MemberDAO getMemberDAO() {
		return dao;
	}
	
	public List<MemberDTO> getMemberList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select * from tbl_member_202201";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
}
