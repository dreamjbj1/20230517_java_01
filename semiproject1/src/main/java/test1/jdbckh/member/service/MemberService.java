package test1.jdbckh.member.service;

import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import test1.jdbckh.common.jdbc.MyBatisTemplate;
import test1.jdbckh.common.jdbc.JdbcTemplate;
import test1.jdbckh.member.model.dao.MemberDao;
import test1.jdbckh.member.model.dto.MemberDto;

import static test1.jdbckh.common.jdbc.JdbcTemplate.*;

public class MemberService {
			private MemberDao dao;
			
			public MemberService() {
				dao = new MemberDao();
			}
			
			
			public int insertMember(MemberDto dto) {
				int result = 0;
				SqlSession session = MyBatisTemplate.getSqlSession(true);
				result = dao.insert(session, dto);
				session.close();
				return result;
			}
			public MemberDto selectOne(int abc) {
				MemberDto result = null;
				SqlSession session = MyBatisTemplate.getSqlSession(true);
				result = dao.selectOne(session, abc);
				session.close();
				return result;
			}
			
			public List<MemberDto> MemberList() {
				List<MemberDto> result = null;
				SqlSession session = MyBatisTemplate.getSqlSession(true);
				result = dao.selectList(session);
				session.close();
				return result;
			}
			
			public int update(MemberDto dto){
				int result = -1;
				SqlSession session = MyBatisTemplate.getSqlSession(true);
				result = dao.update(session, dto);
				session.close();
				return result;
			}
		
}
