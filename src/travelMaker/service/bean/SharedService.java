package travelMaker.service.bean;

import java.util.Map;

import travelMaker.model.dto.GroupSpaceDTO;

public interface SharedService {

	public Map getArtilces(String pageNum) throws Exception;

	public GroupSpaceDTO getArticle(int gNo) throws Exception;
	
	public void sharedLiked(int gNo, String id) throws Exception;


	



}
