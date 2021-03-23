package travelMaker.model.dao;

import travelMaker.model.dto.SmallPosDTO;

public interface SmallPosDAO {

	//포지션 정보 가져오기
	public SmallPosDTO getPosInfo(int posNo) throws Exception;
	
}
