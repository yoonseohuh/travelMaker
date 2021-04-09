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
		sqlSession.insert("landmarkBoard.insertLand", dto);
	}
	
	@Override
	public List getLands() throws Exception {
		List landList =  sqlSession.selectList("landmarkBoard.getLands");
		return landList;
	}

	@Override
	public List myLand(String id) throws Exception{
		List myLand =  sqlSession.selectList("landmarkBoard.myLand", id);
		return myLand;
	}

	@Override
	public LandmarkBoardDTO getLand(int lNo) throws Exception {
		LandmarkBoardDTO land = sqlSession.selectOne("landmarkBoard.getLand", lNo);
		return land;
	}
	
	public void deletemyLand(int lNo) throws Exception{
		sqlSession.delete("landmarkBoard.deletemyLand", lNo);
	}

	@Override
	public void landmarkLikedCnt(int lNo, int ud) throws Exception {
		Map map = new HashMap();
		map.put("lNo", lNo);
		map.put("ud", ud);
		sqlSession.update("landmarkBoard.landmarkLikedCnt", map);
	}

}
