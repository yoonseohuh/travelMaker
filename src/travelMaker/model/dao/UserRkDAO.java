package travelMaker.model.dao;

import travelMaker.model.dto.UserRkDTO;

public interface UserRkDAO {
	
	//랭크 번호 주고 랭크 정보 가져오기
	public UserRkDTO getRkInfo(int rkNo) throws Exception;
	
}
