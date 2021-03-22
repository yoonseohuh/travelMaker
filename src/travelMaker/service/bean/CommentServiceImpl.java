package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.UserCmtDAO;
import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupSpaceDTO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private UserCmtDAO userCmtDAO = null;

	
	
	// 사용자가 참여중인 그룹번호 gNo를 보내서 해당 그룹의 정보를 한줄씩(groupSpaceDTO) 가져올것임
	public GroupSpaceDTO getGroupInfo(int num) throws SQLException{
		GroupSpaceDTO gInfo = userCmtDAO.getGroupInfo(num);
		System.out.println("마이그룹인포찍히나");
		System.out.println("개설자 아이디:" + gInfo.getId());
		
		return gInfo;
	}
		
	
	
	//사용 여행한 모든 여행그룹 가져오기
	@Override
	public List getMyGroup(String id) throws SQLException {		
		
		//사용자가 참여중에 해당하는(status=1)  groupMemberDTO ( gNo, id, genReply,status) 레코드 여러줄 가져옴
		// 그룹고유번호gNo만 가져와서 getGroupInfo메서드에 돌린 후 해당하는 그룹정보 가져올것임
		List myGroup = userCmtDAO.myGroup(id);
		System.out.println("사이즈: " + myGroup.size());
		
		
		List dtoList = new ArrayList(); //null만한거는 무슨차이일까?..
		for(int i = 0 ; i < myGroup.size(); i++) {
			//GroupSpaceDTO gInfo = getGroupInfo(((GroupMemberDTO)myGroup.get(i)).getgNo());
			dtoList.add(getGroupInfo(((GroupMemberDTO)myGroup.get(i)).getgNo()));
		}
		
		
		return dtoList;
	}
	
	
	
	
		
	

	

	
	
	
	
	
	
}
