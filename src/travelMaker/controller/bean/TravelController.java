package travelMaker.controller.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.fasterxml.jackson.databind.ObjectMapper;

import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.SmallPosDTO;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserRkDTO;
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
		return "redirect:makingList.tm";
	}
	
	@RequestMapping("makingList.tm")
	public String makingList(String pageNum, Model model) throws Exception {
		//유저 정보
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		model.addAttribute("id",id);
		UserRkDTO rkInfo = new UserRkDTO();
		if(id!=null) {			
			rkInfo = travelService.getMemRk(id);
		}else if(id==null) {
			rkInfo.setRkNo(0);
			rkInfo.setRkName("비로그인");
		}
		//모든 여행 가져와서 상태가 참여 중(1)인 것만 담음
		List JList = travelService.getMyGroups(id,1);
		model.addAttribute("joiningList",JList);		
		//모든 여행 가져와서 상태가 대기 중(0)인 것만 담음
		List WList = travelService.getMyGroups(id,0);
		model.addAttribute("waitingList",WList);

		//모집 중인 여행
		Map map = travelService.getArticles(pageNum);
		model.addAttribute("rkInfo",rkInfo);
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
	
	@ResponseBody
	@RequestMapping("listSearch.tm")
	public String listSearch(String pageNum, @RequestBody Map<Object,Object> map) throws Exception {
	/*	인코딩처리
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8"); */
	//	검색(시작일,종료일)값을 각각 변수에 담아 매개변수로 보내줌
		String startD = (String)map.get("startD");
		String endD = (String)map.get("endD");
		System.out.println(startD);
		System.out.println(endD);
		Map listMap = new HashMap();
		listMap = travelService.getSearchArticles(pageNum, startD, endD);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(listMap);

		return json;
	}
	
	
	@RequestMapping("makingCont.tm")
	public String makingCont(String pageNum, int gNo, Model model) throws Exception {
		GroupSpaceDTO content = travelService.getContent(gNo);
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int writerGender = travelService.getGender(content.getId());
		int memIdGender = travelService.getGender(id);
		
		int memStatus = travelService.getMemStatus(gNo, id);
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("content",content);
		model.addAttribute("writerGender",writerGender);
		model.addAttribute("id",id);
		model.addAttribute("memIdGender",memIdGender);
		model.addAttribute("memStatus",memStatus);
		return "/client/travel/makingCont";
	}
	
	@RequestMapping("makingDel.tm")
	public String makingDel(int gNo) throws Exception {
		travelService.deleteContent(gNo);
		System.out.println("deldel");
		return "redirect:makingList.tm";
	}
	
	@RequestMapping("makingReq.tm")
	public String makingReq(int gNo, Model model) throws Exception {
		GroupSpaceDTO content = travelService.getContent(gNo);
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		Map<String, Integer> map = travelService.getUserPos(id);
		
		SmallPosDTO posInfo1 = travelService.getPosInfo(map.get("pos1"));
		SmallPosDTO posInfo2 = travelService.getPosInfo(map.get("pos2"));
		
		model.addAttribute("content",content);
		model.addAttribute("id",id);
		model.addAttribute("pos1",map.get("pos1"));
		model.addAttribute("pos2",map.get("pos2"));
		model.addAttribute("posInfo1",posInfo1);
		model.addAttribute("posInfo2",posInfo2);
		return "/client/travel/makingReq";
	}
	
	@RequestMapping("makingReqPro.tm")
	public String makingReqPro(GroupRequestDTO dto) throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		dto.setId(id);
		//신청 처리하기
		travelService.applyForGroup(dto);
		return "redirect:makingList.tm";	
	}
	
	@RequestMapping("groupSpace.tm")
	public String groupSpace(int gNo, Model model) throws Exception {
		//그룹 방에 필요한 것: ①개설자가 볼 신청자 목록 ②현재 멤버 리스트 ③채팅 ④일정 ⑤갤러리 ⑥그룹 상태
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int idStatus = travelService.getMemStatus(gNo, id);
		//gNo 주고 해당 개설자 ID 가져오기(groupSpace테이블)
		GroupSpaceDTO grpSpace = travelService.getContent(gNo);
		String leader = grpSpace.getId();
		List grpMem = travelService.getMembers(gNo);
		List grpReq = travelService.getRequests(gNo);
		//일정 채팅 아직
		model.addAttribute("id",id);
		model.addAttribute("idStatus",idStatus);
		model.addAttribute("grpSpace",grpSpace);
		model.addAttribute("leader",leader);
		model.addAttribute("grpMem",grpMem);
		model.addAttribute("grpReq",grpReq);
		return "/client/travel/groupSpace";
	}
	
	
	@ResponseBody
	@RequestMapping("accepted.tm")
	public String accepted(@RequestBody Map<Object,Object> map) throws Exception {
		String requestId = (String)map.get("requestId");
		int gNo = Integer.parseInt((String)map.get("gNo"));
		System.out.println(requestId);
		System.out.println(gNo);
		//gNo에 신청한 ID를 그룹에 참여 처리
		travelService.acceptOrReject(requestId, gNo, 1);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString("true");
		return json;
	}
	
	@ResponseBody
	@RequestMapping("rejected.tm")
	public String rejected(@RequestBody Map<Object,Object> map) throws Exception {
		String requestId = (String)map.get("requestId");
		int gNo = (Integer)map.get("gNo");
		System.out.println(requestId);
		System.out.println(gNo);
		//gNo에 신청한 ID를 그룹에 거절 처리
		travelService.acceptOrReject(requestId, gNo, 2);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString("false");
		return json;
	}
	
	
	
}
