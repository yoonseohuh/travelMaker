package travelMaker.service.bean;

import java.util.Map;
import travelMaker.model.dto.GroupSpaceDTO;

public interface TravelService {

	//개설글 작성
	public void insertMaking(GroupSpaceDTO dto) throws Exception;
	//개설글 전부 가져오기
	public Map getArticles(String pageNum) throws Exception;
	
	
}
