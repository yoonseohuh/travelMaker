package travelMaker.service.bean;

import java.util.Map;

import travelMaker.model.dto.GroupSpaceDTO;

public interface SharedService {

	public Map getArtilces(String pageNum) throws Exception;

	public GroupSpaceDTO getArticle(int gNo) throws Exception;
	
	// 좋아요 
	public void sharedLiked(int gNo, String id) throws Exception;
	// 좋아요 카운팅
	public void sharedLikedCnt(int gNo, int cnt) throws Exception;
	


	



}
