package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.stereotype.Repository;

import travelMaker.model.dto.LandmarkBoardDTO;

@Repository
public class LandmarkBoardDAOImpl implements LandmarkBoardDAO{

	@Override
	public void insertLand(LandmarkBoardDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		
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
	public void getLandOpen(int lOpen) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
