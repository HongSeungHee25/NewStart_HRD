package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.util.SqlConnection;
import vo.StudentVo;

public class StudentDao {

	private static StudentDao dao = new StudentDao();
	private StudentDao() {}
	public static StudentDao getStudentDao() {
		return dao;
	}
	
	public List<StudentVo> selectList() throws SQLException {
	    String sql = "SELECT sno, sname, substr(sno,1,1) grade, substr(sno,2,2) class1, substr(sno,4,2) classnum, "
	            + "CASE WHEN sgender='M' THEN '남' ELSE '여' END sgender, sphone, saddress FROM student_tbl_03";

	    try (Connection conn = SqlConnection.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery()) {

	        List<StudentVo> list = new ArrayList<>();
	        while (rs.next()) {
	            StudentVo vo = new StudentVo(rs.getString("sno"), rs.getString("sname"), rs.getString("grade"),
	                    rs.getString("class1"), rs.getString("classnum"), rs.getString("sgender"), rs.getString("sphone"), rs.getString("saddress"));
	            list.add(vo);
	        }
	        return list;
	    }
	}

}
