package travelMaker.model.dao;

import java.sql.SQLException;	
import travelMaker.model.dto.LandmarkBoardDTO;

public interface LandmarkBoardDAO {

	// 랜드마크 생성 setlikedCnt 0 으로 맞추고 
	public void insertLand(LandmarkBoardDTO dto) throws SQLException;
	// 랜드마크 가져오기
	public LandmarkBoardDTO getLandInfo();
	// 랜드마크 공개범위 전체공개 0, 회원공개 1
	public void getLandOpen(int lOpen) throws SQLException;
	// 랜드마크 x 값 map??
	// 랜드마크 y 값
		
}
