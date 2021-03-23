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
	
	// groupMember테이블에서 사용자가 참여중인 그룹 가져오기
	@Override
	public List myGroup(String id) throws SQLException {
		System.out.println("dao에서 id:" +id);
		List myGroup = sqlSession.selectList("userCmt.myGroup", id); // 그룹No list에 담아주고  서비스로 보냄
		// dto여러줄이 list myGroup에 담겨서 보내짐
		
		
		return myGroup;
	}

	
	//그룹고유번호 보내서 그룹정보 가져오기 (그룹스페이스상태 4인것들)
	@Override
	public GroupSpaceDTO getGroupInfo(int num) throws SQLException {
		
		GroupSpaceDTO gInfo = sqlSession.selectOne("userCmt.getGroupInfo", num);
		
		return gInfo;
	}

	
	
	//그룹고유번호로 참여중인 멤버 가져오기  1=> 5명..2=>2명. 리스트에 담아줌
	public List getMem(int gNo) {
		List getMem = sqlSession.selectList("userCmt.getMem",gNo);  //멤버들 아이디 리스트에 담았다
		
			
		
		return getMem;
	}
	
	
	
	public String getNickName(String id) {
		String nickName = sqlSession.selectOne("userCmt.getNickName", id);
		
		return nickName;
	}
	
	
	


}
