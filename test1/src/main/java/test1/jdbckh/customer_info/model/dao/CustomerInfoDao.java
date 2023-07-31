package test1.jdbckh.customer_info.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import test1.jdbckh.customer_info.model.vo.CustomerInfoVo;

public class CustomerInfoDao {
	
	                            
	public List<CustomerInfoVo> selectListCustomerInfo() {
		
			List<CustomerInfoVo> result = null;
//			String query = "select * from CUSTOMER_INFO";
			Connection conn = null;
			Statement stmt = null;
			PreparedStatement pstmt = null;
			
			
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jbj", "jbj");
				if(conn != null) {
					System.out.println("DB연결 성공!!!!!!!");
				} else {
					System.out.println("-------- DB 연결 실패--------------");
				}		
				String query = "select * from CUSTOMER_INFO";
				pstmt = conn.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
				
				result = new ArrayList<CustomerInfoVo>();
				while(rs.next() == true) {
					CustomerInfoVo vo = new CustomerInfoVo();
					vo.setCustoNo(rs.getInt("CustNo"));
					vo.setCustName(rs.getString("CustName"));
					vo.setPhone(rs.getString("phone"));
					vo.setAddress(rs.getString("Address"));
					vo.setJoinDate(rs.getDate("JoinDate"));
					vo.setGrade(rs.getString("Grade"));
					vo.setCity(rs.getString("City"));
					
					result.add(vo);
					
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