package travelMaker.service.bean;

import java.util.Map;

import travelMaker.model.dto.TmUserDTO;

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
}
