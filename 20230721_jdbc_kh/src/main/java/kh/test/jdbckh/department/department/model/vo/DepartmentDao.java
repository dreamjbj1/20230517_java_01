package kh.test.jdbckh.department.department.model.vo;

import static kh.test.jdbckh.common.jdbc.JdbcTemplate.close;
import static kh.test.jdbckh.common.jdbc.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kh.test.jdbckh.department.model.vo.DepartmentVo;
import kh.test.jdbckh.student.model.vo.StudentVo;

public class DepartmentDao{
		
	
	public DepartmentVo selectOneDepartment(String departmentNo) {
		 System.out.println("DAO selectOneStudent() arg:"+ departmentNo);
		 
		 DepartmentVo result = null;
		 String query = "select * from tb_department where department_No = "+"'"+departmentNo+"'";
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rset = null;
		 
		 try {
			 conn = getConnection(); 
//			 Class.forName("oracle.jdbc.driver.OracleDriver");
//			 conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","kh","kh");
//			 if(conn==null) {
//				 System.out.println("연결실패");
//			 }else {
//				 System.out.println("연결성공");
//		 	}
			 pstmt = conn.prepareStatement(query);
			 pstmt.setString(1, departmentNo);
			 rset = pstmt.executeQuery();
			 if(rset.next()) {
				 result = new DepartmentVo();
//				 while 동작시킬필요없음. query 결과가 단일행일 것이므로
				 result.setDepartment_No(rset.getString("Department_No"));
				 result.setDepartment_Name(rset.getString("Department_Name"));
				 result.setCategory(rset.getString("Category"));
				 result.setOpen_Yn(rset.getString("Open_Yn"));
				 result.setCapacity(rset.getString("Capacity"));	
				 
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
	
//	DB에서 tb_department 테이블의 있는 모든 내용을 읽어서 꺼냄
	public List<DepartmentVo> selectListDepartment() {
		List<DepartmentVo> result = null;
		String query = "select * from tb_department";
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
//			1. driver 있다면 로딩함. // 없다면 ClassNotFoundException 발생
//			2. connection 객체 생성 // dbms와 연결
			conn = getConnection();
//			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "KH", "kh"); 
//			if(conn != null) {
//				System.out.println("DB연결 성공!!!!!!!");
//			} else {
//				System.out.println("-------- DB 연결 실패--------------");
//			}
//			3. statement / PrepareStatement 객체 생성 -conn 객체로부터 - query 문을 실어보냄
			// stmt = conn.createStatement();
//			String query = "select * from tb_department";
			 pstmt = conn.prepareStatement(query);
//			 4. query 문을 실행해달라고 함. 그 결과값을 return 받음.
//			 select query 문이면 ResultSet 모양
//			 insert/update/delete 문이면 int 모양 
			 rs = pstmt.executeQuery();

//			 5. ResultSet 에서 row(record)=한줄 읽어오기 위해 cursor(포인트)를 이동함. 
			 if(rs.next()) {
				 result = new ArrayList<DepartmentVo>();
//				 한줄row/record 를 읽을 준비 완결
//				 확인용도 .System.out.println( rs.getString("STUDENT_NAME") );
				 DepartmentVo vo = new DepartmentVo();
				 vo.setDepartment_No(rs.getString("Department_No"));
				 vo.setDepartment_Name(rs.getString("Department_Name"));
				 vo.setCategory(rs.getString("category"));
				 vo.setOpen_Yn(rs.getString("open_Yn"));
				 vo.setCapacity(rs.getString("capacity"));
				
				 
				 result.add(vo);
			 } while(rs.next() == true);
			
//		} catch (ClassNotFoundException e) {
//			1. driver (ojdbc.jar)  없음
//			e.printStackTrace();
		} catch (SQLException e) {
//			2. dbms에 연결 실패.
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}

		
//		} finally {
//			if(pstmt != null) {
//				pstmt.close();
//			}
//			if(stmt != null) {
//				stmt.close();
//			}
//			if (conn != null) {
//				conn.close();
//			}
//		}
		
//		확인용 System.out.println(result);
		return result;
	}
//	DB에서 tb_department 테이블의 있는 모든 내용을 읽어서 꺼냄
	public List<DepartmentVo> selectListDepartment(String searchWord) {
		List<DepartmentVo> result = null;
		
		String query = "select * from tb_department where department_no like ? or department_name like?";
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
//			1. driver 있다면 로딩함. // 없다면 ClassNotFoundException 발생
//			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = getConnection();
//			2. connection 객체 생성 // dbms와 연결
//			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "KH", "kh"); 
//			if(conn != null) {
//				System.out.println("DB연결 성공!!!!!!!");
//			} else {
//				System.out.println("-------- DB 연결 실패--------------");
//			}
//			3. statement / PrepareStatement 객체 생성 -conn 객체로부터 - query 문을 실어보냄
			// stmt = conn.createStatement();
//			String query = "select * from tb_department where department_name like ?";
			 pstmt = conn.prepareStatement(query);
//			 3-4사이 위치홀더 ?에 값 설정
			 searchWord = "%"+searchWord+"%";
			 pstmt.setString(1, searchWord);
			 pstmt.setString(2, searchWord);
//			 4. query 문을 실행해달라고 함. 그 결과값을 return 받음.
//			 select query 문이면 ResultSet 모양
//			 insert/update/delete 문이면 int 모양 
			 rs = pstmt.executeQuery();

//			 5. ResultSet 에서 row(record)=한줄 읽어오기 위해 cursor(포인트)를 이동함. 
			 result = new ArrayList<DepartmentVo>();
			 while(rs.next() ==  true) {
//				 한줄row/record 를 읽을 준비 완결
//				 확인용도 .System.out.println( rs.getString("STUDENT_NAME") );
				 DepartmentVo vo = new DepartmentVo();
				 vo.setDepartment_No(rs.getString("Department_No"));
				 vo.setDepartment_Name(rs.getString("Department_Name"));
				 vo.setCategory(rs.getString("category"));
				 vo.setOpen_Yn(rs.getString("open_Yn"));
				 vo.setCapacity(rs.getString("capacity"));
				
				 
				 result.add(vo);
			 }
			
//		} catch (ClassNotFoundException e) {
//			1. driver (ojdbc.jar)  없음
//			e.printStackTrace();
		} catch (SQLException e) {
//			2. dbms에 연결 실패.
			e.printStackTrace();

		
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}	
		
//		System.out.println(result);
		return result;
	}
	public List<DepartmentVo> selectListDepartment(int currentPage, int pageSize ) {  // 페이징처리
		List<DepartmentVo> result = new ArrayList<DepartmentVo>();
		
		String queryTotalCnt= "select count(*) cnt from tb_department";  
		String query= " select * from "
				+ " (\r\n"
				+ " select tb1.*, rownum rn from"
				+ "    (select * from tb_department order by department_no asc) tb1"
				+ " ) tb2"
				+ " where rn between ? and ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int totalCnt = 0;  // 총글개수
		int startRownum = 0;
		int endRownum = 0;
		try {
			conn = getConnection();
			// 총글개수 알아오기 위한 query 실행
			pstmt = conn.prepareStatement(queryTotalCnt);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//오류 함수는 컬럼명이 될수 없음 -  totalCnt = rs.getInt("count(*)");
				totalCnt = rs.getInt("cnt");
				//totalCnt = rs.getInt(1);
			}
			System.out.println("총글개수:"+totalCnt);
			startRownum = (currentPage-1)*pageSize +1;
			endRownum = ((currentPage*pageSize) > totalCnt) ? totalCnt: (currentPage*pageSize);
			System.out.println("startRownum:"+startRownum);
			System.out.println("endRownum:"+endRownum);

			// conn 생성으로 2개의 query(select)문을 실행할때
			close(rs);
			close(pstmt);
			
			// 페이지당 글 읽어오기 위한 query 실행
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			rs = pstmt.executeQuery();
			
			// 5. ResultSet 에서 row(record)=한줄 읽어오기 위해 cursor(포인트)를 이동함.
			while(rs.next() == true) {
				//  한줄row/record 를 읽을 준비 완료
				// 확인용도. System.out.println( rs.getString("STUDENT_NAME") );
				 DepartmentVo vo = new DepartmentVo();
				 vo.setDepartment_No(rs.getString("Department_No"));
				 vo.setDepartment_Name(rs.getString("Department_Name"));
				 vo.setCategory(rs.getString("category"));
				 vo.setOpen_Yn(rs.getString("open_Yn"));
				 vo.setCapacity(rs.getString("capacity"));
				
				result.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}

		//  확인용 System.out.println(result);
		return result;
	}
}

