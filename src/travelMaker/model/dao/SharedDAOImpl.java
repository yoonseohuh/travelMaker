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
		//System.out.println("DAO 넘어오니?");
		return sharedList;
	}
	
	@Override
	public int getArticleCount() {
		int count =sqlSession.selectOne("shared.getAllCount");
		
		return count;
	}
	
	@Override
	public GroupSpaceDTO getArticle(int gNo) throws Exception {
		GroupSpaceDTO article = sqlSession.selectOne("shared.selectArticle", gNo);
		//System.out.println("dao"+article);
		//System.out.println("dao 넘어왔니?");
		return article;
	}
	
	

}
