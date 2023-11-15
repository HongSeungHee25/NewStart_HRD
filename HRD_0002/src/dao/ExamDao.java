package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jdbc.util.SqlConnection;
import vo.ExamVo;

public class ExamDao {
	
	private static ExamDao dao = new ExamDao();
	private ExamDao() {}
	public static ExamDao getExamDao() {
		return dao;
	}

	public int insert(ExamVo vo) throws SQLException {
		Connection conn = SqlConnection.getConnection();
		String sql = "insert into exam_tbl_03 values(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, vo.getSno());
		pstmt.setInt(2, vo.getEkor());
		pstmt.setInt(3, vo.getEmath());
		pstmt.setInt(4, vo.getEeng());
		pstmt.setInt(5, vo.getEhist());
		
		int result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}
}
