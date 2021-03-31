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
	
	// jbr :  신청자들 pos 카운트
	@Override
	public int posCount(int gNo, int posNo) {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("posNo", posNo);
		
		
		int posCnt = sqlSession.selectOne("groupRequest.posCount", map);
		
		return posCnt;
	}
	
}
