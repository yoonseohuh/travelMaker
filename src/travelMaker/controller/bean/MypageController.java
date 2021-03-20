package travelMaker.controller.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/my/")
public class MypageController {
	
	@RequestMapping("myPage.tm")
	public String index() {
		
		return "client/mypage/myPage";
	}
	
}