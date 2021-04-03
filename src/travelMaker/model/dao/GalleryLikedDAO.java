package travelMaker.model.dao;

import java.util.List;

public interface GalleryLikedDAO {
	
	//사진 좋아요
	public void imgLiked(String id, int gNo, int pNo) throws Exception;
	//사진 좋아요 이미 했는지 체크
	public int likedCount(String id, int pNo) throws Exception;
	//사진 좋아요 취소
	public void imgLikedCancel(String id, int gNo, int pNo) throws Exception;
	//특정 그룹 갤러리에서 id가 좋아요 한 모든 사진 리스트
	public List likedImgList(int gNo, String id) throws Exception;
	
}
