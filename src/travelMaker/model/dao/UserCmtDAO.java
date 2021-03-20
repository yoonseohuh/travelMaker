package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.List;

import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupSpaceDTO;

public interface UserCmtDAO {
	
	
	//사용자가 참여중인 그룹넘버 가져오기
	public List myGroupNo(String id) throws SQLException;
	
	//사용자가 참여중인 그룹의 정보 가져오기
	public GroupSpaceDTO getMyGroupInfo(int gNo) throws SQLException;

	//내가 여행한 목록 갯수 리턴
	public int myGroupCount(String id) throws SQLException;
	
}

