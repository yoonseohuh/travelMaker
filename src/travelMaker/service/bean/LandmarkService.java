package travelMaker.service.bean;

import java.sql.SQLException;		
import java.util.Map;

import travelMaker.model.dto.LandmarkBoardDTO;


public interface LandmarkService {
	
	// 랜드마크 생성 setlikedCnt 0 으로 맞추고 
	public void insertLand(LandmarkBoardDTO dto) throws SQLException;
	// 랜드마크 가져오기
	public LandmarkBoardDTO getLandInfo();
	// 랜드마크 전체 가져오기
	public Map getLands() throws SQLException;
	// 랜드마크 좋아요
	public String landmarkLiked();
	// 랜드마크 좋아요 수 올려주기
	public void addLikedCnt(int lNo, String id) throws SQLException;
	// 랜드마크 공개범위 전체공개 0, 회원공개 1
	public void getLandOpen(int lOpen) throws SQLException;
	
	
	
}
