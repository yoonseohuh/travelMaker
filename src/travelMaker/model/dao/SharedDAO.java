package travelMaker.model.dao;

import java.util.List;

import travelMaker.model.dto.GroupSpaceDTO;

public interface SharedDAO {
	
	public List getArticles(int start, int end) throws Exception;

	public int getArticleCount();
	
	public GroupSpaceDTO getArticle(int gNo) throws Exception;
	// 조회수 +1
	public void updateReadCnt(int gNo);
	// 좋아요 +1
	public void sharedLikedCnt(int gNo, int sl) throws Exception;
	
}
