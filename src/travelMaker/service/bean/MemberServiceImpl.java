package travelMaker.service.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
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
	
	//쿠키 가져오기
	public Map getAllCookies() {
		//쿠키를 담을 map 생성
		Map<String, String> cooMap = new HashMap<String, String>();
		//request 소환!
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		HttpServletRequest request = sra.getRequest();
		//쿠키 싹 쓸어 담기  
		Cookie[] coos = request.getCookies();
		//coos 안에 쿠키가 있다면 쓸어온 쿠키 중에 이름 별로 통에 담기 
		if(coos != null) {
			for(Cookie c : coos) {	//coos 라는 배열을 돌릴 껀데 꺼낼 때 c라는 이름을 사용할 꺼야 
				if(c.getName().equals("autoId")) {cooMap.put("autoId", c.getValue());}
				if(c.getName().equals("autoPw")) {cooMap.put("autoPw", c.getValue());}
				if(c.getName().equals("autoCh")) {cooMap.put("autoCh", c.getValue());}
			}
		}
		return cooMap;
	}
	
	//쿠키 체크해서 로그인 처리 
	//세션과 쿠키를 통해 로그인 처리 
	//1.세션이 없는데 쿠키가 있는 경우 -> 로그인 O
	//2.세션이 없는데 쿠키가 없는 경우 -> 로그인 X
	//3.세션이 있는경우 -> 로그인 O
	public int checkCookie(Map cooMap) {
		int check=-1;
		//맵 타입 쿠키를 String 으로 형변환
		String id = (String)cooMap.get("autoId");
		String pw = (String)cooMap.get("autoPw");
		String ch = (String)cooMap.get("autoCh");
		//세션 소환!
		String sessionId = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		//분기 처리 
		if(sessionId==null) {
			if(id!=null && pw!=null && ch!=null) {		//1번 경우 	check=0, dto에 id,pw 담아서 세션 추가하는 메서드 실행
				check=0;
				TmUserDTO dto = new TmUserDTO();
				dto.setId(id);
				dto.setPw(pw);
				idPwCheck(dto);
			}else {										//2번 경우 	check=-1, 세션도 쿠키도 없어 돌아가
				check=-1;
			}
		}else {
			check=1;									//3번 경우 	세션이 있으니까 당연히 로그인 처리 
		}
		return check;
	}
	
	//쿠키 삭제 
	public void removeCookie(TmUserDTO dto, String auto) {
		//response 이용할 수 있게 만들어줌
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		HttpServletResponse response = sra.getResponse();
		//쿠키 삭제는 따로 없고 지속 시간을 0으로 만들어줌
		Cookie c1 = new Cookie("autoId",dto.getId());
		Cookie c2 = new Cookie("autoPw",dto.getPw());
		Cookie c3 = new Cookie("autoCh",auto);
		c1.setMaxAge(0);
		c2.setMaxAge(0);
		c3.setMaxAge(0);
		response.addCookie(c1);
		response.addCookie(c2);
		response.addCookie(c3);
	}
	
	//세션 삭제 
	public void removeSession(String sessionName) {
		RequestContextHolder.getRequestAttributes().removeAttribute(sessionName, RequestAttributes.SCOPE_SESSION);
	}

	//email 체크 
	//있으면 1 없으면 -1
	@Override
	public TmUserDTO emailCheck(String email) {
		//email 체크
		int result = tmuserDAO.emailCheck(email);
		TmUserDTO mem = null;
		if(result==1) {	//email이 있으면 id 받아와라 
			mem = getMemInfo(email);
		}
		return mem;
	} 
	
	//email로 회원정보 가져오기 
	@Override
	public TmUserDTO getMemInfo(String email) {
		TmUserDTO mem = tmuserDAO.getMemInfo(email);
		return mem;
	}
	
	//id,email 찾기 
	@Override
	public int idEmailCheck(TmUserDTO dto) {
		//id,email 맞는지 체크(맞으면 1, 아니면 0) 
		int result = tmuserDAO.idEmailCheck(dto);
	
		return result;
	}
	
	//비번 변경 
	@Override
	public void pwChange(TmUserDTO mem) {
		tmuserDAO.pwChange(mem);
	}
	
	//아이디 ***
	@Override
	public String idStar(String id)throws Exception {
		int num = id.length()-3;
		System.out.println("num "+ num );
		String cutId = id.substring(0, num);
		System.out.println("cut Id: "+cutId);
		String comId = cutId + "***";
		return comId;
	}
	
	//id로 멤버 정보 가져오기
	@Override
	public TmUserDTO getMember(String id) {
		TmUserDTO member =  tmuserDAO.getMember(id);
		return member;
	}
	
	//닉네임 업데이트
	@Override
	public void updaNick(TmUserDTO mem) {
		tmuserDAO.updaNick(mem);
	}
	
	//회원 상태 변경 
	//정상 0/  활동정지 1/ 탈퇴2/ 관리자 99
	@Override
	public void changeStat(int status, String id) {
		Map statMap = new HashMap();
		statMap.put("status", status); 
		statMap.put("id", id);
		tmuserDAO.changeStat(statMap);
	}

	@Override
	public Map getMembers(String pageNum) {
		System.out.println(2);
		System.out.println(pageNum);
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		HttpServletRequest request = sra.getRequest();
		
		int pageSize=3;
		if(pageNum==null || pageNum.equals("pageNum") || pageNum.equals("")) {pageNum="1";}
		int currPage = Integer.parseInt(pageNum);
		int startRow = (currPage-1)*pageSize+1;
		int endRow = currPage*pageSize;
		
		List memList = null;
		
		String search = request.getParameter("search");
		
		int count = 0;
		
		if(search != null) {
			count = tmuserDAO.getSearchMemberCount(search);
			if(count>0) {
				memList=tmuserDAO.getSearchMembers(startRow, endRow, search);
			}
		}else {
			count = tmuserDAO.getMemberCount();
			if(count>0) {
				memList=tmuserDAO.getMembers(startRow, endRow);
			}
		}
		
		int number=count -(currPage-1)*pageSize;
		
		Map every = new HashMap();
		every.put("pageNum", pageNum);
		every.put("pageSize", pageSize);
		every.put("currPage", currPage);
		every.put("startRow", startRow);
		every.put("endRow", endRow);
		every.put("number", number);
		every.put("count", count);
		every.put("memList", memList);
		every.put("search", search);
		
		return every;
	}
	
	
	
}
