package travelMaker.controller.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.service.bean.MemberService;

@Controller
@RequestMapping("/mem/")
public class MemberController {
	
	@Autowired
	private MemberService memService = null;
	
	@RequestMapping("index.do")
	public String index() {
		
		return "client/index";
	}
}
