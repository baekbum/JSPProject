package kr.koreait.ibatis;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class MyAppSqlConfig {
	private static final SqlMapClient sqlMap;
	static {	// 초기화 블록
		// final로 선언된 변수는 선언시 반드시 초기화를 시켜야 한다. 초기화 하는데 2줄 이상 필요한 경우
		// final로 선언된 변수는 static { ~ } 사이에서 초기화를 시켜야 한다.
		try {
			String resource = "kr/koreait/ibatis/SqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException ("Error : " + e);
		}
	}
	public static SqlMapClient getSqlMapInstance(){
		return sqlMap;
	}
}
