package travelMaker.model.dao;


import java.util.List;

import travelMaker.model.dto.LandmarkBoardDTO;

public interface LandmarkBoardDAO {

	// 랜드마크 생성 setlikedCnt 0 으로 맞추고 
	public void insertLand(LandmarkBoardDTO dto) throws Exception; 
	// 랜드마크들 가져오기
	public List getLands() throws Exception;
	// 랜드마크 공개범위 전체공개 0, 회원공개 1
	//public void getLandOpen(int lOpen) throws Exception;
	// 내가 작성한 랜드마크
	public List myLand(String id) throws Exception;
	// 랜드마크 가져오기
	public LandmarkBoardDTO getLand(int lNo) throws Exception;
	// 랜드마크 삭제
	public void deletemyLand(int lNo) throws Exception;
	// 랜드마크 좋아요 하나 올려주기
	public void landmarkLikedCnt(int lNo, int ud) throws Exception;
	


}
