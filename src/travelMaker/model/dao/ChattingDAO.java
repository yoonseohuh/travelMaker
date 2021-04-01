package travelMaker.model.dao;

import java.util.List;

import travelMaker.model.dto.ChattingDTO;

public interface ChattingDAO {

	//채팅 입력
	public void sendChat(int gNo, String writer, String cont) throws Exception;
	//채팅 내용 출력
	public List getChats(int gNo) throws Exception;
	//그룹의 가장 마지막 채팅 가져오기
	public ChattingDTO getLastChat(int gNo) throws Exception;
	
}
