package travelMaker.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class LandmarkLikedDAOImpl implements LandmarkLikedDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession = null;

	@Override
	public void landmarkLiked(String id, int lNo) throws Exception {
		Map map = new HashMap();
		map.put("id", id);
		map.put("lNo", lNo);
		sqlSession.insert("landmarkLiked.insertLandmarkLiked", map);
		
	}

	@Override
	public int likedCheck(String id, int lNo) throws Exception {
		Map map = new HashMap();
		map.put("id", id);
		map.put("lNo", lNo);
		int count = sqlSession.selectOne("landmarkLiked.likedCnt", map);
		return count;
	}

	@Override
	public void landmarkLikedCancel(String id, int lNo) throws Exception {
		Map map = new HashMap();
		map.put("id", id);
		map.put("lNo", lNo);
		sqlSession.insert("landmarkLiked.landmarkLikedCancel", map);
		
	}

	@Override
	public List myLandLiked(String id) throws Exception {
		
		List myLandLiked = sqlSession.selectList("landmarkLiked.myLandLiked", id);
		return myLandLiked;
	}

	// 랜드마크 삭제 시 좋아요 레코드 삭제
	@Override
	public void deleteLand(int lNo) throws Exception {
		sqlSession.delete("landmarkLiked.deleteLand",lNo);
	}

	



}
