package kr.koreait.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.VO.FreeboardCommentVO;

public class FreeboardCommentDAO {

	private static FreeboardCommentDAO instance = new FreeboardCommentDAO();
	private FreeboardCommentDAO() { }
	public static FreeboardCommentDAO getInstance() { return instance; }

//	FreeboardCommentService 클래스에서 매퍼와 댓글이 저장된 객체를 넘겨받고 댓글을 저장하는 insert SQL 명령을 
//	실행하는 메소드
	public void insertComment(SqlSession mapper, FreeboardCommentVO vo) {
//		System.out.println(vo);
		mapper.insert("insertComment", vo);
	}
	
//	FreeboardCommentService 클래스에서 매퍼와 메인 글 번호를 넘겨받고 댓글의 개수를 세는 select SQL 명령을
//	실행하는 메소드
	public int replyCount(SqlSession mapper, int idx) {
		return (int) mapper.selectOne("replyCount", idx);
	}
	
//	FreeboardCommentService 클래스에서 매퍼와 메인 글 번호를 넘겨받고 댓글 목록을 얻어오는 select SQL 명령을
//	실행하는 메소드
	public ArrayList<FreeboardCommentVO> selectCommentList(SqlSession mapper, int idx) {
		return (ArrayList<FreeboardCommentVO>) mapper.selectList("selectCommentList", idx);
	}
	
//	FreeboardCommentService 클래스에서 매퍼와 삭제할 댓글의 글 번호를 넘겨받고 댓글 한 건을 얻어오는 select SQL
//	명령을 실행하는 메소드
	public FreeboardCommentVO selectCommentByIdx(SqlSession mapper, int idx) {
		return (FreeboardCommentVO) mapper.selectOne("selectCommentByIdx", idx);
	}
	
//	FreeboardCommentService 클래스에서 매퍼와 삭제할 댓글의 글 번호를 넘겨받고 댓글 한 건을 삭제하는 delete SQL
//	명령을 실행하는 메소드
	public void deleteComment(SqlSession mapper, int idx) {
		mapper.delete("deleteComment", idx);
	}

//	FreeboardCommentService 클래스에서 매퍼와 수정할 댓글의 글 번호를 넘겨받고 댓글 한 건을 수정하는 update SQL
//	명령을 실행하는 메소드
	public void updateComment(SqlSession mapper, FreeboardCommentVO vo) {
		mapper.update("updateComment", vo);
	}	
}
