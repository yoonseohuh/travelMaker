package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.stereotype.Service;

import travelMaker.model.dto.LandmarkBoardDTO;

@Service
public class LandmarkServiceImpl implements LandmarkService{

	@Override
	public void insertLand(LandmarkBoardDTO dto) throws SQLException {
		
		
	}

	@Override
	public LandmarkBoardDTO getLandInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map getLands() throws SQLException {
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
