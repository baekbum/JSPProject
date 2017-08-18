package kr.koreait.Service;

import java.sql.SQLException;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.koreait.DAO.GuestbookDAO;
import kr.koreait.VO.GuestbookList;
import kr.koreait.VO.GuestbookVO;
import kr.koreait.VO.Param;
import kr.koreait.ibatis.MyAppSqlConfig;

public class SelectService {

	private static SelectService instance = new SelectService();
	private SelectService() { }
	public static SelectService getInstance() { return instance; }
	
//	화면에 표시할 페이지 번호를 넘겨받고 한 페이지 분량의 글을 얻어오는 메소드
	public GuestbookList selectList(int currentPage) {
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		GuestbookList guest = null;			// 한 페이지 분량의 글을 기억할 객체를 선언만 한다.
		GuestbookDAO dao = GuestbookDAO.getInstance();
		
		try {
			int pageSize = 10;			// 한 페이지에 출력할 글의 개수를 설정한다.
//			테이블에 저장된 글 전체의 개수를 얻어온다.
			int totalCount = dao.selectCount(mapper);
//			System.out.println(totalCount);
//			pageSize, totalCount, currentPage를 인수로 넘겨서 한 페이지 분량의 글을 기억하는 객체를 생성한다.
//			한 페이지 분량의 글을 기억하는 객체를 생성하면 페이지 작업에 사용되는 모든 변수가 계산된다.
			guest = new GuestbookList(pageSize, totalCount, currentPage);
			
//			테이블에서 한 페이지 분량의 글을 얻어와서 guest 객체의 ArrayList에 넣어준다.
//			HashMap<String, Integer> 객체를 선언하고 startNo와 endNo를 넣어준다.
			HashMap<String, Integer> hmap = new HashMap<>();
			hmap.put("startNo", guest.getStartNo());
			hmap.put("endNo", guest.getEndNo());
			guest.setGuest(dao.selectList(mapper, hmap));
//			for(GuestbookVO vo : guest.getGuest()) {
//				System.out.println(vo);
//			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return guest;
	}
	
//	화면에 표시할 페이지 번호와 검색어(내용)를 넘겨받고 검색어가 포함된 한 페이지 분량의 글을 얻어오는 메소드
	public GuestbookList selectList(int currentPage, String item) {
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		GuestbookList guest = null;
		GuestbookDAO dao = GuestbookDAO.getInstance();
		
		try {
			int pageSize = 10;
//			테이블에 저장된 글 중에서 검색어(내용)를 포함하는 글의 개수를 얻어온다.
			int totalCount = dao.selectCount(mapper, item);
//			System.out.println(totalCount);
			guest = new GuestbookList(pageSize, totalCount, currentPage);
			Param param = new Param();
			param.setStartNo(guest.getStartNo());
			param.setEndNo(guest.getEndNo());
			param.setItem(item);
			guest.setGuest(dao.selectList(mapper, param));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return guest;
	}
	
//	화면에 표시할 페이지 번호와 검색어(이름)를 넘겨받고 검색어가 포함된 한 페이지 분량의 글을 얻어오는 메소드
	public GuestbookList selectListName(int currentPage, String item) {
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		GuestbookList guest = null;
		GuestbookDAO dao = GuestbookDAO.getInstance();
		
		try {
			int pageSize = 10;
//			테이블에 저장된 글 중에서 검색어(이름)를 포함하는 글의 개수를 얻어온다.
			int totalCount = dao.selectCountName(mapper, item);
			System.out.println(totalCount);
			guest = new GuestbookList(pageSize, totalCount, currentPage);
			Param param = new Param();
			param.setStartNo(guest.getStartNo());
			param.setEndNo(guest.getEndNo());
			param.setItem(item);
			guest.setGuest(dao.selectListName(mapper, param));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return guest;
	}
	
//	화면에 표시할 페이지 번호와 검색어(이름+내용)를 넘겨받고 검색어가 포함된 한 페이지 분량의 글을 얻어오는 메소드
	public GuestbookList selectListNameContent(int currentPage, String item) {
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		GuestbookList guest = null;
		GuestbookDAO dao = GuestbookDAO.getInstance();
		
		try {
			int pageSize = 10;
//			테이블에 저장된 글 중에서 검색어(이름)를 포함하는 글의 개수를 얻어온다.
			int totalCount = dao.selectCountName(mapper, item);
			System.out.println(totalCount);
			guest = new GuestbookList(pageSize, totalCount, currentPage);
			Param param = new Param();
			param.setStartNo(guest.getStartNo());
			param.setEndNo(guest.getEndNo());
			param.setItem(item);
			guest.setGuest(dao.selectListNameContent(mapper, param));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return guest;
	}
	
//	화면에 표시할 페이지 번호와 검색어 및 카테고리를 넘겨받고 검색어가 포함된 한 페이지 분량의 글을 얻어오는 메소드
	public GuestbookList selectList(int currentPage, String item, String category) {
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		GuestbookList guest = null;
		GuestbookDAO dao = GuestbookDAO.getInstance();
		
		try {
			int pageSize = 10;
			
			HashMap<String, String>hashMap = new HashMap<>();
			hashMap.put("item", item);
			hashMap.put("category", category);			
			
//			테이블에 저장된 글 중에서 검색어(이름)를 포함하는 글의 개수를 얻어온다.
			int totalCount = dao.selectCount(mapper, hashMap);
			System.out.println(totalCount);
			guest = new GuestbookList(pageSize, totalCount, currentPage);
			Param param = new Param();
			param.setStartNo(guest.getStartNo());
			param.setEndNo(guest.getEndNo());
			param.setItem(item);
			param.setCategory(category);
			guest.setGuest(dao.selectListMulti(mapper, param));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return guest;
	}
	
//	selectByIdx.jsp에서 삭제 또는 수정할 글 번호를 넘겨받고 mapper를 얻어오는 메소드
	public GuestbookVO selectByIdx(int idx) {
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		GuestbookVO vo = null;
		try {
			vo = GuestbookDAO.getInstance().selectByIdx(mapper, idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
}










