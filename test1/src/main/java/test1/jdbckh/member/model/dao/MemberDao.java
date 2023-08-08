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

import test1.jdbckh.member.model.dto.MemberDto;
import static test1.jdbckh.common.jdbc.JdbcTemplate.*;

public class MemberDao {
	
	public int insertMember(Connection conn, MemberDto dto) {
		System.out.println("[insertMember dao] dto: "+dto);
		int result = 0;
		String query = "insert into CUSTOMER_INFO VALUES (seq_no.nextval,?,?,?,to_date(?,'yyyy-mm-dd'),?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, dto.getCustoNo());
			pstmt.setString(1, dto.getCustName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getJoinDate());
			pstmt.setString(5, dto.getGrade());
			pstmt.setString(6, dto.getCity());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("[insertMember dao result]"+result);
		return result;
	}
	  
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
					dto.setJoinDate(rs.getString("joinDate"));
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
//			System.out.println(result);
			return result;
		} // FUNCTION
	
	
	
	
}// CLASS