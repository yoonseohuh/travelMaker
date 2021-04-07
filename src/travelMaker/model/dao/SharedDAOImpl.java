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
		

		return 0;
	}
	
	@Override
	public GroupSpaceDTO getArticle(int num) throws Exception {
		GroupSpaceDTO article = sqlSession.selectOne("shared.selectOne", num);
		return article;
	}
	
	

}
