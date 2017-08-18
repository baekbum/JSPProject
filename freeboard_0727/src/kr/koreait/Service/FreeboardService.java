package kr.koreait.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.DAO.FreeboardDAO;
import kr.koreait.VO.FreeboardList;
import kr.koreait.VO.FreeboardVO;
import kr.koreait.mybatis.MySession;

public class FreeboardService {

	private static FreeboardService instence = new FreeboardService();
	private FreeboardService() { }
	public static FreeboardService getInstance() { return instence; }
	
//	insertOK.jsp에서 테이블에 저장할 메인글이 저장된 객체를 넘겨받고 매퍼를 얻어오는 메소드
	public void insert(FreeboardVO vo) {
		SqlSession mapper = MySession.getSession();
		
//		vo.setNotice(vo.getNotice() == null ? "" : vo.getNotice());
		if(vo.getNotice() == null) {
			vo.setNotice("");
		}
		
		FreeboardDAO.getInstance().insert(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
//	list.jsp에서 화면에 표시할 페이지 번호를 넘겨받고 화면에 표시할 한 페이지 분량의 글을 얻어오는 메소드
	public FreeboardList selectList(int currentPage) {
		SqlSession mapper = MySession.getSession();
		FreeboardList free = null;
		
		int pageSize = 10;			// 한 페이지에 표시할 글의 개수를 정한다.
//		테이블에 저장된 전체 메인글의 개수를 얻어온다.
		int totalCount = FreeboardDAO.getInstance().selectCount(mapper);
//		System.out.println(totalCount);
//		pageSize, totalCount, currentPage를 FreeboardList 클래스의 생성자를 이용해 멤버 변수를 초기화 시키고
//		페이지 작업에 필요한 나머지 변수를 계산한다.
		free = new FreeboardList(pageSize, totalCount, currentPage);
//		HashMap 객체를 만들고 한 페이지의 시작 일련번호와 마지막 일련번호를 넣어준다.
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("startNo", free.getStartNo());
		hmap.put("endNo", free.getEndNo());
//		얻어온 한 페이지 분량의 글을 FreeboardList의 ArrayList에 넣어준다.
		free.setList(FreeboardDAO.getInstance().selectList(mapper, hmap));
//		for(FreeboardVO vo : free.getList()) {
//			System.out.println(vo);
//		}
		mapper.close();
		return free;
	}
	
//	increment.jsp에서 글 번호를 넘겨받고 글 한 건을 얻어오는 메소드
	public FreeboardVO selectByIdx(int idx) {
		SqlSession mapper = MySession.getSession();
		FreeboardVO vo = FreeboardDAO.getInstance().selectByIdx(mapper, idx);
		mapper.close();
		return vo;
	}
	
//	increment.jsp에서 조회수를 증가시킬 글 번호를 넘겨받고 선택한 글의 조회수를 증가시키는 메소드
	public void increment(int idx) {
		SqlSession mapper = MySession.getSession();
		FreeboardDAO.getInstance().increment(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
//	deleteOK.jsp에서 삭제할 글 번호를 넘겨받고 글을 삭제하는 메소드
	public void delete(int idx) {
		SqlSession mapper = MySession.getSession();
		FreeboardDAO.getInstance().delete(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
//	updateOK.jsp에서 수정할 내용이 저장된 객체를 넘겨받고 글을 수정하는 메소드
	public void update(FreeboardVO vo) {
		SqlSession mapper = MySession.getSession();
		FreeboardDAO.getInstance().update(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
//	list.jsp에서 호출되는 공지글만 얻어오는 메소드
	public ArrayList<FreeboardVO> selectNotice() {
		SqlSession mapper = MySession.getSession();
		ArrayList<FreeboardVO> notice = FreeboardDAO.getInstance().selectNotice(mapper);
		
//		for(FreeboardVO vo : notice) {
//			System.out.println(vo);
//		}
		
		mapper.close();
		return notice;
	}
	
}





