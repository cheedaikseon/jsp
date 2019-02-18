package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OJDBCUtil {
	
	public static Connection getConnection() {
		Connection con = null;
		// alt + s // w  
		try {
			Context context = new InitialContext();
			DataSource data = (DataSource)context.lookup("java:comp/env/jdbc/oracleDB");
			con = data.getConnection();
		} catch (NamingException e) {
			System.out.println("이름 경로에 파일이 부적합함.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("파일은 찾았으나 설정 정보가 일치 하지 않음");
			e.printStackTrace();
		}
		return con;
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs != null) {rs.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(PreparedStatement pstmt) {
		try {
			if(pstmt != null) {pstmt.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection con) {
		try {
			if(con != null) {con.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}





