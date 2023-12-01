package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ExamDTO;
import util.OracleUtil;

public class ExamDAO {
	private static ExamDAO dao = new ExamDAO();
	private ExamDAO() {}
	public static ExamDAO getExamDAO() {
		return dao;
	}
	public int insert(ExamDTO dto) throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "insert into exam_tbl_03 values (?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, dto.getSno());
		ps.setInt(2, dto.getEkor());
		ps.setInt(3, dto.getEmath());
		ps.setInt(4, dto.getEeng());
		ps.setInt(5, dto.getEhist());
		
		int result = ps.executeUpdate();
		
		ps.close();
		conn.close();
		
		return result;
	}
	
	public List<ExamDTO> getList() throws SQLException{
		Connection conn = OracleUtil.getConnection();
		String sql = "select s.sno, s.sname, e.ekor, e.emath, e.eeng, e.ehist,\r\n" + 
				"	   sum(e.ekor+e.emath+e.eeng+e.ehist) sum,\r\n" + 
				"       sum(e.ekor+e.emath+e.eeng+e.ehist)/4 avg,\r\n" + 
				"	   rank() over (order by nvl(sum(e.ekor+e.emath+e.eeng+e.ehist), 0) desc) rank\r\n" + 
				"from student_tbl_03 s, exam_tbl_03 e\r\n" + 
				"where s.sno=e.sno(+)\r\n" + 
				"group by s.sno, s.sname, e.ekor, e.emath, e.eeng, e.ehist";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<ExamDTO> list = new ArrayList<ExamDTO>();
		while(rs.next()) {
			ExamDTO dto = new ExamDTO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9));
			list.add(dto);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
	 
}
