package travelMaker.controller.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.service.bean.SharedService;

@Controller
@RequestMapping("/shared/")
public class SharedController {
	
	@Autowired
	private SharedService sharedService = null;

	@RequestMapping("sharedList.tm")
	public String sharedlist(int gNo) throws Exception{
		sharedService.getshared(gNo);
		return "shared/sharedlist";
	}
}
