package travelMaker.service.bean;

import java.util.Map;

import travelMaker.model.dto.TmUserDTO;

public interface MemberService {

	//회원가입
	public void addMember(TmUserDTO dto);
	//id,pw 체크 
	public int idPwCheck(TmUserDTO dto);
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
}
