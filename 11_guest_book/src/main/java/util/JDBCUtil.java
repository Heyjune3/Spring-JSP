package util;
/**
 * database 연결 작업 및 자원해제 담당 class 
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
	/**
	 * 새로운 Connection 객체 생성 및 반환 
	 */
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/develop",
				"developer",
				"12345"
			);
		} catch (ClassNotFoundException e) {
			System.out.println("Driver class를 찾을 수 없음");
		} catch (SQLException e) {
			System.out.println("연결 정보 오류 : " + e.toString());
		}
		
		return conn;
	}
	
	// 매개변수로 전달 받은 가변형 인자열의 자원 해제
	public static void close(AutoCloseable... closer) {
		for(AutoCloseable c : closer) {
			if(c != null) {
				try {
					c.close();
				} catch (Exception e) {}
			} // end null check if
		} // end for
	} // end close
}













