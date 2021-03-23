package travelMaker.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.TmUserDTO;

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
	

}
