package travelMaker.controller.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import travelMaker.service.bean.TravelService;

@Controller
@RequestMapping("/test/")
public class AjaxTestController {
	
	@Autowired
	private TravelService travelService = null;
	
	@RequestMapping("test.tm")
	public String test() {
		return "/client/travel/testFile";
	}
	
	
	
	
}
