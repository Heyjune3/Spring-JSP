package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * database 연결 작업 및 자원해제를 도와 줄 Util class
 */
public class JDBCUtil {
	
	/**
	 * database 연결에 필요한 필수 정보
	 */
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/develop";
	private static final String USER = "developer";
	private static final String PASS = "12345";
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL,USER,PASS);
		} catch (ClassNotFoundException e) {
			System.out.println("DriverClass를 찾을 수 없음");
		} catch (SQLException e) {
			System.out.println("연결 요청 정보 오류 : "+e.getMessage());
		}
		return conn;
	}
	
	public static void close(AutoCloseable... closer) {
		for(AutoCloseable c  : closer) {
			if(c != null) {
				try {
					c.close();
				} catch (Exception e) {}
			} // not null 
		} // end for
	} // end close
	
	
	
	
	
	
}






