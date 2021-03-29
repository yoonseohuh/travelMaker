package travelMaker.controller.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sche/")
public class ScheduleController {
	
	@RequestMapping("schedule.tm")
	public String schedule() throws Exception {
		return "/client/travel/schedulePrac";
	}
	
	@RequestMapping("schedulePro.tm")
	public String schedulePro() throws Exception {
		
		
		
		return "/client/travel/schedulePrac";
	}
	
}
