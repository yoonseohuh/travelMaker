package travelMaker.model.dao;

import java.sql.SQLException;

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
		System.out.println(dto.getlName());
		System.out.println(dto.getWriter());
		sqlSession.insert("landmarkBoard.insertLand", dto);
	}

	@Override
	public LandmarkBoardDTO getLandInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void getLandOpen(int lOpen) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
