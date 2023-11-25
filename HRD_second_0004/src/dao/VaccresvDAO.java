package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.VaccresvDTO;
import util.OracleUtil;

public class VaccresvDAO {

	private static VaccresvDAO dao = new VaccresvDAO();
	private VaccresvDAO() {}
	public static VaccresvDAO getVaccresvDAO() {
		return dao;
	}
	
	public int max() throws SQLException{
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
	
	public int insert(VaccresvDTO dto) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "insert into tbl_vaccresv_202108 values(?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, dto.getResvno());
		ps.setString(2, dto.getJumin());
		ps.setString(3, dto.getHospcode());
		ps.setString(4, dto.getResvdate());
		ps.setInt(5, dto.getResvtime());
		ps.setString(6, dto.getVcode());
		
		int result = ps.executeUpdate();
		
		ps.close();
		conn.close();
		
		return result;
	}
	
	public VaccresvDTO selectOne(int resvno) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select a.resvno, b.name, b.jumin, c.hospname, a.resvdate, a.resvtime, a.vcode, c.hospaddr\r\n" + 
				"from TBL_VACCRESV_202108 a join TBL_JUMIN_202108 b\r\n" + 
				"on a.jumin = b.jumin join TBL_HOSP_202108 c on a.hospcode = c.hospcode\r\n" + 
				"where a.resvno = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, resvno);
		ResultSet rs = ps.executeQuery();
		VaccresvDTO dto = null;
		
		if(rs.next()) 
			dto = new VaccresvDTO(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8));
		
		rs.close();
		ps.close();
		conn.close();
		
		return dto;
	}
	
	public List<VaccresvDTO> getVacList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select h.hospaddr, count(v.hospcode) as count\r\n" + 
				"from TBL_HOSP_202108 h join TBL_VACCRESV_202108 v\r\n" + 
				"on h.hospcode = v.hospcode(+)\r\n" + 
				"group by hospaddr order by hospaddr";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<VaccresvDTO> list = new ArrayList<VaccresvDTO>();
		while(rs.next()) {
			VaccresvDTO dto = new VaccresvDTO(rs.getString(1),rs.getInt(2));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}

}
