package travelMaker.model.dao;

import java.util.List;

import travelMaker.model.dto.GroupRequestDTO;

public interface GroupRequestDAO {
	
	//참여 신청 건 insert
	public void applyForGroup(GroupRequestDTO dto) throws Exception;
	//그룹 신청건들 가져오기
	public List getRequests(int gNo) throws Exception;

	//참여중인 멤버의 그룹리퀘스트 가져오기
	public GroupRequestDTO getMemRequests(int gNo, String id); 
	
	// jbr :  신청자들 pos 카운트
	public int posCount(int gNo, int posNo);
	
	//그룹삭제할때 그룹리퀘스트 삭제
	public void deleteGroupReq(int gNo);

	
}
