package travelMaker.controller.bean;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.model.dto.TmUserDTO;
import travelMaker.service.bean.MemberService;

@Controller
@RequestMapping("/mem/")
public class MemberController {
	
	@Autowired
	private MemberService memService = null;
	
	@RequestMapping("index.tm")
	public String index(Model model) {
		//쿠키 가져오기 
		Map cooMap = memService.getAllCookies();
		//로그인 분기처리할 변수 가져오기
		int check = memService.checkCookie(cooMap);
		
		model.addAttribute("cooMap", cooMap);
		model.addAttribute("check", check);
		
		return "client/index";
	}
	
	//회원가입 폼 페이지 
	@RequestMapping("signupForm.tm")
	public String signupForm() {
		
		return "client/member/signupForm";
	}
	
	//회원가입 처리, 성공적으로 가입했다고 표시해주는 페이지 
	@RequestMapping("signupPro.tm")
	public String signupPro(TmUserDTO dto) {
		
		memService.addMember(dto);
		return "client/member/signupPro";
	}
	
	//로그인 폼
	@RequestMapping("loginForm.tm")
	public String loginForm() {
		return "client/member/loginForm";
	}
	
	//로그인 처리
	@RequestMapping("loginPro.tm")
	public String loginPro(TmUserDTO dto, Model model, String auto) {
		//id, pw 확인
		int result = memService.idPwCheck(dto);
		//자동 로그인 시 쿠키 처리
		memService.addCookie(dto,auto);
		//뷰에 로그인 결과 넘겨주기 
		model.addAttribute("result",result);
		
		return "client/member/loginPro";
	}
	
	//로그아웃
	@RequestMapping("logout.tm")
	public String logout(TmUserDTO dto, String auto) {
		//세션 지워주기 
		memService.removeSession("memId");
		//자동 로그인 했다면 쿠키 지워 주기 
		memService.removeCookie(dto, auto);
		
		return "client/index";
	}
	
	//비밀번호 찾기 
	@RequestMapping("findPw.tm")
	public String findPw() {
		
		return "client/member/findPw";
	}
	
}
