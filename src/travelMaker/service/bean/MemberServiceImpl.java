package travelMaker.service.bean;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import travelMaker.model.dao.TmUserDAO;
import travelMaker.model.dto.TmUserDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private TmUserDAO tmuserDAO = null;
	
	//회원 가입
	@Override
	public void addMember(TmUserDTO dto) {
		tmuserDAO.insertMember(dto);
	}

	//로그인
	@Override
	public int idPwCheck(TmUserDTO dto) {
		//id,pw 맞는지 체크(맞으면 1, 아니면 0) 
		int result = tmuserDAO.idPwCheck(dto);
		//맞다면 세션을 만들어준다. 
		if(result == 1) {
			RequestContextHolder.getRequestAttributes().setAttribute("memId", dto.getId(), RequestAttributes.SCOPE_SESSION);
			//RequestAttributes ra = RequestContextHolder.getRequestAttributes();
			//ServletRequestAttributes sra = (ServletRequestAttributes)ra;
			//HttpServletRequest request = sra.getRequest(); 
		}
		return result;
	}
	
	//쿠키 생성
	public void addCookie(TmUserDTO dto, String auto) {
		if(auto == null || auto.equals("null")) {	//자동 로그인 체크 안했을 때 auto=0
			auto = "0";
		}else if (auto.equals("1")) {
			RequestAttributes ra = RequestContextHolder.getRequestAttributes();
			ServletRequestAttributes sra = (ServletRequestAttributes)ra;
			HttpServletResponse response = sra.getResponse();
			Cookie c1 = new Cookie("autoId",dto.getId());
			Cookie c2 = new Cookie("autoPw",dto.getPw());
			Cookie c3 = new Cookie("autoCh",auto);
			c1.setMaxAge(60*60*24);
			c2.setMaxAge(60*60*24);
			c3.setMaxAge(60*60*24);
			response.addCookie(c1);
			response.addCookie(c2);
			response.addCookie(c3);
		}
		
	}
	
	//세션 삭제 
	public void removeSession(String sessionName) {
		RequestContextHolder.getRequestAttributes().removeAttribute(sessionName, RequestAttributes.SCOPE_SESSION);
	}
}
