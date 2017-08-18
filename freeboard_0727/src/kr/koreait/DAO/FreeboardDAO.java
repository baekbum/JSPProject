package kr.koreait.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.VO.FreeboardVO;

public class FreeboardDAO {

	private static FreeboardDAO instence = new FreeboardDAO();
	private FreeboardDAO() { }
	public static FreeboardDAO getInstance() { return instence; }

//	FreeboardService 클래스에서 매퍼와 메인글이 저장된 객체를 넘겨받고 insert SQL 명령을 실행하는 메소드
	public void insert(SqlSession mapper, FreeboardVO vo) {
		mapper.insert("insert", vo);
	}
	
//	FreeboardService 클래스에서 매퍼를 넘겨받고 메인글의 개수를 세는 select SQL 명령을 실행하는 메소드
	public int selectCount(SqlSession mapper) {
		return (int) mapper.selectOne("selectCount");
	}
	
//	FreeboardService 클래스에서 매퍼와 시작 일련번호, 마지막 일련번호가 저장된 HashMap 객체를 넘겨받고 한 페이지
//	분량의 글을 얻어오는 select SQL 명령을 실행하는 메소드
	public ArrayList<FreeboardVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		return (ArrayList<FreeboardVO>) mapper.selectList("selectList", hmap);
	}
	
//	FreeboardService 클래스에서 매퍼와 글 번호를 넘겨받고 글 한 건을 얻어오는 Select SQL 명령을 실행하는 메소드
	public FreeboardVO selectByIdx(SqlSession mapper, int idx) {
		return (FreeboardVO) mapper.selectOne("selectByIdx", idx);
	}
	
//	FreeboardService 클래스에서 매퍼와 조회수를 증가시킬 글 번호 조회수를 증가시키는 update SQL 명령을 실행하는
//	메소드
	public void increment(SqlSession mapper, int idx) {
		mapper.update("increment", idx);
	}
	
//	FreeboardService 클래스에서 매퍼와 삭제할 글 번호를 넘겨받고 글을 삭제하는 delete SQL 명령을 실행하는
//	메소드
	public void delete(SqlSession mapper, int idx) {
		mapper.delete("delete", idx);
	}
	
//	FreeboardService 클래스에서 매퍼와 수정할 내용이 저장된 객체를 넘겨받고 글을 수정하는 update SQL 명령을
//	실행하는 메소드
	public void update(SqlSession mapper, FreeboardVO vo) {
		mapper.update("update", vo);
	}
	
//	FreeboardService 클래스에서 매퍼를 넘겨받고 공지글 전체를 얻어오는 select SQL 명령을 실행하는 메소드
	public ArrayList<FreeboardVO> selectNotice(SqlSession mapper) {
		return (ArrayList<FreeboardVO>) mapper.selectList("selectNotice");
	}
	
}
