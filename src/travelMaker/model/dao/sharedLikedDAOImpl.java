package travelMaker.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.SharedLikedDTO;

@Repository
public class sharedLikedDAOImpl implements sharedLikedDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;

	
	@Override
	public void sharedLiked(int gNo, String id) throws Exception {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("id", id);
		//System.out.println("dao 따라오니?");
		sqlSession.insert("sharedLiked.insertSharedLiked", map);
		
	}


	@Override
	public int likedCheck(int gNo, String id) throws Exception {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("id", id);
		
		int check = sqlSession.selectOne("sharedLiked.likedCheck", map);
		return check;
	}

	@Override
	public List getSharedLiked(String id) throws Exception{
		List lsharedList = sqlSession.selectList("sharedLiked.getSharedLiked", id);
		//System.out.println("sharedLikedlist 오니?");
		return lsharedList;
	}


	@Override
	public void sharedLikedCancel(int gNo, String id) throws Exception {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("id", id);
		sqlSession.delete("sharedLiked.sharedLikedCancel", map);	
	}
}
