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
	

	public String nickName(String id) throws SQLException{
		String nickName = userCmtDAO.getNickName(id);
		System.out.println("nickName" + nickName);
		return nickName;
	}

	//아이디 닉넴으로 바꿔서 리스트담음 
	public List idToNick(List gMem) throws SQLException{
		for(int i = 0;  i < gMem.size(); i++) {
			userCmtDAO.getNickName(((GroupMemberDTO)gMem.get(i)).getId());
		}
		
		
		return null;
	}
	
	
	//같은 여행그룹의 tmUSER 정보 담기  (필요에따라 빼써라)
	public List groupUser(String id) throws SQLException {
		
		//그룹멤버dto담겨있음 gNo뽑아야함
		List myG = getGroupNum(id);
		System.out.println("마이지사이즈" + myG.size());
		//1.gno하나씩 뽑아서 멤버들 아이디 담음
		List memIdList = new ArrayList();
		List nickList = new ArrayList();
		
		for(int i = 0; i < myG.size(); i++) {
			//gMem이 리스트에 담김 테스트1,2,3,등)
			List gMem = (getGMem(((GroupMemberDTO)myG.get(i)).getgNo()));
			System.out.println("마이지멤사이즈" + gMem.size());
			System.out.println("큰포문" + i);

			
			
			for(int j = 0; j < gMem.size(); j++) {
				System.out.println("작은포문" + j);
				
				System.out.println(nickName(((GroupMemberDTO)gMem.get(j)).getId()));
				nickList.add(j, nickName(((GroupMemberDTO)gMem.get(j)).getId()));
			//	String nn =nickName(((GroupMemberDTO)gMem.get(j)).getId());
			//	System.out.println("이중포문 나옵니까" + j);
				System.out.println("닉리스트" + nickList);
				
			}
			
		}
		
		System.out.println("닉넴리스트" + nickList.size());
		
		
		return nickList;
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



	@Override
	public String nick(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	
		
	

	

	
	
	
	
	
	
}
