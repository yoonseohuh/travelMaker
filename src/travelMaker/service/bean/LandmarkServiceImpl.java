package travelMaker.service.bean;

import java.sql.SQLException;

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
		landmarkBoardDAO.insertLand(dto);
	}

	@Override
	public LandmarkBoardDTO getLandInfo() {
		// TODO Auto-generated method stub
		return null;
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
