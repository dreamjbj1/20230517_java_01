package test1.jdbckh.sales_info.service;

import java.sql.Connection;
import java.util.List;

import test1.jdbckh.sales_info.dao.SalesInfoDao;
import test1.jdbckh.sales_info.dto.SalesInfoDto;

import static test1.jdbckh.common.jdbc.JdbcTemplate.*;

public class SalesService {
	private SalesInfoDao dao = new SalesInfoDao();
	
	public List<SalesInfoDto> selectListSalesInfo() {
		Connection conn = getConnection(); 
		List<SalesInfoDto> result = dao.selectListSalesInfo();
		close(conn);
		return result;
	}
}
