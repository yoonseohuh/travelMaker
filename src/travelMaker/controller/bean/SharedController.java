package travelMaker.controller.bean;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.service.bean.SharedService;

@Controller
@RequestMapping("/shared/")
public class SharedController {
	
	@Autowired
	private SharedService sharedService = null;

	@RequestMapping("sharedList.tm")
	public String sharedList(String pageNum, Model model) throws Exception {
		Map result = sharedService.getArtilces(pageNum);
		
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("currPage", result.get("currPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("number", result.get("number"));
		model.addAttribute("articleList", result.get("articleList"));
		
		
		return "shared/sharedList";
	}
}
