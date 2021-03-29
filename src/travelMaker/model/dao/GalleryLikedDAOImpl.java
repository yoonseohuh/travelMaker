package travelMaker.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GalleryLikedDAOImpl implements GalleryLikedDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	//사진 좋아요
	@Override
	public void imgLiked(String id, int gNo, int pNo) throws Exception {
		Map map = new HashMap();
		map.put("id", id);
		map.put("gNo", gNo);
		map.put("pNo", pNo);		
		sqlSession.insert("galleryLiked.insertImgLiked",map);
	}
	
	
}
