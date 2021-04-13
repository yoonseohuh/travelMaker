package travelMaker.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.SmallPosDTO;
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

	@Override
	public void insertRank(UserRkDTO rkdto) {
		sqlSession.insert("tmUser.insertRank", rkdto);
	}

	@Override
	public UserRkDTO getRkInfo(int rkNo) {
		UserRkDTO rdto = sqlSession.selectOne("tmUser.getRkInfo", rkNo);
		return rdto;
	}

	@Override
	public void updateRank(UserRkDTO rdto) {
		sqlSession.update("tmUser.updateRank", rdto);
	}

	@Override
	public void deleteRk(String rkNo) {
		sqlSession.delete("tmUser.deleteRk",rkNo);
	}

	@Override
	public List getSPos() {
		List sPosList = sqlSession.selectList("tmUser.getSPos");
		return sPosList;
	}

	@Override
	public int getPosCount() {
		int count =sqlSession.selectOne("tmUser.getPosCount");
		return count;
	}
	//start, end 주고 spos 긁어오기 
	@Override
	public List getPosList(int start, int end) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List sPosList = sqlSession.selectList("tmUser.getPosList", map);
		return sPosList;
	}

	@Override
	public void addSPos(SmallPosDTO spdto) {
		sqlSession.insert("tmUser.addSPos", spdto);
	}
	
	//포지션 한 줄 정보가져오기 
	@Override
	public SmallPosDTO getSPosInfo(int posNo) {
		SmallPosDTO spdto = sqlSession.selectOne("tmUser.getSPosInfo", posNo);
		return spdto;
	}

	@Override
	public void updatePos(SmallPosDTO spdto) {
		sqlSession.update("tmUser.updatePos", spdto);
	}

	@Override
	public void deletePos(String posNo) {
		sqlSession.delete("tmUser.deletePos", posNo);
	}

	@Override
	public int idCheck(String id) {
		int check = sqlSession.selectOne("tmUser.idCheck", id);
		return check;
	}

	@Override
	public List selPosList(String posCate) {
		List sPosList = sqlSession.selectList("tmUser.selPosList", posCate);
		return sPosList;
	}

	@Override
	public String exPwCheck(String id) {
		String exPw = sqlSession.selectOne("tmUser.exPwCheck", id);
		System.out.println("dao Pw" + exPw);
		
		return exPw;
		
	}

	@Override
	public int eCheck(String email) {
		int check = sqlSession.selectOne("tmUser.eCheck",email);
		return check;
	}

	@Override
	public int nickCheck(String nickname) {
		int check = sqlSession.selectOne("tmUser.nickCheck",nickname);
		return check;
	}
	
	//모든 회원 정보 가져오기
	@Override
	public List getAllMembers() {
		List list = sqlSession.selectList("tmUser.getAllMembers");
		return list;
	}
	
	//전체 회원 중에서 해당 회원 랭킹 가져오기
	@Override
	public int getUserRanking(String id) {
		int ranking = sqlSession.selectOne("tmUser.getUserRanking",id);
		return ranking;
	}
	
	//포지션 결정
	@Override
	public void posDecision(String id, int num, int posNo) throws Exception {
		Map map = new HashMap();
		map.put("id", id);
		map.put("num", num);
		map.put("posNo", posNo);
		sqlSession.update("tmUser.posDecision",map);
	}
	
	//여행횟수 업데이트
	@Override
	public void updateTravelCnt(String id, int ud) throws Exception {
		Map map = new HashMap();
		map.put("id", id);
		map.put("ud", ud);
		sqlSession.update("tmUser.updateTravelCnt",map);
	}
	
}
