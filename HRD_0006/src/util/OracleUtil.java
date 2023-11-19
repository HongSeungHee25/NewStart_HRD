package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OracleUtil {
	public static Connection getConnection() {
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";			//DB 연결할때 복사해놓기
		String driver = "oracle.jdbc.driver.OracleDriver";			//★ 고정 ★ - 오라클은 이거 고정이므로 중요
		String user = "hrd";		
		String password = "0419";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			System.err.println("ClassNotFoundException");
		} catch (SQLException e) {
			System.err.println("SQLException");
		}
		return conn;
	}
	
	public static void close(Connection conn)throws SQLException{
		conn.close();
	}
	
	//pstmt, rs, conn 전부 close 할 경우 ▶ 필수 X (있으면 편함)
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
}
