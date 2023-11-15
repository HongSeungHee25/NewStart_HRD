package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.VoteDTO;
import util.OracleUtility;

//TBL_VOTE_202005
public class VoteDAO {
	
	private static VoteDAO dao = new VoteDAO();
	private VoteDAO() {}
	public static VoteDAO getVoteDAO() {
		return dao;
	}
	
	//TBL_VOTE_202005 전체 내용 출력
	public List<VoteDTO> getList() throws SQLException{
		Connection conn = OracleUtility.getConnection();
		String sql = "SELECT * FROM TBL_VOTE_202005 WHERE V_AREA = '제1투표장'";
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
	
	//투표하기 Action
	public int vote(VoteDTO dto) throws SQLException{
		Connection conn = OracleUtility.getConnection();
		String sql = "INSERT INTO TBL_VOTE_202005 values (?,?,?,?,?,?)";
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
	
	//투표현황 - 후보자 등수
	public List<VoteDTO> getRanking() throws SQLException{
		Connection conn = OracleUtility.getConnection();
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
	
	/*
 	[SQL]
 	SELECT a.m_no,a.M_NAME,b.count
	FROM TBL_MEMBER_202005 a
	JOIN (SELECT m_no, count(*) AS count
			FROM TBL_VOTE_202005
			WHERE V_CONFIRM = 'Y'
			GROUP BY m_no
			ORDER BY count desc) b
	ON a.m_no = b.m_no
	 */

}
