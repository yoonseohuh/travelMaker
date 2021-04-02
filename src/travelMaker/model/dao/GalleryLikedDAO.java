package travelMaker.model.dao;

public interface GalleryLikedDAO {
	
	//사진 좋아요
	public void imgLiked(String id, int gNo, int pNo) throws Exception;
	//사진 좋아요 이미 했는지 체크
	public int likedCount(String id, int pNo) throws Exception;
	//사진 좋아요 취소
	public void imgLikedCancel(String id, int gNo, int pNo) throws Exception;
	
}
