package travelMaker.controller.bean;

import java.util.ArrayList;	
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.SharedLikedDTO;
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
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("gNo", result.get("gNo"));
		model.addAttribute("sharedList", result.get("sharedList"));
		// System.out.println("dao 서비스 왔는데 컨트롤러 왔니?");

		return "client/shared/sharedList";
	}
	
	@RequestMapping("completedCont.tm")
	public String completedCont(int gNo, String pageNum, Model model) throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);

		// 리뷰 리스트
		List reviewList = travelService.getReview(gNo);
		// sharedPage에서 completedCont 가져오기
		GroupSpaceDTO article = sharedService.getArticle(gNo);
		// 스케쥴 리스트 가져오기
		List scheList = travelService.getSchedule(gNo);
		
		List grpReq = travelService.getRequests(gNo);
		List gMem = travelService.getMembers(gNo);
		List gList = travelService.getGroupImgs(gNo);
		
		// status = 1 인 멤버들의 그룹리퀘스트dto
		List<GroupRequestDTO> joinMem = new ArrayList<GroupRequestDTO>();
		for (int i = 0; i < grpReq.size(); i++) {
			GroupRequestDTO req = (GroupRequestDTO) grpReq.get(i);
			int status = travelService.getMemStatus(gNo, req.getId());
			if (status == 1) {
				joinMem.add(req);
			}
		}
		
		//select count(*) from sharedLiked where id=#{id} and gNo=#{gNo}
		
		
		
		// joinMem의 posNo를 리스트에 담는다
		List<Integer> posList = new ArrayList<Integer>();
		for (int i = 0; i < joinMem.size(); i++) {
			posList.add(((GroupRequestDTO) joinMem.get(i)).getPosNo());
		}

		// 중복제거..
		HashSet posListFin = new HashSet();
		posListFin.addAll(posList);
		posList.clear();
		posList.addAll(posListFin);

		Map map = new HashMap();
		Map posMem = new HashMap();

		for (int i = 0; i < posList.size(); i++) {
			if (posList.get(i) == -1) { // 포지션에 번호가 -1 이면
				int nomalCnt = travelService.posCount(gNo, posList.get(i));
				posMem.put("일반", nomalCnt);
				model.addAttribute("nomalCnt", nomalCnt);
			} else { // 그게아니면
				SmallPosDTO dto = travelService.getPosInfo(posList.get(i));
				int posCnt = travelService.posCount(gNo, posList.get(i));
				posMem.put(dto.getPosName(), posCnt);
			}
		}
		// 좋아요 체크 확인 
		int check = sharedService.likedCheck(gNo, id);
		
		
		model.addAttribute("gNo", gNo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("article", article);
		model.addAttribute("schedules", scheList);
		model.addAttribute("grpReq", grpReq);
		model.addAttribute("gMem", gMem);
		model.addAttribute("posMem", posMem);
		model.addAttribute("gList", gList);
		model.addAttribute("check", check);
		model.addAttribute("reviewList", reviewList);
		//System.out.println("다 들어오는데 check도 왔냐?");
		// System.out.println(scheList);
		// System.out.println(article);
		// System.out.println("컨트롤러도왔니?");
		
		

		return "client/shared/completedCont";
	}
	
	@RequestMapping("sharedLiked.tm")
	public String sharedLiked(int gNo) throws Exception{
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		sharedService.sharedLiked(gNo, id);
		System.out.println("좋아요 컨트롤 왔니?");
		return "client/shared/sharedLiked";
	}
	
	@RequestMapping("sharedLikedPro.tm")
	public String sharedLikedPro(String id, int gNo, Model model) throws Exception{
		
		sharedService.sharedLiked(gNo, id);
		//System.out.println(id+"/"+gNo);
		model.addAttribute("id", id);
		model.addAttribute("gNo", gNo);
		System.out.println("좋아요프로 컨트롤 왔니?");
		
		return "redirect:completedCont.tm?gNo="+gNo;
	}
	
	@RequestMapping("sharedLikedCancel.tm")
	public String sharedLikedCancel(int[] gNo) throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		for(int i=0; i<gNo.length; i++) {
			System.out.println(gNo[i]);
			sharedService.sharedLikedCancel(gNo[i], id);
		}
		System.out.println("취소컨트롤 왔니?");
		return "redirect:/my/myHistory.tm";
	}

	
	
	
	

}
