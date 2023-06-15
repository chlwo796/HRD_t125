package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnect {
	// 싱글톤처리
	private static DBConnect instance = new DBConnect();

	private DBConnect() {
	}

	public static DBConnect getInstance() {
		return instance;
	}

	public Connection getConnection() {
		Connection con = null;
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String user = "system";
		String pwd = "1234";

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, pwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	public static void getClose(PreparedStatement pstmt, Connection con) {
		try {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
		}
	}

	public static void getClose(ResultSet rs, PreparedStatement pstmt, Connection con) {
		// 작은 것부터 닫기
		// db 연결해서 sql문을 자바에 삽입할 때 가장 나중에 선언된 것부터 닫는다.
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
		}
	}
}
