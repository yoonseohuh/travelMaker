package travelMaker.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
	
	@Override
	public int getArticleCount() throws Exception {
		return sqlSession.selectOne("groupSpace.getArticleCount");
	}
	
	@Override
	public List getArticles(int start, int end) throws Exception {
		Map map = new HashMap();
		map.put("start",start);
		map.put("end",end);
		List articleList = sqlSession.selectList("groupSpace.getArticles",map);
		return articleList;
	}
	
	
	
}
