package kr.co.studystory.dao;

import java.io.IOException;
import java.io.Reader;

import javax.annotation.Resources;


public class CommonDAO {
	
	private static CommonDAO c_dao;
	
	public static CommonDAO getInstance() {
		if (c_dao == null) {
			c_dao = new CommonDAO();
		}
		
		return c_dao;
	}
	
	/*public SqlSessionFactory getSqlSessionFactory() {
		SqlSessionFactory ssf = null;
		
		try {
			Reader r = Resources.getResourceAsReader("ø¨∞·«“ mybatis_config.xml");
			SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
			ssf = ssfb.build(r);
			if (r != null) {
				r.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return ssf;
	}*/
	

}
