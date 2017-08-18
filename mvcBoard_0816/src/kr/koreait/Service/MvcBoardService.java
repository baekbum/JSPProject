package kr.koreait.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.DAO.MvcBoardDAO;
import kr.koreait.VO.MvcBoardList;
import kr.koreait.VO.MvcBoardVO;
import kr.koreait.mybatis.MySession;

public class MvcBoardService {
	private static MvcBoardService instance = new MvcBoardService();
	private MvcBoardService() {}
	public static MvcBoardService getInstance() {
		return instance;
	}
	
	// URL 창에 insertOK.nhn로 요청이 들어오면 글쓰기 폼에 입력된 내용을 받아서 테이블에 글을 저장하는 메소드
	public void insert(HttpServletRequest request, HttpServletResponse response) {
		SqlSession mapper = MySession.getSession();
//		글쓰기 폼에 입력된 내용을 받는다.
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		MvcBoardVO vo = new MvcBoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
//		입력된 내용이 저장된 객체를 인수로 해서 DAO 클래스의 insert SQL 명령을 실행하는 메소드를 호출한다.
		MvcBoardDAO.getInstance().insert(mapper,vo);
		mapper.commit();
		mapper.close();
	}
	
//	URL 창에 list.nhn로 요청이 들어오면 테이블에 저장된 글 목록 전체를 얻어오는 메소드
	public void select(HttpServletRequest request, HttpServletResponse response) {
		SqlSession mapper = MySession.getSession();
		MvcBoardList list = new MvcBoardList();
		list.setList(MvcBoardDAO.getInstance().select(mapper));
		request.setAttribute("list", list);
		mapper.close();
	}
	
//	URL 창에 view.nhn로 요청이 들어오면 넘어온 글번호에 해당되는 글 한 건을 얻어오는 메소드
	public void selectByIdx(HttpServletRequest request, HttpServletResponse response) {
		SqlSession mapper = MySession.getSession();
		MvcBoardVO vo = null;
		vo = MvcBoardDAO.getInstance().selectByIdx(mapper, Integer.parseInt(request.getParameter("idx")));
		request.setAttribute("vo", vo);
		mapper.close();	
	}
	
//	URL 창에 increment.nhn로 요청이 들어오면 제목이 클린된 글의 조회수를 증가시키는 메소드
	public void increment(HttpServletRequest request, HttpServletResponse response) {
		SqlSession mapper = MySession.getSession();
		MvcBoardDAO.getInstance().increment(mapper, Integer.parseInt(request.getParameter("idx")));
		mapper.commit();
		mapper.close();
	}
}
