package travelMaker.model.dao;

import java.util.List;

import travelMaker.model.dto.GroupSpaceDTO;

public interface SharedDAO {
	
	public List getArticles(int start, int end) throws Exception;

	public int getArticleCount();

	public GroupSpaceDTO getArticle(int num) throws Exception;

	

}
