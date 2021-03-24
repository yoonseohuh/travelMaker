package travelMaker.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserRkDTO;

@Repository
public class TmUserDAOImpl implements TmUserDAO {

	@Autowired
	private SqlSessionTemplate sqlSession = null;

	//회원 정보 insert해주는 메서드
	@Override
	public void insertMember(TmUserDTO dto) {
		sqlSession.insert("tmUser.insertMember",dto);
	}

	@Override
	public int idPwCheck(TmUserDTO dto) {
		//아이디 비밀번호 일치 하는지 확인해봐
		int result = sqlSession.selectOne("tmUser.idPwCheck",dto);
		
		return result;
	}

	@Override
	public int emailCheck(String email) {
		int result = sqlSession.selectOne("tmUser.emailCheck", email);
		
		return result;
	}

	@Override
	public TmUserDTO getMemInfo(String email) {
		TmUserDTO member =  sqlSession.selectOne("tmUser.getMemInfo", email);
		return member;
	}

	@Override
	public int idEmailCheck(TmUserDTO dto) {
		int result = sqlSession.selectOne("tmUser.idEmailCheck",dto);
		System.out.println("dao idemail" + result);
		return result;
	}

	@Override
	public void pwChange(TmUserDTO mem) {
		sqlSession.update("tmUser.pwChange",mem);
	}


	@Override
	public TmUserDTO getMember(String id) {
		TmUserDTO member = sqlSession.selectOne("tmUser.getMember", id);
		return member;
	}
 
	@Override
	public int getGender(String id) {
		int gender = -1;
		if(id!=null) {
			gender = sqlSession.selectOne("tmUser.getGender",id);
		}
		return gender;
	}

	@Override
	public void updaNick(TmUserDTO mem) {
		sqlSession.update("tmUser.updaNick",mem);
	}

	@Override
	public void changeStat(Map statMap) {
		sqlSession.update("tmUser.changeStat", statMap);
	}
	
	//멤버리스트 가져오기 (검색X)
	@Override
	public List getMembers(int startRow, int endRow) {
		Map map = new HashMap();
		map.put("start", startRow);
		map.put("end", endRow);
		List memberList =  sqlSession.selectList("tmUser.getMembers", map);
		return memberList;
	}
	
	//멤버리스트 가져오기 (아이디 검색)
	@Override
	public List getSearchMembers(int startRow, int endRow, String search) {
		Map map = new HashMap();
		map.put("start", startRow);
		map.put("end", endRow);
		map.put("search", search);
		List memberList =  sqlSession.selectList("tmUser.getSearchMembers", map);
		return memberList;
	}
	
	//검색된 멤버수 
	@Override
	public int getSearchMemberCount(String search) {
		int count = sqlSession.selectOne("tmUser.getSearchMemberCount", search);
		return count;
	}
	
	//검색 안한 멤버수
	@Override
	public int getMemberCount() {
		int count = sqlSession.selectOne("tmUser.getMemberCount");
		return count;
	}

	@Override
	public String getPosName(int posNo) {
		String pName=sqlSession.selectOne("tmUser.getPosName",posNo);
		return pName;
	}

	@Override
	public List getAllPos() {
		List posList=sqlSession.selectList("tmUser.getAllPos");
		return posList;
	}

	@Override
	public void updateMember(TmUserDTO mem) {
		sqlSession.update("tmUser.updateMember",mem);
	}

	@Override
	public List getRk() {
		List rkList = sqlSession.selectList("tmUser.getRk");
		return rkList;
	}
	

}
