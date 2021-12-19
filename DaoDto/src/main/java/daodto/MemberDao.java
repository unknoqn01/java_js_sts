package daodto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.cj.xdevapi.Result;



public class MemberDao {

	private String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
	private String uid = "test";
	private String upw = "1234";


	
	public MemberDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDto> memberSelect() {
		
		ArrayList<MemberDto> members = new ArrayList<MemberDto>(); 
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member ";
		
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
				if (rs != null) {rs.close(); }
				if (stmt != null) {stmt.close();}
				if (conn != null) {conn.close();}

			} 
			catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
				
			}
		}
		
		return members;
	}
	
	//insert
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
	
	//insert preparedStatement
	public int memberIn(MemberDto member) {
		Connection conn = null;
		//Statement stmt = null;
		PreparedStatement pstmt = null;
		
		int resultCount = 0;
		
		String sql = " insert into member values ('?', '?', '?');";
		
		try {
		
			conn = DriverManager.getConnection(url, uid, upw);
			//stmt = conn.createStatement();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(0, member.getId());
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			
			//resultCount = stmt.executeUpdate(sql);
			resultCount = pstmt.executeUpdate();
		
		}
		catch (SQLException se) {
			System.out.println(se.getMessage());
			se.printStackTrace();
		}
		finally {
			try {
				if (pstmt != null) { pstmt.close(); }
				if (conn != null) { conn.close(); }
			}
			catch (SQLException se) {
				System.out.println(se.getMessage());
				se.printStackTrace();
			}
		}
		return resultCount;
	}
	
	
	//update
	public int memberUpdate(MemberDto member) {
		Connection conn = null;
		Statement stmt = null;
		
		int resultCount = 0;
		
		String sql = "update member set id = '";
		sql += member.getId() + "', passwd = '" + member.getPasswd() + "', name = '" + member.getName() + "' ";
		sql += "where id = '"+member.getId()+"';";
		
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
				if (stmt != null) { stmt.close();}
				if (conn != null) { conn.close();} 
			} 
			catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
		
		return resultCount;
	}

	//delete
	public int memberDelete(String id) {
		int resultCount = 0;
		String sql = "DELETE FROM member ";
		sql += "WHERE id = '" + id + "' ";
		
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

