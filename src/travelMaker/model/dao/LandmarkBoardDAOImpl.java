package travelMaker.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import travelMaker.model.dto.LandmarkBoardDTO;

@Repository
public class LandmarkBoardDAOImpl implements LandmarkBoardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public void insertLand(LandmarkBoardDTO dto) throws Exception {
		// sqlSession 불러서 insert문 ("landmarkBoard는 뒤에 sql 매퍼에 이름 붙인놈이고 insertLand는 보드dao에 만들어준 이름?? or 뒤에 인서트 id ??")
		sqlSession.insert("landmarkBoard.insertLand", dto); // 아 sql 매퍼에 landmarBoard라는 이름안에 insertLand id를 가진 놈을 부르는거구나
	}
	
	@Override
	public List getLands() throws Exception {
		List landList =  sqlSession.selectList("landmarkBoard.getLands");
		return landList;
	}

	@Override
	public void getLandOpen(int lOpen) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List myLand(String id) throws Exception{
		List myLand =  sqlSession.selectList("landmarkBoard.myLand", id);
		return myLand;
	}

	@Override
	public LandmarkBoardDTO getLand(int lNo) throws Exception {
		LandmarkBoardDTO land =  sqlSession.selectOne("landmarkBoard.getLand", lNo);
		return land;
	}
	
	public void deletemyLand(String id) throws Exception{
		sqlSession.delete("landmarkBoard.deletemyLand", id);
	}

	@Override
	public void landmarkLikedCnt(int lNo, int ud) throws Exception {
		Map map = new HashMap();
		map.put("lNo", lNo);
		map.put("ud", ud);
		sqlSession.update("landmarkBoard.landmarkLikedCnt", map);
		
	}

}
