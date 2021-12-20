package com.bitc.dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory;

public class MemberDao {

//	접속 정보
//	접속 ID/PW
//	각 SQL 실행 메서드

	private String drivers = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
	private String uid = "test";
	private String upw = "1234";

	public MemberDao() {
		try {
			Class.forName(drivers);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
//	각 SQL 실행 메서드
	public int idPwChck(String userId, String userPw) {
		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) as cnt from t_member ";
				sql += "where user_id = ? ";
				sql += "and user_pw = ? ";
				sql += "and deleted_yn = 'N' ";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			result = rs.getInt("cnt");

		} 
		catch (SQLException se) {
			se.printStackTrace();

		} 
		finally {
			try {
				if (rs != null) { rs.close(); }
				if (pstmt != null) { pstmt.close(); }
				if (conn != null) { conn.close(); }

			} 
			catch (SQLException se) {
				se.printStackTrace();
			}
		}

		return result;
	}

		public MemberDto getuserInfo(String userId) {
			MemberDto member = new MemberDto();
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select user_id, user_pw, user_name, ";
					sql += "user_email, user_phone, user_addr, "; 					sql += "user_gender " ;
					sql += "FROM t_member ";
					sql += "where user_id = ? ";
					sql	+= "and deleted_yn = 'N' ";
	
			try {
				conn = DriverManager.getConnection(url, uid, upw);
				pstmt = conn.prepareStatement(sql);
				
				
				pstmt.setString(1, userId);
				
				rs = pstmt.executeQuery();				
				
				rs.next();
			
				member.setUserId(rs.getString("user_id"));
				member.setUserPw(rs.getString("user_pw"));
				member.setUserName(rs.getString("user_name"));
				member.setUserEmail(rs.getString("user_email"));
				member.setUserPhone(rs.getString("user_phone"));
				member.setUserAddr(rs.getString("user_addr"));
				member.setUserGender(rs.getString("user_gender"));
				
			} catch (SQLException se) {
				se.printStackTrace();
			}
			finally {
				try {
					if (rs != null ) { rs.close(); }
					if (pstmt != null ) { pstmt.close(); }
					if (conn != null ) { conn.close(); }
					
				} 
				catch (Exception e) {

				}
			}
			return member;
		}
		
		
		public int insertMember(MemberDto member) {
			int result = 0;

			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String sql = "insert into t_member ";
			sql += "(user_id, user_pw, user_name, user_email, user_phone, user_addr, user_gender) ";
			sql += "values (?, ?, ?, ?, ?, ?, ?) ";
			
			try {
				conn = DriverManager.getConnection(url, uid, upw);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getUserId());
				pstmt.setString(2, member.getUserPw());
				pstmt.setString(3, member.getUserName());
				pstmt.setString(4, member.getUserEmail());
				pstmt.setString(5, member.getUserPhone());
				pstmt.setString(6, member.getUserAddr());
				pstmt.setString(7, member.getUserGender());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException se) {
				se.printStackTrace();
			}
			finally {
				try {
					if (pstmt != null) { pstmt.close(); }
					if (conn != null) { conn.close(); }
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			
			return result;
		}
		
}
