package travelMaker.controller.bean;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
		String comId=null;
		if(mem!=null) {
			String id = mem.getId();
			comId = memService.idStar(id);
		}
		model.addAttribute("mem", mem);
		model.addAttribute("comId", comId);
		
		return "client/member/findIdPro";
	}
	
	//비로그인 일 때 비밀번호 찾기 form
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
	
	//닉네임 수정 Form
	@RequestMapping("myModiNick")
	public String myModiNick(TmUserDTO mem,Model model) {
		model.addAttribute("mem", mem);
		return "client/mypage/myModiNickForm";
	}
	
	//닉네임 수정 Pro
	//nickname 받아서 db에서 update하는 작업
	@RequestMapping("myModiNickPro")
	public String myModiNickPro(TmUserDTO mem) {
		memService.updaNick(mem);
		//model.addAttribute("mem", mem);
		return "redirect:myModi.tm";
	}

	//로그인 일 때 비밀번호 재설정 Form
	@RequestMapping("myModiPwForm")
	public String myModiPwForm(TmUserDTO mem,Model model) {
		model.addAttribute("mem", mem);
		
		return "client/mypage/myModiPwForm";
	}
	
	//로그인 일 때 비밀번호 재설정 Pro
	@RequestMapping("myModiPwPro")
	public String myModiPwPro(TmUserDTO mem) {
		System.out.println("mem.id"+mem.getId());
		System.out.println("mem.pw"+mem.getPw());
		memService.pwChange(mem);
		return "redirect:myModi.tm";
	}
	
	//회원 탈퇴 Form
	@RequestMapping("myDelete")
	public String myDelete(String id,Model model) {
		model.addAttribute("id", id);
		return "client/mypage/myDelete";
	}
	
	//회원 탈퇴 Pro
	//아이디, 비밀번호를 받아서 맞으면 삭제 아니면 돌아가라 
	@RequestMapping("myDeletePro")
	public String myDeletePro(TmUserDTO mem) {
		int result = memService.idPwCheck(mem);
		if(result==1) {
			memService.changeStat(2, mem.getId());
		}
		
		return "client/mypage/myDelete";
	}
	
	@RequestMapping("ajaxIdCheck.tm")
	public ResponseEntity<String> ajaxIdAvail(String id) throws Exception {
	String result = "";
	//매개변수로 전달 받은 id가 DB에 존재하는지 확인
	int check = memService.idCheck(id);	//1이면 이미 존재, 0이면 존재 X
	if(check == 1) {
		result = "이미 사용중입니다";
	}else {
		result = "사용가능";
	}
	HttpHeaders responseHeaders = new HttpHeaders();
	responseHeaders.add("Content-Type", "text/html;charset=utf-8");
	
	return new ResponseEntity<String>(result, responseHeaders, HttpStatus.CREATED);
	}
}
