package test1.jdbckh.sales_info.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import test1.jdbckh.sales_info.dto.SalesInfoDto;


public class SalesInfoDao {
	public List<SalesInfoDto> selectListSalesInfo() {
		List<SalesInfoDto> result = null;
		String query = "select * from SALES_INFO";
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		
		
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jbj", "jbj");
//				if(conn != null) {
//					System.out.println("DB연결 성공!!!!!!!");
//				} else {
//					System.out.println("-------- DB 연결 실패--------------");
//				}		
//				String query = "select * from SALES_INFO";
				pstmt = conn.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
				
				result = new ArrayList<SalesInfoDto>();
				while(rs.next() == true) {
					SalesInfoDto dto = new SalesInfoDto();
					dto.setSaleNol(rs.getInt("SaleNol"));
					dto.setCustNo(rs.getInt("CustNo"));
					dto.setPcost(rs.getInt("Pcost"));
					dto.setAmount(rs.getInt("Amount"));
					dto.setPrice(rs.getInt("Price"));
					dto.setPcode(rs.getString("Pcode"));
					dto.setSdate(rs.getDate("Sdate"));
					
					result.add(dto);
				}
				
			} catch (ClassNotFoundException e) {
//				1. driver (ojdbc.jar)  없음
				e.printStackTrace();
			} catch (SQLException e) {
//				2. dbms에 연결 실패.
				e.printStackTrace();	
			} finally {
				try {
					if(pstmt != null) {
						pstmt.close();	
					}
					if(stmt != null) {
						stmt.close();
					}
					if (conn != null) {
						conn.close();
					}
				}
				catch(SQLException e) {
					e.printStackTrace();	
				}
			}	
	
			
			return result;
		} // FUNCTION
	
	
	
	
}// CLASS
