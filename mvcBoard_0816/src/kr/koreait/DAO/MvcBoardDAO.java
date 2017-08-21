package kr.koreait.DAO;

import java.util.ArrayList;
import java.util.HashMap;

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

//	MvcBoardService 클래스에서 매퍼와 수정할 내용이 저장된 객체를 넘겨받고 글을 수정하는 update SQL 명령을
//	실행하는 메소드
	public void update(SqlSession mapper, MvcBoardVO vo) {
		mapper.update("update", vo);
	}
	
//	MvcBoardService 클래스에서 매퍼와 삭제할 글 번호를 넘겨받고 글을 삭제하는 update SQL 명령을 실행하는 메소드
	public void delete(SqlSession mapper, int idx) {
		mapper.delete("delete", idx);
	}

//	MvcBoardService 클래스에서 매퍼와 저장할 답글 vo를 넘겨받고 답글을 저장하는 insert SQL 명령을 실행하는 메소드	
	public void reply(SqlSession mapper, MvcBoardVO vo) {
		mapper.insert("reply", vo);
	}

//	MvcBoardService 클래스에서 매퍼와 ref, seq가 저장된 Hash<String, Integer> 객체를 넘겨받고 글을 seq을 1증가
//	시키는 update SQL 명령을 실행하는 메소드
	public void replyArange(SqlSession mapper, HashMap<String, Integer> hmap) {
		mapper.update("replyArange", hmap);
	}
	
}
