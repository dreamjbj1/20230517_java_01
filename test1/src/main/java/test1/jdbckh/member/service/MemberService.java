package test1.jdbckh.member.service;

import java.sql.Connection;
import java.util.List;

import test1.jdbckh.common.jdbc.JdbcTemplate;
import test1.jdbckh.member.model.dao.MemberDao;
import test1.jdbckh.member.model.dto.MemberDto;
import static test1.jdbckh.common.jdbc.JdbcTemplate.*;

public class MemberService {
			private MemberDao dao = new MemberDao();
			
			public int insertMember(MemberDto dto) {
				int result = 0;
				Connection conn = getConnection();
				result = dao.insertMember(conn, dto);
				JdbcTemplate.close(conn);
				return result;
			}
			public List<MemberDto> MemberList() {
				Connection conn = getConnection();
				List<MemberDto> result = dao.MemberList();
				close(conn);
				return result;
			}
}
