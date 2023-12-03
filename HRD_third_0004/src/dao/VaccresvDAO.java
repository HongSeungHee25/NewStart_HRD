package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.VaccresvDTO;
import util.OracleUtil;

public class VaccresvDAO {
	private static VaccresvDAO dao = new VaccresvDAO();
	private VaccresvDAO() {}
	public static VaccresvDAO getVaccresvDAO() {
		return dao;
	}
	public int insert(VaccresvDTO dto) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "insert into tbl_vaccresv_202108 values(?,?,?,?,?,?)";
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setInt(1, dto.getResvno());
		ps.setString(2, dto.getJumin());
		ps.setString(3, dto.getHospcode());
		ps.setString(4, dto.getResvdate());
		ps.setString(5, dto.getResvtime());
		ps.setString(6, dto.getVcode());
		
		int result = ps.executeUpdate();
		
		ps.close();
		conn.close();
		
		return result;
	}
	
	public int maxseq() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select max(resvno)+1 from tbl_vaccresv_202108";
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
	
}
