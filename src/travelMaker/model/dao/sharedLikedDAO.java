package travelMaker.model.dao;

public interface sharedLikedDAO {
	
	// shared 좋아요
	public void sharedLiked(int gNo, String id) throws Exception;
	// 좋아요는 한번만
	public int likedCheck(int gNo, String id) throws Exception;
	// 좋아요 취소
	public void sharedLikedCancel(int gNo, String id) throws Exception;
	
}
