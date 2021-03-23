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

	
	
	// 사용자가 참여중인 그룹스페이스를 한줄씩(groupSpaceDTO) 가져올것임
	public GroupSpaceDTO getGroupInfo(int num) throws SQLException{
		GroupSpaceDTO gInfo = userCmtDAO.getGroupInfo(num);
		
		return gInfo;
	}
		
	
	
	//사용자가 여행한 모든 여행그룹 가져오기
	@Override
	public List getMyGroup(String id) throws SQLException {		
		
		//사용자가 참여중에 해당하는(status=1)  groupMemberDTO ( gNo, id, genReply,status) 레코드 여러줄 가져옴
		// 그룹고유번호gNo만 가져와서 getGroupInfo메서드에 돌린 후 해당하는 그룹정보 가져올것임
		List myGroup = userCmtDAO.myGroup(id);

		
		List dtoList = new ArrayList(); //null만한거는 무슨차이일까?..
		for(int i = 0 ; i < myGroup.size(); i++) {
			dtoList.add(getGroupInfo(((GroupMemberDTO)myGroup.get(i)).getgNo()));
		}
		
		
		return dtoList;
	}
	
	
	//사용자아이디가 참여중인 그룹넘들 가져오기
	public List getGroupNum(String id) throws SQLException{
		//그룹멤버dto담겨있음
		System.out.println("겟그룹넘전");
		List myGroup = userCmtDAO.myGroup(id);
		System.out.println("겟그룹넘후");
	
		return myGroup;
	}
	
	
	// 그그룹넘에 해당하는 사람들 가져오기
	public List getGMem(int gNo) throws SQLException{
		List gMem = userCmtDAO.getMem(gNo);
		return gMem;
	}
	


	
	
	//같은 여행그룹의 tmUSER 정보 담기  (필요에따라 빼써라)
	public List groupUser(String id) throws SQLException {
		
		//그룹멤버dto담겨있음 gNo뽑아야함
		List myG = getGroupNum(id);  //사용자가 가입된 그룹리스트
		System.out.println("마이지사이즈" + myG.size());
		
		//1.gno하나씩 뽑아서 그그룹에 해당하는 멤버들  닉네임담음
		List memList = new ArrayList();
		for(int i = 0; i < myG.size(); i++) {
			memList = userCmtDAO.getMem(((GroupMemberDTO)myG.get(i)).getgNo());
		}
		
		//그룹넘 하나씩 보내서 멤버들 닉네임 가져온다
	
			
		
		
		return memList;
	}
	
	
	
	

	
	@Override
	public List gMem(String id) throws SQLException{
		List group = userCmtDAO.myGroup(id);
		System.out.println(((GroupMemberDTO)group.get(0)).getgNo());
		
		List gMemList = new ArrayList();
		
		for(int i = 0; i < group.size(); i++) {
			
			//사용자가 참여중인 그룹 넘 보냄
			userCmtDAO.getMem(((GroupMemberDTO)group.get(i)).getgNo());
			 
			 
		}
		
		
		
		
		return group;
	}




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
