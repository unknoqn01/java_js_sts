package daodto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberDao {
	
	private String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
	private String uid = "testuser";
	private String upw = "bitc1234";
	
	public MemberDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDto> memberSelect() {
		
		ArrayList<MemberDto> members = new ArrayList<MemberDto>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member ";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				String id = rs.getString("id");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
				
				MemberDto dto = new MemberDto(id, passwd, name);
				members.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) { rs.close(); }
				if (stmt != null) { stmt.close(); }
				if (conn != null) { conn.close(); }
			}
			catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
		
		return members;
	}
	
	public int memberInsert(MemberDto member) {
		Connection conn = null;
		Statement stmt = null;
		int resultCount = 0;
		
		String sql = "INSERT INTO member (id, passwd, name) ";
		sql += "VALUES ('" + member.getId() + "','"+ member.getPasswd() +"','"+ member.getName() +"'); ";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			resultCount = stmt.executeUpdate(sql);
		}
		catch (SQLException se) {
			System.out.println(se.getMessage());
			se.printStackTrace();
		}
		finally {
			try {
				if (stmt != null) { stmt.close(); }
				if (conn != null) { conn.close(); }
			}
			catch (SQLException se) {
				System.out.println(se.getMessage());
				se.printStackTrace();
			}
		}
		
		return resultCount;
	}
	
	public int memberUpdate(MemberDto member) {
		int resultCount = 0;
		String sql = "UPDATE member SET ";
		sql += "id = " + member.getId() + ", passwd = " + member.getPasswd() + ", name = " + member.getName() + " ";
		sql += "WHERE id = " + member.getId() + " ";
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			resultCount = stmt.executeUpdate(sql);
		}
		catch (SQLException se) {
			se.printStackTrace();
		}
		finally {
			try {
				if (stmt != null) { stmt.close(); }
				if (conn != null) { conn.close(); }
			}
			catch (SQLException se) {
				se.printStackTrace();
			}
		}
		
		return resultCount;
	}
	
	public int memberDelete(String id) {
		int resultCount = 0;
		String sql = "DELETE FROM member ";
		sql += "WHERE id = " + id + " ";
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			resultCount = stmt.executeUpdate(sql);
		}
		catch (SQLException se) {
			se.printStackTrace();
		}
		finally {
			try {
				if (stmt != null) { stmt.close(); }
				if (conn != null) { conn.close(); }
			}
			catch (SQLException se) {
				
			}
		}
		
		return resultCount;
	}
}











