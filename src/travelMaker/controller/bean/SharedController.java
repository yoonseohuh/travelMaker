package travelMaker.controller.bean;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.SmallPosDTO;
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
		model.addAttribute("start", result.get("start"));
		model.addAttribute("end", result.get("end"));
		model.addAttribute("gNo", result.get("gNo"));
		model.addAttribute("sharedList", result.get("sharedList"));
		model.addAttribute("number", result.get("number"));
		// System.out.println("dao 서비스 왔는데 컨트롤러 왔니?");

		return "client/shared/sharedList";
	}

	@RequestMapping("completedCont.tm")
	public String completedCont(int gNo, String pageNum, Model model) throws Exception {
		GroupSpaceDTO article = sharedService.getArticle(gNo);
		List scheList = travelService.getSchedule(gNo);
		List grpReq = travelService.getRequests(gNo);
		List gMem = travelService.getMembers(gNo);
		List gList = travelService.getGroupImgs(gNo);
		
		
		// 여기 공부좀 더 해야겠네
		List<GroupRequestDTO> joinMem = new ArrayList<GroupRequestDTO>();
		for(int i=0;i<grpReq.size();i++) {
			GroupRequestDTO req = (GroupRequestDTO)grpReq.get(i);
			int status = travelService.getMemStatus(gNo, req.getId());
			
			if(status == 1) {
				joinMem.add(req);
			}
		}
		
		List<Integer> posList = new ArrayList<Integer>();
		for(int i = 0; i < joinMem.size(); i++) {
			posList.add(((GroupRequestDTO)joinMem.get(i)).getPosNo());
		}
		
		HashSet posListFin = new HashSet();
		posListFin.addAll(posList);
		posList.clear();
		posList.addAll(posListFin);

		Map map = new HashMap();
		Map posMem = new HashMap(); 
		for(int i = 0; i < posList.size(); i++) {
			if(posList.get(i)== -1) {
				int nomalCnt = travelService.posCount(gNo, posList.get(i));
				posMem.put("일반", nomalCnt);
				model.addAttribute("nomalCnt", nomalCnt);
			}else {
				SmallPosDTO dto = travelService.getPosInfo(posList.get(i));
				int posCnt = travelService.posCount(gNo, posList.get(i));
				posMem.put(dto.getPosName(), posCnt);
			}
		}
		
		model.addAttribute("gNo", gNo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("article", article);
		model.addAttribute("schedules", scheList);
		//System.out.println("scheList 넘어오니?"+scheList);
		model.addAttribute("grpReq", grpReq);
		model.addAttribute("gMem", gMem);
		model.addAttribute("posMem", posMem);
		model.addAttribute("gList", gList);
		// System.out.println(scheList);
		// System.out.println(article);
		// System.out.println("컨트롤러도왔니?");

		return "client/shared/completedCont";
	}

}
