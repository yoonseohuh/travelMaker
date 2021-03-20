package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.UserCmtDAO;
import travelMaker.model.dto.GroupSpaceDTO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private UserCmtDAO userCmtDAO = null;

	//내가 여행한 모든 여행그룹 가져오기
	@Override
	public List getMyGroup(String id) throws SQLException {
		
		List myGroupNo = userCmtDAO.myGroupNo(id);		
		
		
		List myGroupInfo = null;
		//for(int i = 0; i < myGroupNo.size(); i++) {
		//	GroupSpaceDTO dto = userCmtDAO.getMyGroupInfo(4);
		//	myGroupInfo.add(dto);
	//	}
		
		
		
		return myGroupInfo;
	}

	

	
	
	
	
	
	
}
