package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleUtil {
	public static Connection getConnection() {
		Connection conn = null;
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
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

}
