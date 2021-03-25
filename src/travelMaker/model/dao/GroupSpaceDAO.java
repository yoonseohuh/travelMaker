package travelMaker.model.dao;

import java.util.List;
import travelMaker.model.dto.GroupSpaceDTO;

public interface GroupSpaceDAO {
	
	//개설글 작성
	public void insertMaking(GroupSpaceDTO dto) throws Exception;
	//모집 중인 게시글 개수 리턴
	public int getArticleCount() throws Exception;
	//모집 중인 게시글 중 검색 결과에 부합하는 게시글 개수 리턴
	public int getSearchArticleCount(String startD, String endD) throws Exception;
	//모집중 게시글 보여주기
	public List getArticles(int start, int end) throws Exception;
	//모집 중인 게시글 중 검색 결과에 부합하는 게시글 보여주기
	public List getSearchArticles(int start, int end, String startD, String endD) throws Exception;
	//모집 중 게시글 내용 하나 가져오기
	public GroupSpaceDTO getContent(int gNo) throws Exception;
	//모집 게시글 삭제
	public void deleteContent(int gNo) throws Exception;
	
	
}
