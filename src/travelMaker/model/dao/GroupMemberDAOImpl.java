package travelMaker.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.GroupMemberDTO;

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

	@Override
	public void insertMemToGroup(GroupMemberDTO applicant) throws Exception {
		sqlSession.insert("groupMember.insertMemToGroup",applicant);
	}
	
	@Override
	public List getMyGroups(String id, int status) throws Exception {
		List list = new ArrayList();
		Map map = new HashMap();
		map.put("id",id);
		map.put("status",status);
		list = sqlSession.selectList("groupMember.getMyGroups", map);
		return list;
	}
	
	@Override
	public List getMembers(int gNo) throws Exception {
		List list = new ArrayList();
		list = sqlSession.selectList("groupMember.getMembers",gNo);
		return list;
	}
	
	@Override
	public void changeMemStatus(String id, int gNo, int status) throws Exception {
		Map map = new HashMap();
		map.put("id",id);
		map.put("gNo",gNo);
		map.put("status",status);
		sqlSession.update("groupMember.changeMemStatus",map);
	}
	
	//그룹삭제할때 그룹멤버 삭제
	@Override
	public void deleteGroupMem(int gNo) {
		sqlSession.delete("groupMember.deleteGroupMem", gNo);
	}
	
	
	// 본인이 총평 썼는지 확인
	public GroupMemberDTO chReview(int gNo, String id) {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("id", id);
		System.out.println("여기들옴???");
		GroupMemberDTO dto  = sqlSession.selectOne("groupMember.chReview", map);
		System.out.println("오냐");
		return dto;
	}
		
}
