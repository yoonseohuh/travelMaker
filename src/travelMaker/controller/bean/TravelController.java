package travelMaker.controller.bean;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

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
		travelService.insertMaking(dto);
		model.addAttribute("pageNum",pageNum);
		return "/client/travel/sendToMakingList";
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
	public String makingCont(String pageNum, int gNo, Model model) throws Exception {
		GroupSpaceDTO content = travelService.getContent(gNo);
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int writerGender = travelService.getGender(content.getId());
		int memIdGender = travelService.getGender(id);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("content",content);
		model.addAttribute("writerGender",writerGender);
		model.addAttribute("id",id);
		model.addAttribute("memIdGender",memIdGender);
		return "/client/travel/makingCont";
	}
	
	@RequestMapping("makingDel.tm")
	public String makingDel(int gNo) throws Exception {
		travelService.deleteContent(gNo);
		return "/client/travel/sendToMakingList";
	}
	
	
}
