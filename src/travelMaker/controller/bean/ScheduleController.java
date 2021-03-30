package travelMaker.controller.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.model.dto.ScheduleDTO;
import travelMaker.service.bean.ScheduleService;

@Controller
@RequestMapping("/sche/")
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService = null;
	
	@RequestMapping("schedule.tm")
	public String schedule() throws Exception {
		return "/client/travel/schedulePrac";
	}
	
	@RequestMapping("schedulePro.tm")
	public String schedulePro(String gNo, String sDate, String sCont) throws Exception {
		scheduleService.insertSchedule(gNo, sDate, sCont);
		
		return "/client/travel/schedulePrac";
	}
	
	@RequestMapping("schedulePracList.tm")
	public String schedulePracList(ScheduleDTO dto) throws Exception {
		scheduleService.getSchedule(dto);
		return "client/travel/schedulePracList";
	}
	
	
	
	
	
}
