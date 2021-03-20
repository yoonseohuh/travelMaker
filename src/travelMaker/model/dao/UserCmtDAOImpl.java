package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupSpaceDTO;

@Repository
public class UserCmtDAOImpl implements UserCmtDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	//사용자가 참여중인 그룹넘버 가져오기
	@Override
	public List myGroupNo(String id) throws SQLException {
		System.out.println("dao에서 id:" +id);
		List myGroup = sqlSession.selectList("userCmt.myGroupNo", id);

		
		return myGroup;
	}

	//사용자가 참여중인 그룹의 정보 가져오기
	@Override
	public GroupSpaceDTO getMyGroupInfo(int gNo) throws SQLException {
		GroupSpaceDTO dto = sqlSession.selectOne("userCmt.getMyGroupInfo", gNo);
		System.out.println("디티오전?");
		System.out.println(dto.getSubject());
		System.out.println("안찍히니?");
		return dto;
	}

	
	
	
	
	@Override
	public int myGroupCount(String id) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}



	



}
