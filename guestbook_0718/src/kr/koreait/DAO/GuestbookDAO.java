package kr.koreait.DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.koreait.VO.GuestbookVO;
import kr.koreait.VO.Param;

//	DAO(Data Access Object) 클래스는 SQL 명령을 실행하는 메소드를 모아놓는 클래스
public class GuestbookDAO {
	
	private static GuestbookDAO instance = new GuestbookDAO();
	private GuestbookDAO() { }
	public static GuestbookDAO getInstance() { return instance; }
	
//	InsertService 클래스에서 mapper와 테이블에 저장할 내용이 기억된 객체를 넘겨받고 테이블에 저장하는 
//	insert SQL 명령을 실행하는 메소드
	public void insert(SqlMapClient mapper, GuestbookVO vo) throws SQLException {
//		insert("id", SQL 명령으로 전달할 데이터)
		mapper.insert("insert", vo);
	}
	
//	SelectService 클래스에서 mapper를 넘겨받고 테이블에 저장된 전체 글의 개수를 얻어오는 select SQL 명령을
//	실행하는 메소드
	public int selectCount(SqlMapClient mapper) throws SQLException {
//		queryForObject() : select 명령 실행 결과가 한 건일 경우 사용한다. 결과는 Object 타입으로 리턴된다.
//		queryForList() : select 명령 실행 결과가 여러 건일 경우 사용한다. 결과는 List 타입으로 리턴된다.
		return (int) mapper.queryForObject("selectCount");
	}
	
//	SelectService 클래스에서 mapper와 검색어(내용)를 넘겨받고 테이블에 저장된 글의 중에서 검색어를 포함하는 글의 
//	개수를 얻어오는 select SQL 명령을 실행하는 메소드
	public int selectCount(SqlMapClient mapper, String item) throws SQLException {
		return (int) mapper.queryForObject("selectCountItem", item);
	}
	
//	SelectService 클래스에서 mapper와 검색어 및 카테고리가 저장된 HashMap 객체를 넘겨받고 테이블에 저장된 전체 글의 개수를 얻어오는 select SQL 명령을
//	실행하는 메소드
	public int selectCount(SqlMapClient mapper, HashMap<String, String> hashMap) throws SQLException {
//		queryForObject() : select 명령 실행 결과가 한 건일 경우 사용한다. 결과는 Object 타입으로 리턴된다.
//		queryForList() : select 명령 실행 결과가 여러 건일 경우 사용한다. 결과는 List 타입으로 리턴된다.
		return (int) mapper.queryForObject("selectCountMulti", hashMap);
	}
	
//	SelectService 클래스에서 mapper와 검색어(이름)를 넘겨받고 테이블에 저장된 글의 중에서 검색어를 포함하는 글의 
//	개수를 얻어오는 select SQL 명령을 실행하는 메소드
	public int selectCountName(SqlMapClient mapper, String item) throws SQLException {
		return (int) mapper.queryForObject("selectCountName", item);
	}
	
//	SelectService 클래스에서 mapper와 검색어(이름)를 넘겨받고 테이블에 저장된 글의 중에서 검색어를 포함하는 글의 
//	개수를 얻어오는 select SQL 명령을 실행하는 메소드
	public int selectCountNameContent(SqlMapClient mapper, String item) throws SQLException {
		return (int) mapper.queryForObject("selectCountNameContent", item);
	}

//	SelectService 클래스에서 mapper와 한 페이지 분량의 글의 startNo, endNo가 저장된 HashMap 객체를 넘겨받고
//	테이블에 저장된 글 중에서 한 페이지 분량의 글을 얻어오는 select SQL 명령을 실행하는 메소드
	public ArrayList<GuestbookVO> selectList(SqlMapClient mapper, HashMap<String, Integer> hmap) throws SQLException {
		return (ArrayList<GuestbookVO>) mapper.queryForList("selectList", hmap);
	}
	
//	SelectService 클래스에서 mapper와 한 페이지 분량의 글의 startNo, endNo 및 검색어(내용)가 저장된 Param 클래스 
//	객체를 넘겨받고 테이블에 저장된 글 중에서 검색어를 포함하는 한 페이지 분량의 글을 얻어오는 select SQL 명령을 
//	실행하는 메소드
	public ArrayList<GuestbookVO> selectList(SqlMapClient mapper, Param param) throws SQLException {
		return (ArrayList<GuestbookVO>) mapper.queryForList("selectListItem", param);
	}
	
//	SelectService 클래스에서 mapper와 한 페이지 분량의 글의 startNo, endNo 및 검색어(이름)가 저장된 Param 클래스 
//	객체를 넘겨받고 테이블에 저장된 글 중에서 검색어를 포함하는 한 페이지 분량의 글을 얻어오는 select SQL 명령을 
//	실행하는 메소드
	public ArrayList<GuestbookVO> selectListName(SqlMapClient mapper, Param param) throws SQLException {
		return (ArrayList<GuestbookVO>) mapper.queryForList("selectListName", param);
	}
	
//	SelectService 클래스에서 mapper와 한 페이지 분량의 글의 startNo, endNo 및 검색어(이름)가 저장된 Param 클래스 
//	객체를 넘겨받고 테이블에 저장된 글 중에서 검색어를 포함하는 한 페이지 분량의 글을 얻어오는 select SQL 명령을 
//	실행하는 메소드
	public ArrayList<GuestbookVO> selectListNameContent(SqlMapClient mapper, Param param) throws SQLException {
		return (ArrayList<GuestbookVO>) mapper.queryForList("selectListNameContent", param);
	}
	
//	SelectService 클래스에서 mapper와 한 페이지 분량의 글의 startNo, endNo 및 검색어(이름)가 저장된 Param 클래스 
//	객체를 넘겨받고 테이블에 저장된 글 중에서 검색어를 포함하는 한 페이지 분량의 글을 얻어오는 select SQL 명령을 
//	실행하는 메소드
	public ArrayList<GuestbookVO> selectListMulti(SqlMapClient mapper, Param param) throws SQLException {
		return (ArrayList<GuestbookVO>) mapper.queryForList("selectListMulti", param);
	}
	
//	SelectService 클래스에서 mapper와 글 번호를 넘겨받고 테이블에서 해당 글 번호의 글 한 건을 얻어오는
//	select SQL 명령을 실행하는 메소드
	public GuestbookVO selectByIdx(SqlMapClient mapper, int idx) throws SQLException {
		return (GuestbookVO) mapper.queryForObject("selectByIdx", idx);
	}
	
//	DeleteService 클래스에서 mapper와 글 번호를 넘겨받고 테이블에서 해당 글 한 건을 삭제하는 delete SQL 명령을
//	실행하는 메소드
	public void delete(SqlMapClient mapper, int idx) throws SQLException {
		mapper.delete("delete", idx);
	}
	
//	UpdateService 클래스에서 mapper와 수정할 내용이 저정된 객체를 넘겨받고 테이블에서 글 한 건을 수정하는
//	update SQL 명령을 실행하는 메소드
	public void update(SqlMapClient mapper, GuestbookVO vo) throws SQLException {
		mapper.update("update", vo);
	}
	
}
