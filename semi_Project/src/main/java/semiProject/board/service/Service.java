package semiProject.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import semiProject.board.dao.BoardDAO;
import semiProject.board.dto.BoardDTO;
import semiProject.board.dto.BoardPageDTO;
import semiProject.common.config.SqlSessionTemplate;


public class Service{
	
	    private BoardDAO dao = new BoardDAO();
		
		private SqlSessionFactory factory =  SqlSessionTemplate.setSqlSessionFactory();
		
		
		public List<BoardDTO> BoardListMain(BoardPageDTO dto){
			SqlSession sqlSession = null;
			sqlSession = factory.openSession(true);
			return dao.BoardMainList(sqlSession,dto);
			
		}
		
		public int BoardListMainTotalCount(String searchWord){
			SqlSession sqlSession = null;
			sqlSession = factory.openSession(true);
			return dao.MainListTotalCount(sqlSession,searchWord);
			
		}
		
		public int MainListWrite(BoardDTO dto){
			SqlSession sqlSession = null;
			sqlSession = factory.openSession(true);
			return dao.MainListWrite(sqlSession, dto);
			
		}
		
		public BoardDTO GetByOneList(int board_id){
			SqlSession sqlSession = null;
			sqlSession = factory.openSession(true);
			return dao.GetByOneList(sqlSession, board_id);
			
		}
		
		
		public int MainListUpdate(BoardDTO dto){
			SqlSession sqlSession = null;
			sqlSession = factory.openSession(true);
			return dao.MainListUpdate(sqlSession, dto);
			
		}
		
		public int MainListDelete(int board_id){
			SqlSession sqlSession = null;
			sqlSession = factory.openSession(true);
			return dao.MainListDelete(sqlSession, board_id);
			
		}

}
