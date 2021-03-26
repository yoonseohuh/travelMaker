package travelMaker.model.dao;

import java.util.List;
import java.util.Map;

import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserRkDTO;

public interface TmUserDAO {
	
	//회원 가입
	public void insertMember(TmUserDTO dto);
	//로그인 (아이디, 비밀번호 일치하는지 확인)
	public int idPwCheck(TmUserDTO dto);
	//아이디, email 일치하는지 확인
	public int idEmailCheck(TmUserDTO dto);
	//email 존재 확인 
	public int emailCheck(String email);
	//member 정보 가져오기 (email)
	public TmUserDTO getMemInfo(String email);
	//비밀번호 수정 
	public void pwChange(TmUserDTO mem);
	//member 정보가져오기(id)
	public TmUserDTO getMember(String id);
	//id 주고 성별 가져오기
	public int getGender(String id);
	//닉네임 업데이트
	public void updaNick(TmUserDTO mem);
	//회원 상태 업데이트
	public void changeStat(Map statMap);
	//회원 리스트 가져오기(검색X)
	public List getMembers(int startRow, int endRow);
	//회원 리스트 가져오기(아이디 검색)
	public List getSearchMembers(int startRow, int endRow,String search);
	//회원 수 구하기 (아이디 검색)
	public int getSearchMemberCount(String search);
	//회원 수 구하기 (검색 X)
	public int getMemberCount();
	//posName 구하기 
	public String getPosName(int posNo);
	//pos 전체 가져오기 
	public List getAllPos();
	//회원 정보 수정 관리자
	public void updateMember(TmUserDTO mem);
	//관리자 랭크 정보 소환 !
	public List getRk();
	//랭크 추가 
	public void insertRank(UserRkDTO rkdto);
	//랭크 정보 가져오기 
	public UserRkDTO getRkInfo(int rkNo);
	//랭크 정보 수정하기 
	public void updateRank(UserRkDTO rdto);
	//랭크 삭제하기 
	public void deleteRk(String rkNo); 
	//포지션 대분류 싹 긁어오기 
	public List getSPos();
	//포지션 수 구하기 
	public int getPosCount();
	//start,end 주고 포지션 소분류 긁어오기 
	public List getPosList(int start, int end);
}
