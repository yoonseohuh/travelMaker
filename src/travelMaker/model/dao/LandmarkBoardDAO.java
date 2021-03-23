package travelMaker.model.dao;

import java.sql.SQLException;

import travelMaker.model.dto.LandmarkBoardDTO;

public interface LandmarkBoardDAO {
	
	public void insertLand(LandmarkBoardDTO dto) throws SQLException;

}
