package travelMaker.model.dao;

import java.util.List;

import javax.websocket.Session;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.MessageDTO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;

	//메세지 insert
	public void insertMsg(MessageDTO msgDto) {
		sqlSession.insert("message.insertMsg", msgDto);
	}
	
	//아이디 존재하는지 체크
	public int idCh(String id) {
		int result = sqlSession.selectOne("message.idCh", id);
		return result;
	}
	
	
	// 메세지 보낸사람:사용자 가져오기
	public List getSenMsg(String id) {
		List senMsgList = sqlSession.selectList("message.getSenMsg", id);
		System.out.println(senMsgList.size());
		
		return senMsgList;
	}
	
	// 메세지 받는사람:사용자 가져오기
	public List getRecMsg(String id) {
		List recMsgList = sqlSession.selectList("message.getRecMsg", id);
		
		return recMsgList;
	}

	
	// 메세지 삭제
	public int deleteMsg(int mNo) {
		sqlSession.delete("message.deleteMsg", mNo);
		System.out.println("dao들어오니" + mNo);
		int result = 1;
		
		System.out.println("dao나오니" + mNo);
		return result;
	}
	
	
	// 사용자가 받은 쪽지 카운트
	public int recMsgCnt(String id) {
		int recMsgCnt = sqlSession.selectOne("message.recMsgCnt", id);
		return recMsgCnt;
	}
	
	// 사용자가 보낸 쪽지 카운트
	public int senMsgCnt(String id) {
		int senMsgCnt = sqlSession.selectOne("message.senMsgCnt", id);
		
		return senMsgCnt;
	}	
	
}
