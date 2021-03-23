package travelMaker.service.bean;

import java.sql.SQLException;

import travelMaker.model.dto.LandmarkBoardDTO;

public interface LandmarkService {
	
	public void insertLand(LandmarkBoardDTO dto) throws SQLException;

}
