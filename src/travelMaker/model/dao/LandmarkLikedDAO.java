package travelMaker.model.dao;

import java.sql.SQLException;	
import travelMaker.model.dto.LandmarkBoardDTO;

public interface LandmarkLikedDAO {

	// 랜드마크 고유번호 가져오기
	public LandmarkBoardDTO getLand(int lNo);
	// 랜드마크 좋아요 
	public void insertLandLiked(int lNo, String id) throws Exception;
	// 랜드마크 좋아요 수 올려주기
	public void addLikedCnt(int lNo, String id) throws SQLException;
	
}
