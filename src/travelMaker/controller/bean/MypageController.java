package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import travelMaker.model.dao.ScheduleDAO;
import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.model.dto.ScheduleDTO;
import travelMaker.model.dto.SmallPosDTO;
import travelMaker.service.bean.MemberService;
import travelMaker.service.bean.QnaReportService;
import travelMaker.service.bean.TravelService;

@Controller
@RequestMapping("/my/")
public class MypageController {
	
	@Autowired
	private QnaReportService qnaReportService = null;
	@Autowired
	private TravelService travelService = null;
	@Autowired
	private MemberService memberService = null;
		
	//마이페이지 홈
	@RequestMapping("myPage.tm")
	public String index(Model model) {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int ranking = memberService.getUserRanking(id)-1;
		model.addAttribute("id",id);
		model.addAttribute("ranking",ranking);
		
		return "client/mypage/myPage";
	}
	
	//여행이력
	@RequestMapping("myHistory.tm")
	public String myHistory(Model model)throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int status = 1;
		
		//참여중인 여행 다 가져오기
		List travelAll = travelService.getMyGroups(id, status);
		
		model.addAttribute("travelAll", travelAll);
		
		
		return "client/mypage/myHistory";
	}
	
	
	//여행이력Cont
	@RequestMapping("myHistoryCont.tm")
	public String myHistoryCont(String gNo, Model model)throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		
		
		GroupSpaceDTO getGroup = travelService.getGroup(Integer.parseInt(gNo));
		List scheList = travelService.getSchedule(Integer.parseInt(gNo));
		List grpReq = travelService.getRequests(Integer.parseInt(gNo));
		List gMem = travelService.getMembers(Integer.parseInt(gNo));
				
		
		
		
		//status = 1 인 멤버들의 그룹리퀘스트dto
		List<GroupRequestDTO> joinMem = new ArrayList<GroupRequestDTO>();
		for(int i=0;i<grpReq.size();i++) {
			GroupRequestDTO req = (GroupRequestDTO)grpReq.get(i);
			int status = travelService.getMemStatus(Integer.parseInt(gNo), req.getId());
			if(status==1) {
				joinMem.add(req);
			}
		}
		
		//joinMem의 posNo를 리스트에 담는다
		List<Integer> posList = new ArrayList<Integer>();
		for(int i = 0; i < joinMem.size(); i++) {
			posList.add(((GroupRequestDTO)joinMem.get(i)).getPosNo());
		}
		
		//중복제거..
		HashSet posListFin = new HashSet();
		posListFin.addAll(posList);
		posList.clear();
		posList.addAll(posListFin);

		Map map = new HashMap();
		Map posMem = new HashMap(); 
		
		for(int i = 0; i < posList.size(); i++) { 
			if(posList.get(i) == -1) {   //포지션에 번호가 -1 이면
				int nomalCnt = travelService.posCount(Integer.parseInt(gNo),posList.get(i));
				posMem.put("일반",nomalCnt);
				model.addAttribute("nomalCnt",nomalCnt);
			}else { //그게아니면
				SmallPosDTO dto = travelService.getPosInfo(posList.get(i));
				int posCnt = travelService.posCount(Integer.parseInt(gNo),posList.get(i));
				posMem.put(dto.getPosName(),posCnt);
			}
		}

		
		//갤러리
		List gList = travelService.getGroupImgs(Integer.parseInt(gNo));

		
		
		model.addAttribute("gList",gList);
		model.addAttribute("getGroup", getGroup);
		model.addAttribute("scheList", scheList);
		model.addAttribute("posMem", posMem);
		model.addAttribute("gMem", gMem);
		
		
		
		return "client/mypage/myHistoryCont";
	}
	
	
	//코멘트 관리
	
	//나의 랜드마크
	
	//내정보 관리
	
	//문의게시판
	@RequestMapping("myQnaWrite.tm")
	public String myQnaWriteForm(int rType, String pageNum, Model model) throws SQLException {
		List res = qnaReportService.selectReason(rType);
		model.addAttribute("res", res);
		model.addAttribute("rType", rType);
		model.addAttribute("pageNum",pageNum);
		return "client/mypage/myQnaWriteForm";
	}
	
	@RequestMapping("myQnaWritePro.tm")
	public String myQnaWritePro(QnaBoardDTO dto, String pageNum, Model model) throws SQLException {
		String rCont = qnaReportService.getRCont(dto);
		dto.setrCont(rCont);
		qnaReportService.insertQna(dto);
		model.addAttribute("pageNum",pageNum);
		return "client/mypage/myQnaWritePro";
	}
	
	@RequestMapping("myQnaReportList.tm")
	public String myQnaReportList(String pageNum, Model model) throws SQLException {
		Map map = qnaReportService.getQnas(pageNum);
		
		model.addAttribute("pageNum",map.get("pageNum"));
		model.addAttribute("pageSize",map.get("pageSize"));
		model.addAttribute("currPage",map.get("currPage"));
		model.addAttribute("start",map.get("start"));
		model.addAttribute("end",map.get("end"));
		model.addAttribute("count",map.get("count"));
		model.addAttribute("number",map.get("number"));
		model.addAttribute("qnaList",map.get("qnaList"));
		return "client/mypage/myQnaReportList";
	}	
	
	
}