package travelMaker.model.dao;

import java.util.List;

public interface LandmarkLikedDAO {

	// 랜드마크 좋아요
	public void landmarkLiked(String id, int lNo) throws Exception;
	// 랜드마크 좋아요 1번만 할 수 있게
	public int likedCheck(String id, int lNo) throws Exception;
	// 랜드마크 좋아요 취소
	public void landmarkLikedCancel(String id, int lNo) throws Exception;
	// 내가 좋아요 한 랜드마크 
	public List myLandLiked(String id) throws Exception;	
	// 랜드마크 삭제 시 좋아요 레코드 삭제
	public void deleteLand(int lNo) throws Exception;
	
	
}
