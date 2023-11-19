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
	
	public List<SaleDTO> priceList()throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select mb.custno, mb.custname, case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end grade, sum(mo.price) price from member_tbl_02 mb, money_tbl_02 mo where mb.custno = mo.custno and mo.price is not null group by mb.custno, mb.custname, mb.grade order by sum(mo.price) desc";
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
