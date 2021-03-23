package travelMaker.service.bean;

import java.sql.SQLException;

import travelMaker.model.dto.LandmarkBoardDTO;

public interface LandmarkService {
	
	// 랜드마크 생성
	public void insertLand(LandmarkBoardDTO dto) throws SQLException;
	// 랜드마크 가져오기
	public LandmarkBoardDTO getLandInfo();
}
