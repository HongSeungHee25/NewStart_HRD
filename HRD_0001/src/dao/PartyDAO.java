package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.PartyDTO;
import util.OracleUtility;

//TBL_PARTY_202005
public class PartyDAO {

	private static PartyDAO dao = new PartyDAO();
	private PartyDAO() {}
	public static PartyDAO getPartyDAO() {
		return dao;
	}
	
	//정당 이름 + 정당 전화번호 가져오기
	public PartyDTO getTel(String p_code) throws SQLException{
		Connection conn = OracleUtility.getConnection();
		String sql = "SELECT p_name, p_tel1, p_tel2,p_tel3 FROM TBL_PARTY_202005 WHERE p_code = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, p_code);
		ResultSet rs = ps.executeQuery();
		
		PartyDTO dto = new PartyDTO();
		
		while(rs.next()) {
			dto = new PartyDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return dto;
	}
}
