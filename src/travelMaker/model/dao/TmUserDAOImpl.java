package travelMaker.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TmUserDAOImpl implements TmUserDAO {

	@Autowired
	private SqlSessionTemplate sqlSession = null;
}
