package kr.koreait.Service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.koreait.DAO.GuestbookDAO;
import kr.koreait.VO.GuestbookVO;
import kr.koreait.ibatis.MyAppSqlConfig;

public class UpdateService {
	private static UpdateService instance = new UpdateService();
	
	private UpdateService() {}
	
	public static UpdateService getInstance() {
		return instance;
	}
	
	
	// updateOk.jsp에서 수정할 내용이 저장된 객체를 넘겨받고 mapper를 얻어오는 메소드
	public void update(GuestbookVO vo) {
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		try {
			GuestbookDAO.getInstance().update(mapper, vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
