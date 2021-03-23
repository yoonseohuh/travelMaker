package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupSpaceDTO;

public interface CommentService {
	
	//그룹정보 가져오기 (그룹스페이스에서 상태4)
	public GroupSpaceDTO getGroupInfo(int num) throws SQLException;
	
	//내가 여행한 모든 여행그룹 가져오기
	public List getMyGroup(String id) throws SQLException;
	
	
	//닉넴
	public List gMem(String id) throws SQLException;
	
	

	//사용자아이디가 참여중인 그룹넘들 가져오기
	public List getGroupNum(String id) throws SQLException;

	
	////같은 여행그룹의 tmUSER 정보 담기  (필요에따라 빼써라)
	public List groupUser(String id) throws SQLException;
	
	
	//닉넴한개
	public String nick(String id) throws SQLException;
	
	
	//아이디 닉넴으로 바꿔서 리스트담음 
	public List idToNick(List gMem) throws SQLException;
			
	
}