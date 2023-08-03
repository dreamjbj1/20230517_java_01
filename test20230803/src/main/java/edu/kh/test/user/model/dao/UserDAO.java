package edu.kh.test.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.kh.test.user.JdbcTemplate;
import edu.kh.test.user.model.vo.UserDTO;

public class UserDAO {
	public UserDTO selectOne(Connection conn, int userNo) {
		UserDTO result = null;
		String query = "select USER_NO,USER_ID,USER_NAME,USER_AGE from TB_USER where USER_NO = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = new UserDTO(rs.getInt("USER_NO"), rs.getString("USER_ID"),rs.getString("USER_NAME"), rs.getInt("USER_AGE"));  
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcTemplate.close(rs);
			JdbcTemplate.close(pstmt);
		}
		return result;
	}
}
