package travelMaker.service.bean;

import java.util.Map;

import travelMaker.model.dto.GroupSpaceDTO;

public interface SharedService {
	// shared 가져오기
	public Map getArtilces(String pageNum) throws Exception;
	// shared 하나 가져오기
	public GroupSpaceDTO getArticle(int gNo) throws Exception;
	// shared 좋아요
	public void sharedLiked(int gNo, String id) throws Exception;
	// shared 좋아요 한번만
	public int likedCheck(int gNo, String id) throws Exception;
	// 좋아요 취소
	public void sharedLikedCancel(int gNo, String id) throws Exception;
	


}
