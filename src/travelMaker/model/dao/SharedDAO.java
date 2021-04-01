package travelMaker.model.dao;

import java.util.List;

public interface SharedDAO {
	
	public List getArticles(int start, int end) throws Exception;

	public int getArticleCount();

	

}
