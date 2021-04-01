package travelMaker.model.dao;

import java.util.List;

import travelMaker.model.dto.GroupRequestDTO;
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
	//참여 인원수 카운트 증감시키기
	public void updateActNum(int gNo, int num) throws Exception;	
	
	//jbr 그룹관리 : 전체 그룹목록 가져오기
	public List<GroupSpaceDTO> groupAllList();
	// jbr 그룹관리 : 그룹 개수 가져오기
	public int groupCnt();
	//jbr 검색결과 개수 카운트
	public int searchGroupCtn(String sel, String search);
	//jbr 검색결과 리스트 가져오기
	public List searchGroupList(String sel, String search);

	//그룹 상태 변경
	public void changeGrpStatus(int gNo, int status) throws Exception;
	
}
