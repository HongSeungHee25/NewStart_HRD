package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.HospDTO;
import dto.VacCheckDTO;
import dto.VacDTO;
import util.OracleUtil;

public class VacDAO {
	
	private static VacDAO dao = new VacDAO();
	private VacDAO() {}
	public static VacDAO getVacDAO() {
		return dao;
	}

	public int getResvno() throws SQLException {
		Connection conn = OracleUtil.getConnection();
		String sql = "SELECT MAX(RESVNO)+1 FROM TBL_VACCRESV_202108";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		int result = 0;
		if(rs.next())
			result = rs.getInt(1);
		

		ps.close();
		conn.close();
		
		return result;
	}
	
	public int insert(VacDTO dto) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "INSERT INTO TBL_VACCRESV_202108 VALUES (?,?,?,?,?,?)";
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
	
	public VacCheckDTO selectOne(int resvno) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select a.resvno, b.name, b.jumin, c.hospname, a.resvdate, a.resvtime, a.vcode, c.hospaddr\r\n" + 
				"from TBL_VACCRESV_202108 a join TBL_JUMIN_202108 b\r\n" + 
				"on a.jumin = b.jumin join TBL_HOSP_202108 c on a.hospcode = c.hospcode\r\n" + 
				"where a.resvno = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, resvno);
		ResultSet rs = ps.executeQuery();
		VacCheckDTO dto = null;
		
		if(rs.next()) 
			dto = new VacCheckDTO(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8));
		
		rs.close();
		ps.close();
		conn.close();
		
		return dto;
	}
	
	public List<HospDTO> getList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select a.hospaddr, count(*) as count\r\n" + 
				"from TBL_HOSP_202108 a, TBL_VACCRESV_202108 b\r\n" + 
				"where a.hospcode = b.hospcode\r\n" + 
				"group by a.hospaddr\r\n" + 
				"order by a.hospaddr";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<HospDTO> list = new ArrayList<HospDTO>();
		
		while(rs.next()) {
			HospDTO dto = new HospDTO(rs.getString(1), rs.getInt(2));
			list.add(dto);
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
}
