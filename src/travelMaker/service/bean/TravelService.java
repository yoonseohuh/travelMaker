package travelMaker.service.bean;

import java.util.Map;
import travelMaker.model.dto.GroupSpaceDTO;

public interface TravelService {

	//개설글 작성
	public void insertMaking(GroupSpaceDTO dto) throws Exception;
	//개설글 전부 가져오기
	public Map getArticles(String pageNum) throws Exception;
	//개설글 하나 가져오기
	public GroupSpaceDTO getContent(int gNo) throws Exception;
	//id 주고 성별 가져오기
	public int getGender(String id) throws Exception;
	//모집 게시글 삭제
	public void deleteContent(int gNo) throws Exception;
}
