package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.List;

import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupSpaceDTO;

public interface UserCmtDAO {
	
	
	//사용자가 참여중인 그룹넘버 가져오기
	public List myGroup(String id) throws SQLException;
	
	//그룹고유번호 보내서 그룹정보 가져오기
	public GroupSpaceDTO getGroupInfo(int num) throws SQLException;


	//그룹고유번호로 참여중인 멤버 가져오기
	public List getMem(int gNo) ;
	
	//아이디보내서 닉네임 가져오기
	public String getNickName(String id);
		

}

