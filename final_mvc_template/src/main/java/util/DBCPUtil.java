package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public interface DBCPUtil {
	
	/**
	 * @return connection pool 에서 connection 반환
	 */
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			// JNDI(Java Naming and Directory Interface)
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/java/MySQL_DBCP");
			conn = ds.getConnection();
			System.out.println(conn);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * 외부 자원과 연결된 객체의 자원해제
	 */
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









