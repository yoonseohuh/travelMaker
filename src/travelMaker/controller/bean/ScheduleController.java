package travelMaker.controller.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		int num = Integer.parseInt(gNo);
		scheduleService.selectSchedule(num);
		
		return "/client/travel/schedulePracList";
	}
	@RequestMapping("scheduleList.tm")
	public String scheduleList(int gNo, Model model) throws Exception {
		List scheList = scheduleService.getSchedule(gNo);
		model.addAttribute("gNo",gNo);
		model.addAttribute("scheList",scheList);
		return "/client/travel/schedulePracList";
	}
	
	@RequestMapping("scheduleModi.tm")
	public String scheduleModi(ScheduleDTO dto) throws Exception {
		scheduleService.updateSchedule(dto);
		//System.out.println(dto.getgNo());
		String gNo = Integer.toString(dto.getgNo());
		return "redirect:scheduleList.tm?gNo="+gNo;
	}
	
	@RequestMapping("scheduleDelete.tm")
	public String DeleteSchedule(int gNo, int sNo) throws Exception {
		scheduleService.deleteSchedule(sNo);
		
		System.out.println("sNo 컨트롤러:"+sNo);
		return "redirect:scheduleList.tm?gNo="+gNo;
	} 
	
	
}
