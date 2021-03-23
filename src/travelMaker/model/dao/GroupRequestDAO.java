package travelMaker.model.dao;

import travelMaker.model.dto.GroupRequestDTO;

public interface GroupRequestDAO {
	
	//참여 신청 건 insert
	public void applyForGroup(GroupRequestDTO dto) throws Exception;
	
}
