package travelMaker.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class sharedLikedDAOImpl implements sharedLikedDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;

	
	@Override
	public void sharedLiked(int gNo, String id) throws Exception {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("id", id);
		System.out.println("dao 따라오니?");
		sqlSession.insert("sharedLiked.insertSharedLiked", map);
		
	}


	@Override
	public int likedCheck(int gNo, String id) throws Exception {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("id", id);
		
		int count = sqlSession.selectOne("sharedLiked.likedCnt", map);
		return count;
	}

	@Override
	public void sharedLikedCancel(int gNo, String id) throws Exception {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("id", id);
		
		sqlSession.insert("sharedLiked.sharedLikedCancel", map);
		
	}
}
