package travelMaker.model.dao;

import travelMaker.model.dto.TmUserDTO;

public interface TmUserDAO {
	
	//회원 가입
	public void insertMember(TmUserDTO dto);
	//로그인 (아이디, 비밀번호 일치하는지 확인)
	public int idPwCheck(TmUserDTO dto);
	//아이디, email 일치하는지 확인
	public int idEmailCheck(TmUserDTO dto);
	//email 존재 확인 
	public int emailCheck(String email);
	//member 정보 가져오기 
	public TmUserDTO getMemInfo(String email);
	//비밀번호 수정 
	public void pwChange(TmUserDTO mem);

}
