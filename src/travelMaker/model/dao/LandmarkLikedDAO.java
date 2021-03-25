package travelMaker.model.dao;

import java.sql.SQLException;	
import travelMaker.model.dto.LandmarkBoardDTO;

public interface LandmarkLikedDAO {

	// 랜드마크 좋아요 
	public void insertLandLiked() throws Exception;
	// 랜드마크 좋아요 수 올려주기
	public void addLikedCnt() throws SQLException;
	// 내가 좋아요 한 랜드마크
	public void myLandLiked(String id) throws SQLException;
	
	
}
