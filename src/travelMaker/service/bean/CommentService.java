package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import travelMaker.model.dto.GroupSpaceDTO;

public interface CommentService {
	
	//그룹정보 가져오기 (그룹스페이스에서 상태4)
	public GroupSpaceDTO getGroupInfo(int num) throws SQLException;
	
	//내가 여행한 모든 여행그룹 가져오기
	public List getMyGroup(String id) throws SQLException;
	
	
	
	
}
