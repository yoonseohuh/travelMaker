package travelMaker.service.bean;

import java.util.List;

import travelMaker.model.dto.LandmarkBoardDTO;


public interface LandmarkService {
	
	// 랜드마크 생성 setlikedCnt 0 으로 맞추고 
	public void insertLand(LandmarkBoardDTO dto) throws Exception;
	// 랜드마크 가져오기  (고유번호, 작성자, 장소명, 유형, 주소, 소개, 공개범위, x,y값을 받아야 할텐데) 
	public List getLands() throws Exception;
	// 하나의 랜드마크 가져오기
	public LandmarkBoardDTO getLand(int lNo) throws Exception;
	// 랜드마크 공개범위 전체공개 0, 회원공개 1
	// public void getLandOpen() throws Exception;
	// 내가 작성한 랜드마크
	public 	List myLand(String id) throws Exception;
	// 랜드마크 삭제
	public void deleteMyLand(int lNo) throws Exception;
	// 랜드마크 좋아요
	public void landmarkLiked(String id, int lNo) throws Exception;
	// 랜드마크 좋아요 1번만 할 수 있게
	public int likedCheck(String id, int lNo) throws Exception;
	// 랜드마크 좋아요 취소
	public void landmarkLikedCancel(String id, int lNo) throws Exception;
	// 내가 좋아요 한 랜드마크 
	public List myLandLiked(String id) throws Exception;

	



	




	
	
	
}
