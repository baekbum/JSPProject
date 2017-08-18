package kr.koreait.Service;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.DAO.FreeboardCommentDAO;
import kr.koreait.VO.FreeboardCommentList;
import kr.koreait.VO.FreeboardCommentVO;
import kr.koreait.mybatis.MySession;

public class FreeboardCommentService {

	private static FreeboardCommentService instance = new FreeboardCommentService();
	private FreeboardCommentService() { }
	public static FreeboardCommentService getInstance() { return instance; }
	
//	commentOK.jsp에서 댓글이 저장된 객체를 넘겨받고 댓글을 저장하는 메소드
	public void insertComment(FreeboardCommentVO vo) {
		SqlSession mapper = MySession.getSession();
//		System.out.println(vo);
		FreeboardCommentDAO.getInstance().insertComment(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
//	list.jsp에서 메인 글 번호를 넘겨받고 댓글의 개수를 얻어오는 메소드
	public int replyCount(int idx) {
		SqlSession mapper = MySession.getSession();
		int replyCount = FreeboardCommentDAO.getInstance().replyCount(mapper, idx);
		mapper.close();
		return replyCount;
	}
	
//	selectByIdx.jsp에서 메인 글의 글 번호를 넘겨받고 댓글을 얻어오는 메소드
	public FreeboardCommentList selectCommentList(int idx) {
		SqlSession mapper = MySession.getSession();
		FreeboardCommentList commentList = new FreeboardCommentList();
		commentList.setList(FreeboardCommentDAO.getInstance().selectCommentList(mapper, idx));
//		for(FreeboardCommentVO comment : commentList.getList()) {
//			System.out.println(comment);
//		}
		mapper.close();
		return commentList;
	}
	
//	commentOK.jsp에서 삭제할 글의 정보가 저장된 객체를 넘겨받고 댓글을 삭제하는 메소드
	public boolean deleteComment(FreeboardCommentVO vo) {
		SqlSession mapper = MySession.getSession();
		FreeboardCommentDAO dao = FreeboardCommentDAO.getInstance();
//		삭제하기 위해 입력한 비밀번호와 비교하기 위해 삭제할 댓글을 얻어온다.
		FreeboardCommentVO original = dao.selectCommentByIdx(mapper, vo.getIdx());
//		System.out.println(original);
//		삭제할 댓글의 비밀번호와 댓글을 삭제하기 위해 입력한 비밀번홀를 비교해 일치하면 삭제한다.
		if(original.getPassword().trim().equals(vo.getPassword().trim())) {
//			비밀번호가 일치하므로 글을 삭제하고 true를 리턴한다.
			dao.deleteComment(mapper, vo.getIdx());
			mapper.commit();
			mapper.close();
			return true;
		} else {
//			비밀번호가 일치하지 않으므로 false를 리턴한다.
			mapper.close();
			return false;
		}
	}
	
//	commentOK.jsp에서 수정할 글의 정보가 저장된 객체를 넘겨받고 댓글을 삭제하는 메소드
	public boolean updateComment(FreeboardCommentVO vo) {
		SqlSession mapper = MySession.getSession();
		FreeboardCommentDAO dao = FreeboardCommentDAO.getInstance();
//		수정하기 위해 입력한 비밀번호와 비교하기 위해 수정할 댓글을 얻어온다.
		FreeboardCommentVO original = dao.selectCommentByIdx(mapper, vo.getIdx());
//		System.out.println(original);
//		수정할 댓글의 비밀번호와 댓글을 삭제하기 위해 입력한 비밀번호를 비교해 일치하면 수정한다.
		if(original.getPassword().trim().equals(vo.getPassword().trim())) {
//			비밀번호가 일치하므로 글을 수정하고 true를 리턴한다.
			dao.updateComment(mapper, vo);
			mapper.commit();
			mapper.close();
			return true;
		} else {
//			비밀번호가 일치하지 않으므로 false를 리턴한다.
			mapper.close();
			return false;
		}
	}
	
}




