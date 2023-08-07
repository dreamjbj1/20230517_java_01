package test1.jdbckh.member.model.dao;

import static test1.jdbckh.common.jdbc.JdbcTemplate.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import test1.jdbckh.member.model.vo.MemberDto;

public class MemberDao {

	  
// 전체 테이블 나오기 
	public List<MemberDto> MemberList() {
		
			List<MemberDto> result = null;
			String query = "select * from CUSTOMER_INFO";
			Connection conn = null;
//			Statement stmt = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
			
				result = new ArrayList<MemberDto>();
				while(rs.next() == true) {
					MemberDto dto = new MemberDto();
					dto.setCustoNo(rs.getInt("CustNo"));
					dto.setCustName(rs.getString("CustName"));
					dto.setPhone(rs.getString("phone"));
					dto.setAddress(rs.getString("Address"));
					dto.setJoinDate(rs.getDate("JoinDate"));
					dto.setGrade(rs.getString("Grade"));
					dto.setCity(rs.getString("City"));
					
					result.add(dto);	
				}
				
			} catch (SQLException e) {
//				2. dbms에 연결 실패.
				e.printStackTrace();	
			} finally {
				close(rs);
				close(pstmt);
				close(conn);
			}
			
			return result;
		} // FUNCTION
	
	
	
	
}// CLASS