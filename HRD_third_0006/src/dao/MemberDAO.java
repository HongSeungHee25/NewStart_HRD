package dao;

import java.sql.Connection;
import java.sql.Date;
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
	public int maxseq() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select max(custno)+1 from member_tbl_02";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return result;
	}
	public int insert(MemberDTO dto) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "insert into member_tbl_02 values(?,?,?,?,sysdate,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, dto.getCustno());
		ps.setString(2, dto.getCustname());
		ps.setString(3, dto.getPhone());
		ps.setString(4, dto.getAddress());
		ps.setString(5, dto.getGrade());
		ps.setString(6, dto.getCity());
		
		int result = ps.executeUpdate();
		
		ps.close();
		conn.close();
		
		return result;
	}
	
	public Date date() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "SELECT SYSDATE FROM dual";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Date joindate = null;
		if(rs.next()) {
			joindate = rs.getDate(1);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return joindate;
		
	}
	
	public List<MemberDTO> memberList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select * from member_tbl_02";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
	
	public MemberDTO selectOne(int custno) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select * from member_tbl_02 where custno = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, custno);
		MemberDTO dto = null;
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			dto = new MemberDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7));
		}
		rs.close();
		ps.close();
		conn.close();
		
		return dto;
	}
	
	public int update(MemberDTO dto) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "update member_tbl_02 set custname=?, phone=?, address=?,city=? where custno = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, dto.getCustname());
		ps.setString(2, dto.getPhone());
		ps.setString(3, dto.getAddress());
		ps.setString(4, dto.getCity());
		ps.setInt(5, dto.getCustno());
		
		int result = ps.executeUpdate();
		
		ps.close();
		conn.close();
		
		return result;
		
	}
}
