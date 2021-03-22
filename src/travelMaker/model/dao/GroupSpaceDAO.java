package travelMaker.model.dao;

import java.util.List;
import travelMaker.model.dto.GroupSpaceDTO;

public interface GroupSpaceDAO {
	
	//개설글 작성
	public void insertMaking(GroupSpaceDTO dto) throws Exception;
	//모집 중인 게시글 개수 리턴
	public int getArticleCount() throws Exception;
	//모집중 게시글 보여주기
	public List getArticles(int start, int end) throws Exception;
	
}
