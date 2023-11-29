package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.VoteDTO;
import util.OracleUtil;

public class VoteDAO {
	private static VoteDAO dao = new VoteDAO();
	private VoteDAO() {}
	public static VoteDAO getVoteDAO() {
		return dao;
	}
	public int insert(VoteDTO dto) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "insert into tbl_vote_202005 values(?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, dto.getV_jumin());
		ps.setString(2, dto.getV_name());
		ps.setString(3, dto.getM_no());
		ps.setString(4, dto.getV_time());
		ps.setString(5, dto.getV_area());
		ps.setString(6, dto.getV_confirm());
		
		int result = ps.executeUpdate();
		
		ps.close();
		conn.close();
		
		return result;
	}
	
	public List<VoteDTO> list() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select * from tbl_vote_202005 where v_area = '제1투표장'";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<VoteDTO> list = new ArrayList<VoteDTO>();
		while(rs.next()) {
			VoteDTO dto = new VoteDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
		
	}
	
}
