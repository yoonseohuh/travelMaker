package travelMaker.controller.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.model.dto.LandmarkBoardDTO;

@Controller
@RequestMapping("/land/")
public class LandmarkController {

	@RequestMapping("landmark.tm")
	public String landmark() {
		return "client/landmark/landmark";
	}
	
	@RequestMapping("landWrite.tm")
	public String landWriteForm(@ModelAttribute("dto") LandmarkBoardDTO dto) {
		
		return "client/landmark/landWriteForm";
	}
	
	@RequestMapping("landWritePro.tm")
	public String landWritePro() {
		return "client/landmark/landWritePro";
	}
}
