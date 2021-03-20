package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CommentService {
	//내가 여행한 모든 여행그룹 가져오기
	public List getMyGroup(String id) throws SQLException;
	
	
}
