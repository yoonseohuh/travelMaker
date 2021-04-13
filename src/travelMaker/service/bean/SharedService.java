package travelMaker.service.bean;

import java.util.List;
import java.util.Map;

import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.SharedLikedDTO;

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
	void sharedLikedCancel(int gNo, String id) throws Exception;
	// 좋아요 한 여행 리스트
	public List getSharedLiked(String id) throws Exception;
	
	

	
	


}
