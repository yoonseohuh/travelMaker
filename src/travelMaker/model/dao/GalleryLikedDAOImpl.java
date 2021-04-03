package travelMaker.model.dao;

import java.util.HashMap;
import java.util.List;
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
	
	//사진 좋아요 이미 했는지 체크
	@Override
	public int likedCount(String id, int pNo) throws Exception {
		Map map = new HashMap();
		map.put("id",id);
		map.put("pNo",pNo);
		int count = sqlSession.selectOne("galleryLiked.likedCount", map);
		return count;
	}
	
	//사진 좋아요 취소
	@Override
	public void imgLikedCancel(String id, int gNo, int pNo) throws Exception {
		Map map = new HashMap();
		map.put("id", id);
		map.put("gNo", gNo);
		map.put("pNo", pNo);		
		sqlSession.insert("galleryLiked.imgLikedCancel",map);
	}
	
	//특정 그룹 갤러리에서 id가 좋아요 한 모든 사진 리스트
	@Override
	public List likedImgList(int gNo, String id) throws Exception {
		Map map = new HashMap();
		map.put("id", id);
		map.put("gNo", gNo);
		List list = sqlSession.selectList("galleryLiked.likedImgList",map);
		return list;
	}
	
}
