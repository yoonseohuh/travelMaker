package travelMaker.model.dao;

import java.util.List;

import travelMaker.model.dto.GroupRequestDTO;

public interface GroupRequestDAO {
	
	//참여 신청 건 insert
	public void applyForGroup(GroupRequestDTO dto) throws Exception;
	//그룹 신청건들 가져오기
	public List getRequests(int gNo) throws Exception;
	
	// jbr :  신청자들 pos 카운트
	public int posCount(int gNo, int posNo);
	
}
