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
	
	public int vote(VoteDTO dto) throws SQLException{
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
	
	public List<VoteDTO> getVoteList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select v_name,v_jumin,to_number(to_char(sysdate,'yyyy'))-to_number('19'||substr(v_jumin,1,2)) v_age, m_no,v_time,v_area,v_confirm\r\n" + 
				"from TBL_VOTE_202005 where v_area='제1투표장'";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<VoteDTO> list = new ArrayList<VoteDTO>();
		while(rs.next()) {
			VoteDTO dto = new VoteDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
	
	//투표현황 - 후보자 등수
		public List<VoteDTO> getRanking() throws SQLException{
			Connection conn = OracleUtil.getConnection();
			String sql = "select a.m_no, a.m_name, b.count\r\n" + 
					"from TBL_MEMBER_202005 a\r\n" + 
					"join (select m_no, count(*) as count\r\n" + 
					"		from TBL_VOTE_202005\r\n" + 
					"		where v_confirm = 'Y'\r\n" + 
					"		group by m_no\r\n" + 
					"		order by count desc) b\r\n" + 
					"on a.m_no = b.m_no";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			List<VoteDTO> list = new ArrayList<VoteDTO>();
			while(rs.next()) {
				VoteDTO dto = new VoteDTO(rs.getString(1),rs.getString(2),rs.getInt(3));
				
				list.add(dto);
			}
			
			rs.close();
			ps.close();
			conn.close();
			
			return list;
		}
}
