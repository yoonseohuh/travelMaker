package travelMaker.controller.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/land/")
public class LandmarkController {

	@RequestMapping("landmark.tm")
	public String landmark() {
		return "client/landmark/landmark";
	}
	
	@RequestMapping("landWrite.tm")
	public String landWriteForm() {
		return "client/landmark/landWriteForm";
	}
	
}
