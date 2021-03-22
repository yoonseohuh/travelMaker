package travelMaker.controller.bean;

import java.util.Map;

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
	public String makingWrite(String pageNum, Model model) {
		model.addAttribute("pageNum",pageNum);
		return "/client/travel/makingWrite";
	}
	
	@RequestMapping("makingWritePro.tm")
	public String makingWritePro(String pageNum, GroupSpaceDTO dto, Model model) throws Exception {
		System.out.println("po1:"+dto.getPo1()+"/po2:"+dto.getPo2()+"/po3:"+dto.getPo3());
		travelService.insertMaking(dto);
		model.addAttribute("pageNum",pageNum);
		return "/client/travel/makingList";
	}
	
	@RequestMapping("makingList.tm")
	public String makingList(String pageNum, Model model) throws Exception {
		Map map = travelService.getArticles(pageNum);
		
		model.addAttribute("pageNum",map.get("pageNum"));
		model.addAttribute("pageSize",map.get("pageSize"));
		model.addAttribute("currPage",map.get("currPage"));
		model.addAttribute("start",map.get("start"));
		model.addAttribute("end",map.get("end"));
		model.addAttribute("count",map.get("count"));
		model.addAttribute("number",map.get("number"));
		model.addAttribute("articleList",map.get("articleList"));
		return "/client/travel/makingList";
	}
	
	@RequestMapping("makingCont.tm")
	public String makingCont() {
		
		return "/client/travel/makingCont";
	}
	
	
}
