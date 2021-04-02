package travelMaker.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.GalleryDTO;

@Repository
public class GalleryDAOImpl implements GalleryDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	//갤러리 이미지 업로드
	@Override
	public void uploadImage(GalleryDTO dto) throws Exception {
		sqlSession.insert("gallery.uploadImage",dto);
	}
	
	//그룹 갤러리 이미지들 가져오기
	@Override
	public List getGroupImgs(int gNo) throws Exception {
		List list = new ArrayList();
		list = sqlSession.selectList("gallery.getGroupImgs",gNo);
		return list;
	}
	
	//사진 좋아요 수 1 증가 혹은 1 감소
	@Override
	public void updateLikedCnt(int pNo, int yn) throws Exception {
		Map map = new HashMap();
		map.put("pNo",pNo);
		map.put("yn",yn);
		sqlSession.update("gallery.updateLikedCnt",map);
	}
	
}
