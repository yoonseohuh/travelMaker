package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.LandmarkBoardDAO;
import travelMaker.model.dto.LandmarkBoardDTO;

@Service
public class LandmarkServiceImpl implements LandmarkService{
	
	
	@Autowired
	private LandmarkBoardDAO landmarkBoardDAO = null;
	
	@Override
	public void insertLand(LandmarkBoardDTO dto) throws SQLException {
		// 오토와이어드 해놓은 landmarkBoardDAO를 불러서 고놈이 가지고 있는 insertLand를 한다.
		landmarkBoardDAO.insertLand(dto);
	}
	
	@Override	
	public List getLand() throws SQLException{
		List land = landmarkBoardDAO.getLand();
		return land;
	}

	@Override
	public void addLikedCnt(int lNo, String id) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getLandOpen(int lOpen) throws SQLException {
		// TODO Auto-generated method stub
		
	}


	
}
