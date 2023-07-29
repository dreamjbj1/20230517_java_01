package semiProject.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import semiProject.board.dto.BoardDTO;
import semiProject.board.dto.BoardPageDTO;

public class BoardDAO {
	
    public List<BoardDTO> BoardMainList(SqlSession sqlSession, BoardPageDTO dto)
    {
    	return sqlSession.selectList("Board.MainList",dto);
    }
    
    public int MainListTotalCount(SqlSession sqlSession,String searchWord)
    {
    	 	
    	return sqlSession.selectOne("Board.MainListTotalCount",searchWord);
    }
    
    public int MainListWrite(SqlSession sqlSession,BoardDTO dto)
    {
    	
    	return sqlSession.insert("Board.MainListWrite",dto);
    }
    
    public BoardDTO GetByOneList(SqlSession sqlSession,int board_id)
    {
    	
    	return sqlSession.selectOne("Board.GetByOneList",board_id);
    }
    
    public int MainListUpdate(SqlSession sqlSession,BoardDTO dto)
    {
    	
    	return sqlSession.update("Board.MainListUpdate",dto);
    }
    
    public int MainListDelete(SqlSession sqlSession,int board_id)
    {
    	
    	return sqlSession.delete("Board.MainListDelete",board_id);
    }
    
}
