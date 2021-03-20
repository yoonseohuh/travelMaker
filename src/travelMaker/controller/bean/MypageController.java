package travelMaker.controller.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/my/")
public class MypageController {
	
	//마이페이지 홈
	@RequestMapping("myPage.tm")
	public String index() {		
		return "client/mypage/myPage";
	}
	
	//여행이력
	
	//코멘트 관리
	
	//나의 랜드마크
	
	//내정보 관리
	
	//문의 및 신고
	
}