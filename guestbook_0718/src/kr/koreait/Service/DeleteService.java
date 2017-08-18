package kr.koreait.Service;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.koreait.ibatis.MyAppSqlConfig;

public class DeleteService {
	private static DeleteService instance = new DeleteService();
	
	private DeleteService() {}
	
	public static DeleteService getInstance() {
		return instance;
	}
	
	// deleteOk.jsp에서 삭제할 글 번호를 넘겨받고 mapper를 얻어오는 메소드
	public void delete(int idx) {
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
	}
	
}
