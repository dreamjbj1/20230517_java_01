package semiProject.common.config;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionTemplate {
	private static SqlSessionFactory factory =null;

	private SqlSessionTemplate() {
		
	}
	
	public static SqlSessionFactory setSqlSessionFactory() {
		
		
		//1.트랜잭션이 설정되어 있는 파일의 경로를 정의한다.
		String resource = "semiProject/common/config/configuration.xml";
		
		
		//2. 설정 파일을 로딩하기 위해 입출력 스트림과 연결한다.
		try(Reader reader = Resources.getResourceAsReader(resource)){
			
			//3. 설정 파일을 저장하기 위한 팩토리를 생성해 줄 수 있는 빌더를 생성한다.
			SqlSessionFactoryBuilder sqlBuilder = new SqlSessionFactoryBuilder();
			
			// 프로퍼티는 아직 그냥 문자열 -> 객채로 바꾸고 객체생성 보관해줄 빌더sqlBuilder
			//4. 설정파일의 정보를 읽어와 sqlBuiler에 생성한다.
			factory = sqlBuilder.build(reader);
			
			
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return factory;
	}// end setSqlSessionFactory()
	
	
	public static SqlSession getSqlSession() {
		if(setSqlSessionFactory() == null) {
			factory = setSqlSessionFactory();	
		}
		
		//5. 쿼리문에 접근할 수 있도록 sqlSession객체를 리턴한다.
		//openSession()의 기본값은 false이다
		//자동 커밋을 설정하고 싶으면 openSession(true)로 설정한다.
		//실무에서는 자동커밋을 사용하지 않는다.
		
		//true 되어있으면 오토커밋 //    
		return factory.openSession(false);		
		
	}
}
