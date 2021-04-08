package travelMaker.service.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.MessageDAO;
import travelMaker.model.dto.MessageDTO;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDAO messageDAO = null;

	
	//쪽지 insert
	public int insertMsg(MessageDTO msgDto) {
		System.out.println("받는사람아이디" + msgDto.getReceiver());
		int result = idCh(msgDto.getReceiver());
		
		if(result == 1) {
			messageDAO.insertMsg(msgDto);
		}
		
		return result;
	}
	
	//아이디 존재하는지 체크
	public int idCh(String id) {
		int result = messageDAO.idCh(id);
		return result;
	}
	
	
	// 메세지 보낸사람:사용자 가져오기
	public List getSenMsg(String id) {
		List senMsgList = messageDAO.getSenMsg(id);
		
		return senMsgList;
	}
	
	// 메세지 받는사람:사용자 가져오기
	public List getRecMsg(String id) {
		List recMsgList = messageDAO.getRecMsg(id);
		
		return recMsgList;
	}
	
	// 메세지 삭제
	public int deleteMsg(String[] msgNo) {
		
		
		for(int i=0; i < msgNo.length; i++) {
			System.out.println("서비스" + Integer.parseInt(msgNo[i]) );
			 messageDAO.deleteMsg(Integer.parseInt(msgNo[i]));
		}
	
		int result = 1;
		//int result = messageDAO.deleteMsg(msgNo);
		
		return result;
	}
	
	// 사용자가 받은 쪽지 카운트
	public int recMsgCnt(String id) {
		int recMsgCnt = messageDAO.recMsgCnt(id);
		return recMsgCnt;		
	}
	
	// 사용자가 보낸 쪽지 카운트
	public int senMsgCnt(String id) {
		int senMsgCnt = messageDAO.senMsgCnt(id);
		
		return senMsgCnt;
	}
	
}
