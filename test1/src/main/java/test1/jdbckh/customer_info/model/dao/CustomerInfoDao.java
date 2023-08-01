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

	                            
	public CustomerInfoVo selectOneCustomerInfo(int custNo) {
		System.out.println("DAO selectOneCustomerInfo() arg:" + custNo);
		
		CustomerInfoVo result = null;
		String query = "SELECT * FROM CUSTOMER_INFO";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","jbj","jbj");
		pstmt = conn.prepareStatement(query);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			result = new CustomerInfoVo();
			result.setCustoNo(rset.getInt("custNo"));
			result.setCustName(rset.getString("custName"));
			result.setPhone(rset.getString("phone"));
			result.setAddress(rset.getString("address"));
			result.setJoinDate(rset.getDate("joindate"));
			result.setGrade(rset.getString("grade"));
			result.setGrade(rset.getString("city"));
		}
	 }catch (Exception e) {
			e.printStackTrace();
		 }finally {
			try {
				if(rset !=null) rset.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		 }
		 System.out.println(result);
		 return result;
	 }
	
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