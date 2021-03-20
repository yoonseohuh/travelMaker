package travelMaker.controller.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.service.bean.TravelService;

@Controller
@RequestMapping("/travel/")
public class TravelController {

	@Autowired
	private TravelService travelService = null;
	
	@RequestMapping("makingWrite.tm")
	public String makingWrite() {
		
		return "/client/travel/makingWrite";
	}
	
	@RequestMapping("makingWritePro.tm")
	public String makingWritePro(GroupSpaceDTO dto) throws Exception{
		System.out.println("po1:"+dto.getPo1()+"/po2:"+dto.getPo2()+"/po3:"+dto.getPo3());
		travelService.insertMaking(dto);
		return "/client/travel/makingList";
	}
	
	@RequestMapping("makingList.tm")
	public String makingList(Model model) {
		
		return "/client/travel/makingList";
	}
	
	
}
