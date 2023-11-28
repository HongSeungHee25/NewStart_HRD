package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.SaleDTO;
import util.OracleUtil;

public class SaleDAO {
	private static SaleDAO dao = new SaleDAO();
	private SaleDAO() {}
	public static SaleDAO getSaleDAO() {
		return dao;
	}

	public List<SaleDTO> sale() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select a.custno, a.custname, a.grade, b.total\r\n" + 
				"from MEMBER_TBL_02 a join (\r\n" + 
				"	select custno, sum(price) as total\r\n" + 
				"	from MONEY_TBL_02\r\n" + 
				"	group by custno\r\n" + 
				") b on a.custno = b.custno\r\n" + 
				"order by b.total desc";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<SaleDTO> list = new ArrayList<SaleDTO>();
		while(rs.next()) {
			SaleDTO dto = new SaleDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
}
