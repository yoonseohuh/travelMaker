package travelMaker.service.bean;

import java.util.List;

import travelMaker.model.dto.MessageDTO;

public interface MessageService {
	
	//쪽지 insert
	public int insertMsg(MessageDTO msgDto);
	
	
	//아이디 존재하는지 체크
	public int idCh(String id);
	
	// 메세지 보낸사람:사용자 가져오기
	public List getSenMsg(String id);
	
	// 메세지 받는사람:사용자 가져오기
	public List getRecMsg(String id);
	
	// 메세지 삭제
	public int deleteMsg(String[] msgNo);
	
	// 사용자가 받은 쪽지 카운트
	public int recMsgCnt(String id) ;
	
	// 사용자가 보낸 쪽지 카운트
	public int senMsgCnt(String id);

}
