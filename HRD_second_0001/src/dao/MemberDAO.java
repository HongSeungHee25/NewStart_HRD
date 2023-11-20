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
	
	public List<MemberDTO> getList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select a.m_no, a.m_name, b.p_name, a.p_school, a.m_jumin, a.m_city, b.p_tel1, b.p_tel2, b.p_tel3\r\n" + 
				"from TBL_MEMBER_202005 a join TBL_PARTY_202005 b\r\n" + 
				"on a.p_code = b.p_code";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
			list.add(dto);
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
}
