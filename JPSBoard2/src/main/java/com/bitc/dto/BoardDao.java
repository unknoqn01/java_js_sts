package com.bitc.dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDao {
	
//	접속 정보
//	접속 ID/PW
//	각 SQL 실행 메서드

	private String drivers = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
	private String uid = "test";
	private String upw = "1234";

	public BoardDao() {
		try {
			Class.forName(drivers);
		} catch (Exception e) {
			
		}
	}
	
	//	게시글 목록
	public ArrayList<BoardDto> selectBoardList() {
	      ArrayList<BoardDto> boardList = new ArrayList<BoardDto>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      String sql = "SELECT * FROM t_board ";
	      sql += "WHERE deleted_yn = 'N' ";
	      
	      try {
	         conn = DriverManager.getConnection(url, uid, upw);
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         
	         while (rs.next()) {
	            int idx = rs.getInt("idx");
	            String title = rs.getString("title");
	            String contents = rs.getString("contents");
	            String creatorId = rs.getString("creator_id");
	            String createdDate = rs.getString("created_date");
	            String updatedId = rs.getString("update_id");
	            String updatedDate = rs.getString("updated_date");
	            int hitCnt = rs.getInt("hit_cnt");
	            String passwd = rs.getString("passwd");
	            
	            BoardDto item = new BoardDto();
	            item.setIdx(idx);
	            item.setTitle(title);
	            item.setContents(contents);
	            item.setCreatorId(creatorId);
	            item.setCreatedDate(createdDate);
	            item.setUpdateId(updatedId);
	            item.setUpdatedDate(updatedDate);
	            item.setHitCnt(hitCnt);
	            item.setPasswd(passwd);
	            
	            boardList.add(item);
	         }
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
	      
	      return boardList;
	   }
	//	게시글 확인
	
	
	//	게시글 등록
	public int boardInsert(BoardDto board) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into t_board(title, contents, creator_id, cteated_date) ";
		sql += "values(?, ?, ?, now()) ";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContents());
			pstmt.setString(3, board.getCreatorId());
			
			result = pstmt.executeUpdate();
		} 
		catch (SQLException se) {
			se.printStackTrace();
		}
		finally {
			try {
				if (pstmt != null) { pstmt.close(); }
				if (conn != null) { conn.close(); }
			} 
			catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return result;
	}
	//
}
