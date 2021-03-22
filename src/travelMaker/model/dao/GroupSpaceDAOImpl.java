package travelMaker.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.GroupSpaceDTO;

@Repository
public class GroupSpaceDAOImpl implements GroupSpaceDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;

	@Override
	public void insertMaking(GroupSpaceDTO dto) throws Exception {
		sqlSession.insert("groupSpace.insertMaking",dto);
		
	}
	
	
	
}
