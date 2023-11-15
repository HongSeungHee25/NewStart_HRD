package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.util.SqlConnection;
import vo.AcademicVo;

public class AcademicDao {
	
	private static AcademicDao dao = new AcademicDao();
	private AcademicDao() {}
	public static AcademicDao getAcademicDao() {
		return dao;
	}
	
	public List<AcademicVo> list() throws SQLException{
		String sql = "select substr(s.sno,1,1) grade, \r\n"
				+ "       substr(s.sno,2,2) class, \r\n"
				+ "       substr(s.sno,4,2) classnum,\r\n"
				+ "       s.sname, e.ekor, e.emath, e.eeng, e.ehist,\r\n"
				+ "	   sum(e.ekor+e.emath+e.eeng+e.ehist) sum,\r\n"
				+ "       sum(e.ekor+e.emath+e.eeng+e.ehist)/4 avg,\r\n"
				+ "	   rank() over (order by nvl(sum(e.ekor+e.emath+e.eeng+e.ehist), 0) desc) rank\r\n"
				+ "from student_tbl_03 s, exam_tbl_03 e\r\n"
				+ "where s.sno=e.sno(+)\r\n"
				+ "group by substr(s.sno,1,1),\r\n"
				+ "         substr(s.sno,2,2),\r\n"
				+ "         substr(s.sno,4,2),\r\n"
				+ "         s.sname, e.ekor, e.emath, e.eeng, e.ehist";
		
		List<AcademicVo> list = new ArrayList<>();
		Connection conn = SqlConnection.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			list.add(new AcademicVo(rs.getString(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getInt(5),
					rs.getInt(6),
					rs.getInt(7),
					rs.getInt(8),
					rs.getInt(9),
					rs.getDouble(10),
					rs.getInt(11)));
		}
		return list;
	}
	
}
