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
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserCmtDTO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private UserCmtDAO userCmtDAO = null;

	
	
	// 사용자가 참여중인 그룹스페이스를 한줄씩(groupSpaceDTO) 가져올것임
	public GroupSpaceDTO getGroupInfo(int num) throws SQLException{
		GroupSpaceDTO gInfo = userCmtDAO.getGroupInfo(num);
		System.out.println("서비스에서 그룹명이 안뜨나? " + gInfo.getSubject());
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
			System.out.println("마이그룹사이즈" + myGroup.size());
			System.out.println(i + "번쨰 : " + ((GroupMemberDTO)myGroup.get(i)).getgNo());
			  GroupSpaceDTO gInfo = getGroupInfo(((GroupMemberDTO)myGroup.get(i)).getgNo());
			  if(gInfo.getStatus() >=0 ) { //GroupSpace 여행상태가 4인것들만 담는다
			
				  dtoList.add(gInfo);
				  
			  }	
		}
		System.out.println("디티오리스트" + dtoList);
		return dtoList;
	}
	
	
	//사용자아이디가 참여중인 그룹넘들 가져오기
	public List getGroupNum(String id) throws SQLException{
		//그룹멤버dto담겨있음
		List myGroup = userCmtDAO.myGroup(id);
	
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
		
		List comMemList = new ArrayList();
		
		List fin = new ArrayList();
		
		
		for(int i = 0; i < myG.size(); i++) {
			memList = userCmtDAO.getMem(((GroupMemberDTO)myG.get(i)).getgNo());   //가입된 그룹번호를 하나씩 크게 돌려서 그 그룹에 해당하는 멤버들 목록에 담음?
			System.out.println(" 그룹번호" + ((GroupMemberDTO)myG.get(i)).getgNo());
			//코멘트 남겼는지 확인할꺼
			for(int j = 0; j < memList.size(); j++) {
				int result = userCmtDAO.chComment(id,((GroupMemberDTO)memList.get(j)).getId(),((GroupMemberDTO)myG.get(i)).getgNo());
				
				// 밑에서 사용자아이디인지 체크할 변수
				String chId =((GroupMemberDTO)memList.get(j)).getId();
				System.out.println(chId);
				//System.out.println(" 그룹목록"+i +" : " + ((GroupMemberDTO)myG.get(i)).getgNo());
				
				System.out.println("result값" + result);
				
					if(result == 0 && !chId.equals(id)) {
						comMemList.add(((GroupMemberDTO)memList.get(j)));
						//System.out.println("멤버목록" + j + " : " + ((GroupMemberDTO)memList.get(j)).getId());
					}
				
			
			}//작은  for문 memList돌린거
			
			
		}//큰 for문 myG돌린거
		//fin.add(comMemList);

		
		return comMemList;
	}
	
	
	
	
	
	//코멘트 insert문
	public int insertCom(String id, String groupNum, String groupMem, String comment) {
		
		int gNo = Integer.parseInt(groupNum);
		userCmtDAO.insertCom(id, gNo, groupMem, comment);
		int result = 1;
		
		return result;
	}
	
	
	// 사용자 여행그룹 갯수 count
	public int countGroup(String id) {
		int count = userCmtDAO.countGroup(id);

		return count;
	}
	
	
	// 코멘트DTO가져오 받는사람 사용자
	public List comRecUser(String id) throws SQLException {
	
		
		List comRecUser = new ArrayList();
	
		
		comRecUser = userCmtDAO.comRecUser(id);
	
		System.out.println("comRecUser" + comRecUser.size());
		return comRecUser;
	}
	
	// 보낸사람이 사용자인 코멘트DTO가져오기 
	public List comSenUser(String id) throws SQLException {
		
		List comSenUser = new ArrayList();
		comSenUser= userCmtDAO.comSenUser(id);
		System.out.println("comSenUser :" + comSenUser.size());
			
		return comSenUser;
	}
	
	/* 없애도 되는듯?.. 주석해도 에러안뜬다
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
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
