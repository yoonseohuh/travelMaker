package travelMaker.controller.bean;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;	

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.service.bean.SharedService;
import travelMaker.service.bean.TravelService;

@Controller
@RequestMapping("/shared/")
public class SharedController {
	
	@Autowired
	private SharedService sharedService = null;
	@Autowired
	private TravelService travelService = null;
	
	@RequestMapping("sharedList.tm")
	public String sharedList(String pageNum, Model model) throws Exception {
		Map result = sharedService.getArtilces(pageNum);
		
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("currPage", result.get("currPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("gNo", result.get("gNo"));
		model.addAttribute("sharedList", result.get("sharedList"));
		//System.out.println("dao 서비스 왔는데 컨트롤러 왔니?");
		
		return "client/shared/sharedList";
	}
	
	@RequestMapping("completedCont.tm")
	public String completedCont(int gNo, String pageNum, Model model) throws Exception{
		GroupSpaceDTO article =sharedService.getArticle(gNo);
		List scheList = travelService.getSchedule(gNo);
		List grpReq = travelService.getRequests(gNo);
		List gMem = travelService.getMembers(gNo);
		List gList = travelService.getGroupImgs(gNo);
		
		
		
		model.addAttribute("gNo", gNo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("article", article);
		model.addAttribute("schedules", scheList);
		model.addAttribute("grpReq", grpReq);
		model.addAttribute("gMem", gMem);
		model.addAttribute("gList", gList);
		//System.out.println(scheList);
		//System.out.println(article);
		//System.out.println("컨트롤러도왔니?");
		
		
		
		return "client/shared/completedCont";
	}
	
	
}
