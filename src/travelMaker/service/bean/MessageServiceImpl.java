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
	public int deleteMsg(int mNo) {
		int result = messageDAO.deleteMsg(mNo);
		
		return result;
	}
	
}
