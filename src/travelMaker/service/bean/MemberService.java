package travelMaker.service.bean;

import java.util.List;
import java.util.Map;

import travelMaker.model.dto.SmallPosDTO;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserRkDTO;

public interface MemberService {

	//회원가입
	public void addMember(TmUserDTO dto);
	//id,pw 체크 
	public int idPwCheck(TmUserDTO dto);
	//id,email 체크 
	public int idEmailCheck(TmUserDTO dto);
	//쿠키 생성
	public void addCookie(TmUserDTO dto, String auto);
	//쿠키 꺼내기
	public Map getAllCookies();
	//쿠키 체크
	public int checkCookie(Map cooMap);
	//쿠키 삭제
	public void removeCookie(TmUserDTO dto, String auto);
	//세션 삭제
	public void removeSession(String sessionName); 
	//email 확인
	public TmUserDTO emailCheck(String email);
	//회원 정보 가져오기 
	public TmUserDTO getMemInfo(String email);
	//비밀번호 변경
	public void pwChange(TmUserDTO mem);
	//아이디 받아서 현재 비밀번호 확인 
	public int exPwCheck(String id, String newPw);
	//아이디 ***변환
	public String idStar(String id) throws Exception;
	//회원 정보 가져오기 
	public TmUserDTO getMember(String id);
	//닉네임 업데이트 
	public void updaNick(TmUserDTO mem);
	//회원 상태 변경 
	public void changeStat(int status, String id);
	//회원들 정보 가져오기 
	public Map getMembers(String pageNum);
	//posNo으로 posName 가져오기 
	public String getPosName(int posNo);
	//posNo,posName 전체 가져오기 
	public List getAllPos();
	//관리자 회원 정보 변경 
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
	//포지션 소분류 싹 긁어오기 
	public List getSPos();
	//포지션 Map 생성
	public Map getPositions(String pageNum);
	//포지션 추가 
	public void addSPos(SmallPosDTO spdto);
	//포지션 정보 가져오기 
	public SmallPosDTO getSPosInfo(int posNo);
	//포지션 정보 수정
	public void updatePos(SmallPosDTO spdto);
	//포지션 삭제
	public void deletePos(String posNo); 
	//id 중복 체크 
	public int idCheck(String id);
	//posCate로 리스트 가져오기 
	public List selPosList(String posCate);
	//email 중복 체크 
	public int eCheck(String email);
	//nickname 중복 체크 
	public int nickCheck(String nickname);
	//모든 회원 정보 가져오기
	public List getAllMembers();
	//전체 회원 중에서 해당 회원 랭킹 가져오기
	public int getUserRanking(String id);
	//모든 포지션 가져오기
	public List getAllPositions() throws Exception;
	//포지션 결정
	public void posDecision(String id, int num, int posNo) throws Exception;
	//여행횟수 업데이트
	public void updateTravelCnt(String id, int ud) throws Exception;
}
