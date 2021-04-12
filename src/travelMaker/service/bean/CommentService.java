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
	
	// 그그룹넘에 해당하는 사람들 가져오기
	public List getGMem(int gNo) throws SQLException;
	
	
	 // 코멘트 전용..그룹멤버들
	public List getCmtGMem(int gNo);
	
	//코멘트에서 사용할 여행목록
	public List cmtGroup(String id)throws SQLException;
	
	//그룹인원확인
	public int groupMemCnt(int gNo);
	
	

	//사용자아이디가 참여중인 그룹넘들 가져오기
	public List getGroupNum(String id) throws SQLException;

	
	////같은 여행그룹의 tmUSER 정보 담기  (필요에따라 빼써라)
	public List groupUser(String id) throws SQLException;
	
	//코멘트 insert문
	public int insertCom(String id, String groupNum, String groupMem, String comment);
	
	
	// 사용자 여행그룹 갯수 count
	public int countGroup(String id);
	
	// 받는사람이 사용자인 코멘트DTO가져오기 
	public List comRecUser(String id) throws SQLException;
			
	// 보낸사람이 사용자인 코멘트DTO가져오기 
	public List comSenUser(String id) throws SQLException;
	
	/*
	//코멘트작성을위한 여행목록
	public List getCmtGroup(String id)throws SQLException;
	*/
	
}