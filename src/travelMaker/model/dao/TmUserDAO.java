package travelMaker.model.dao;

import travelMaker.model.dto.TmUserDTO;

public interface TmUserDAO {
	
	//회원 가입
	public void insertMember(TmUserDTO dto);
	//로그인 (아이디, 비밀번호 일치하는지 확인)
	public int idPwCheck(TmUserDTO dto);
	

}
