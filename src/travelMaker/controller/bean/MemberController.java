package travelMaker.controller.bean;

import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	//회원가입 처리
	@RequestMapping("signupPro.tm")
	public String signupPro(TmUserDTO dto) {
		
		memService.addMember(dto);
		return "redirect:index.tm";
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
		
		return "redirect:index.tm";
	}
	
	//아이디 찾기 
	@RequestMapping("findIdForm.tm")
	public String findIdForm() {
		
		return "client/member/findIdForm";
	}
	
	//아이디 찾기 
	//findIdForm에서 입력한 email을 받아와서 이 email의 아이디를 보여줘야함 
	@RequestMapping("findIdPro.tm")
	public String findIdPro(String email, Model model)throws Exception {
		TmUserDTO mem = memService.emailCheck(email);
		String id = mem.getId();
		String comId = memService.idStar(id);
		model.addAttribute("mem", mem);
		model.addAttribute("comId", comId);
		
		return "client/member/findIdPro";
	}
	
	//비밀번호 찾기 form
	@RequestMapping("findPw")
	public String findPw() {
		
		return "client/member/findPw";
	}
	
	//비밀번호 찾기 Pro
	//아이디,비밀번호 맞는지 확인
	//맞다면 비밀번호 변경 가능
	@RequestMapping("modiPwForm")
	public String findPwPro(TmUserDTO mem,Model model) {
		int result = memService.idEmailCheck(mem);
		model.addAttribute("result", result);
		model.addAttribute("mem", mem);
		return "client/member/modiPwForm";
	}
	
	//비밀번호 재설정 Pro
	@RequestMapping("modiPwPro")
	public String modiPwPro(TmUserDTO mem,Model model) {
		//비밀번호 업데이트 하는 메서드 
		memService.pwChange(mem);
		return "redirect:index.tm";
	}
	
	//회원 정보 수정
	@RequestMapping("myModi")
	public String myModi(HttpSession session, Model model) {
		TmUserDTO member = memService.getMember((String)session.getAttribute("memId"));
		model.addAttribute("mem", member);
		return "client/mypage/myModi";
	}
	
	//닉네임 수정
	@RequestMapping("myModiNick")
	public String myModiNick() {
		return "client/mypage/myModiNickForm";
	}
	

	
	
}
