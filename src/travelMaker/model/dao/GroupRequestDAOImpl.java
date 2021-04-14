package travelMaker.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import travelMaker.model.dto.GroupRequestDTO;

@Repository
public class GroupRequestDAOImpl implements GroupRequestDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public void applyForGroup(GroupRequestDTO dto) throws Exception {
		sqlSession.insert("groupRequest.insertRequest",dto);
	}
	
	@Override
	public List getRequests(int gNo) throws Exception {
		List list = new ArrayList();
		list = sqlSession.selectList("groupRequest.getRequests",gNo);
		return list;
	}
	
	
	//참여중인 멤버의 그룹리퀘스트 가져오기
	public GroupRequestDTO getMemRequests(int gNo, String id) {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("id", id);
		
		GroupRequestDTO memReq = sqlSession.selectOne("groupRequest.getMemRequests",map);
		
		return memReq;
	}
		
	
	
	// jbr :  신청자들 pos 카운트
	@Override
	public int posCount(int gNo, int posNo) {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("posNo", posNo);
		
		
		int posCnt = sqlSession.selectOne("groupRequest.posCount", map);
		
		return posCnt;
	}
	
	//그룹삭제할때 그룹리퀘스트 삭제
	@Override
	public void deleteGroupReq(int gNo) {
		sqlSession.delete("groupRequest.deleteGroupReq",gNo);
	}
	
}
