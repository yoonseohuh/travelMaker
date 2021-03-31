package travelMaker.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SharedDAOImpl  implements SharedDAO{

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public int getshared(int gNo) throws Exception {
		sqlSession.selectOne("shared.select", gNo);
		return 0;
	}

}
