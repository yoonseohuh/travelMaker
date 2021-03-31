package travelMaker.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SharedDAOImpl  implements SharedDAO{

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public int shared() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
