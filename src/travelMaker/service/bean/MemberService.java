package travelMaker.service.bean;

import travelMaker.model.dto.TmUserDTO;

public interface MemberService {

	//회원가입
	public void addMember(TmUserDTO dto);
	//id,pw 체크 
	public int idPwCheck(TmUserDTO dto);
	//쿠키 생성
	public void addCookie(TmUserDTO dto, String auto);
	
}
