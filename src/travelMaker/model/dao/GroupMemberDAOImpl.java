package travelMaker.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupMemberDAOImpl implements GroupMemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public int getMemStatus(int gNo, String id) throws Exception {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("id", id);
		int status = -1;
		int count = sqlSession.selectOne("groupMember.getMemCnt",map);
		if(count>0) {
			status = sqlSession.selectOne("groupMember.getMemStatus",map);
		}
		return status;
	}
	
}
