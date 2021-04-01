package travelMaker.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.ChattingDTO;

@Repository
public class ChattingDAOImpl implements ChattingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	//채팅 입력
	@Override
	public void sendChat(int gNo, String writer, String cont) throws Exception {
		Map map = new HashMap();
		map.put("gNo",gNo);
		map.put("writer",writer);
		map.put("cont",cont);
		sqlSession.insert("chatting.sendChat",map);
	}
	
	//채팅 내용 출력
	@Override
	public List getChats(int gNo) throws Exception {
		List chatList = sqlSession.selectList("chatting.getChats",gNo);
		return chatList;
	}
	
	//그룹의 가장 마지막 채팅 가져오기
	@Override
	public ChattingDTO getLastChat(int gNo) throws Exception {
		ChattingDTO last = sqlSession.selectOne("chatting.getLastChat",gNo);
		return last;
	}
	
	
}
