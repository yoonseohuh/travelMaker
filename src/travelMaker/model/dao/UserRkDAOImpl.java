package travelMaker.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.UserRkDTO;

@Repository
public class UserRkDAOImpl implements UserRkDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public UserRkDTO getRkInfo(int rkNo) throws Exception {
		UserRkDTO rkInfo = sqlSession.selectOne("userRk.getRkInfo",rkNo);
		return rkInfo;
	}
}
