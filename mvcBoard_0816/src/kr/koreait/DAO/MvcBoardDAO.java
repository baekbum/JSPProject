package kr.koreait.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.VO.MvcBoardVO;

public class MvcBoardDAO {
	private static MvcBoardDAO instance = new MvcBoardDAO();
	private MvcBoardDAO() {}
	public static MvcBoardDAO getInstance() {
		return instance;
	}	
	
//	MvcBoardService 클래스에서 매퍼와 테이블에 저장할 내용이 기억된 객체를 넘겨받고 insert SQL 명령을 실행하는 메소드
	public void insert(SqlSession mapper, MvcBoardVO vo) {
		mapper.insert("insert", vo);
	}
	
//	MvcBoardService 클래스에서 매퍼를 넘겨받고 테이블에 저장된 글 전체를 얻어오는 select SQL 명령을 실행하는 메소드
	public ArrayList<MvcBoardVO> select(SqlSession mapper) {
		return (ArrayList<MvcBoardVO>) mapper.selectList("select");
	}
	
//	MvcBoardService 클래스에서 매퍼와 조회수를 증가시킬 글번호를 넘겨받고 글번호를 증가시키는 update SQL 명령을 실행하는 메소드
	public void increment(SqlSession mapper, int idx) {
		mapper.update("increment", idx);
	}

//	MvcBoardService 클래스에서 매퍼와 화면에 출력할 글번호를 넘겨받고 글번호에 해당되는 글 한건을 얻어오는
//	select SQL 명령을 실행하는 메소드
	public MvcBoardVO selectByIdx(SqlSession mapper, int idx) {
		return (MvcBoardVO) mapper.selectOne("selectByIdx", idx);
	}
//	
	
}
