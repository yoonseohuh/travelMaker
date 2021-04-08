package travelMaker.model.dao;

import java.util.List;

import travelMaker.model.dto.GroupSpaceDTO;

public interface SharedDAO {
	
	public List getArticles(int start, int end) throws Exception;

	public int getArticleCount();

	public GroupSpaceDTO getArticle(int gNo) throws Exception;

	public void updateReadCnt(int gNo);

	public void sharedLiked(int gNo, String id);

	public void sharedlikedCnt(int gNo, int i);



	

}
