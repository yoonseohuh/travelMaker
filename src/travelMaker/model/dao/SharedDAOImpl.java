package travelMaker.model.dao;

import java.util.ArrayList;
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
	// 조회수 메서드
	@Override
	public void updateReadCnt(int gNo) {
		sqlSession.update("shared.updateReadcount", gNo);
		//System.out.println("조회수 dao 왔니?");
		
	}
	// 좋아요 +1
	@Override
	public void sharedLikedCnt(int gNo, int sl) throws Exception {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("sl", sl);
		sqlSession.update("shared.sharedLikedCnt", map);
		
	}

	
	

}
