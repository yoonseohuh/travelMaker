package travelMaker.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.GroupSpaceDTO;

@Repository
public class SharedDAOImpl  implements SharedDAO{

	@Autowired
	private SqlSessionTemplate sqlSession = null;

	@Override
	public List getArticles(int start, int end) throws Exception {
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List sharedList = sqlSession.selectList("shared.selectArticles", map);
		
		return sharedList;
	}
	
	@Override
	public int getArticleCount() {
		System.out.println(2);
		int count = sqlSession.selectOne("shared.getAllCount");

		return count;
	}
	
	@Override
	public GroupSpaceDTO getArticle(int num) throws Exception {
		GroupSpaceDTO shared = sqlSession.selectOne("shared.selectArticle", num);
		return shared;
	}
	
	

}
