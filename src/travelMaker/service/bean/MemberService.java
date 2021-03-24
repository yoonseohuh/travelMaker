package travelMaker.service.bean;

import java.util.List;
import java.util.Map;

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
}
