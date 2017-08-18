package kr.koreait.Service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.koreait.DAO.GuestbookDAO;
import kr.koreait.VO.GuestbookVO;
import kr.koreait.ibatis.MyAppSqlConfig;

//	Service 클래스는 mapper를 얻어오고 SQL 명령을 실행하기 전에 필요한 작업이 있으면 처리한다.
public class InsertService {

//	singleton 방식
//	프로그램에서 한 순간에 단 한 개의 객체만 필요한 경우에 만들어 사용한다.
	
//	자기 자신의 객체를 정적 멤버로 만든다.
	private static InsertService instance = new InsertService();
//	클래스 외부에서 객체를 생성할 수 없도록 기본 생성자의 접근 권한을 private으로 변경한다.
	private InsertService() { }
//	자기 자신의 객체를 리턴시키는 정적 메소드를 만든다.
	public static InsertService getInstance() { return instance; }
	
//	insertOK.jsp에서 테이블에 저장할 글이 기억된 객체를 넘겨받고 mapper를 얻어오는 메소드
	public void insert(GuestbookVO vo) {
//		ibatis mapper를 얻어온다.
//		mapper에는 데이터베이스에 연결하는 기능과 데이터베이스에 연결 후 실행할 SQL 명령이 저장되어 있다.
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
//		DAO(Data Access Object) 클래스의 insert SQL 명령을 실행하는 메소드를 호출한다.
		try {
			GuestbookDAO.getInstance().insert(mapper, vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}







