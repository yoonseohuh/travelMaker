package travelMaker.model.dao;

import java.util.List;

import travelMaker.model.dto.SharedLikedDTO;

public interface sharedLikedDAO {
	
	// shared 좋아요
	public void sharedLiked(int gNo, String id) throws Exception;
	// 좋아요는 한번만
	public int likedCheck(int gNo, String id) throws Exception;
	// 좋아요 취소
	public void sharedLikedCancel(int gNo, String id) throws Exception;
	// 좋아요 한 여행
	public List getSharedLiked(String id) throws Exception;
	
	
	
}
