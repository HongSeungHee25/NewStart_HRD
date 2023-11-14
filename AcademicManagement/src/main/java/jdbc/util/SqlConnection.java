package jdbc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SqlConnection {

	public static Connection getConnection() throws SQLException{
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";		//db 연결 properties에서 확인하기
		String driver = "oracle.jdbc.OracleDriver";				//db 연결 properties에서 확인하기
		String user = "hrd";
		String password ="0419";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (ClassNotFoundException e) {
			System.out.println("데이터베이스 드라이버 로드에 문제가 생겼습니다. : " + e.getMessage());
			e.printStackTrace(); 
		} catch (SQLException e) {
			System.out.println("데이터베이스 연결 및 사용에 문제가 생겼습니다. : " + e.getMessage());
			e.printStackTrace(); 
		}
		
		return conn;
	}
	
}
