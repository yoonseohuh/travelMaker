package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import travelMaker.model.dto.LandmarkBoardDTO;

@Repository
public class LandmarkBoardDAOImpl implements LandmarkBoardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public void insertLand(LandmarkBoardDTO dto) throws SQLException {
		// sqlSession 불러서 insert문 ("landmarkBoard는 뒤에 sql 매퍼에 이름 붙인놈이고 insertLand는 보드dao에 만들어준 이름?? or 뒤에 인서트 id ??")
		sqlSession.insert("landmarkBoard.insertLand", dto); // 아 sql 매퍼에 landmarBoard라는 이름안에 insertLand id를 가진 놈을 부르는거구나
	}
	
	@Override
	public List getLands() throws SQLException {
		List land =  sqlSession.selectList("landmarkBoard.getLands");
		return land;
	}

	@Override
	public void getLandOpen(int lOpen) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List myLand(String id) throws SQLException{
		List myLand =  sqlSession.selectList("landmarkBoard.myLand", id);
		return myLand;
	}

	@Override
	public LandmarkBoardDTO getLand(int lNo) throws SQLException {
		 LandmarkBoardDTO land  = sqlSession.selectOne("landmarkBoard.getLand", lNo);
		return land;
	}

}
