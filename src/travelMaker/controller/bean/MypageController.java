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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.fasterxml.jackson.databind.ObjectMapper;

import travelMaker.model.dao.ScheduleDAO;
import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.LandmarkBoardDTO;
import travelMaker.model.dto.LandmarkLikedDTO;
import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.model.dto.ScheduleDTO;
import travelMaker.model.dto.SmallPosDTO;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserRkDTO;
import travelMaker.service.bean.LandmarkService;
import travelMaker.service.bean.MemberService;
import travelMaker.service.bean.QnaReportService;
import travelMaker.service.bean.SharedService;
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
	@Autowired
	private LandmarkService landmarkService = null;
	@Autowired
	private SharedService sharedService = null;
	
	//마이페이지 홈
	@RequestMapping("myPage.tm")
	public String index(Model model) throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int ranking = memberService.getUserRanking(id)-1;
		TmUserDTO memInfo = memberService.getMember(id);
		List<SmallPosDTO> posList = memberService.getAllPositions();
		List rkList = memberService.getRk();
		
		if(memInfo.getPosition1()!=0) {
			SmallPosDTO pos1 = travelService.getPosInfo(memInfo.getPosition1());
			for(int i=0 ; i<posList.size() ; i++) {
				if(pos1!=null && pos1.getPosNo()==posList.get(i).getPosNo()){
					posList.remove(i);
				}
			}
			model.addAttribute("pos1",pos1);
		}
		if(memInfo.getPosition2()!=0) {
			SmallPosDTO pos2 = travelService.getPosInfo(memInfo.getPosition2());
			for(int i=0 ; i<posList.size() ; i++) {
				if(pos2!=null && pos2.getPosNo()==posList.get(i).getPosNo()){
					posList.remove(i);
				}
			}
			model.addAttribute("pos2",pos2);
		}
		
		model.addAttribute("id",id);
		model.addAttribute("ranking",ranking);
		model.addAttribute("memInfo",memInfo);
		model.addAttribute("rkList",rkList);
		model.addAttribute("posList",posList);
		
		return "client/mypage/myPage";
	}
	
	//첫번째 포지션 선택
	@ResponseBody
	@RequestMapping("posDcsn.tm")
	public String posDcsn(@RequestBody Map<String, Object> map) throws Exception {
		int num = (Integer)map.get("num");
		int posNo = (Integer)map.get("posNo");
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
	//	id가 1번째 결정을 했으면 posNo를 pos1에 넣고 posModi를 1로 바꿈
	//	id가 2번째 결정을 했으면 posNo를 pos2에 넣고 posModi를 2로 바꿈
		memberService.posDecision(id,num,posNo);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(map);
		return json;
	}
	
	//여행이력
	@RequestMapping("myHistory.tm")
	public String myHistory( Model model)throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int status = 1;
		
		//참여중인 여행 다 가져오기
		List travelAll = travelService.getMyGroups(id, status);
		model.addAttribute("travelAll", travelAll);
		
		
		// 내가 좋아요한 completedCont 가져오기
		List<GroupSpaceDTO> lsharedList = sharedService.getSharedLiked(id);
		for(int i=0;i<lsharedList.size();i++) {
			System.out.print(lsharedList.get(i).getSubject()+"/");
		}
		model.addAttribute("lsharedList", lsharedList);
		model.addAttribute("id", id);
		
		//System.out.println("sharedLikedlist 컨트롤러 오니?");
		
		return "client/mypage/myHistory";
	}
	
	
	//여행이력Cont
	@RequestMapping("myHistoryCont.tm")
	public String myHistoryCont(String gNo, Model model)throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		//총평
		List<GroupMemberDTO> reviewList = travelService.getReview(Integer.parseInt(gNo));
		
		/*
		if(reviewList==null) {
			GroupMemberDTO dto = new GroupMemberDTO();
			dto.setgNo(Integer.parseInt(gNo));
			reviewList.add(dto);
		}
		*/
		
		//본인 입력했는지 확인
		int result = travelService.chReview(Integer.parseInt(gNo), id);
		
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
			System.out.println("이프문위");
			System.out.println("포스리스트" + posList);
			if(posList.get(i) == -1) {   //포지션에 번호가 -1 이면
				System.out.println("이프문아래");
				int nomalCnt = travelService.posCount(Integer.parseInt(gNo),posList.get(i));
				posMem.put("일반",nomalCnt);
				model.addAttribute("nomalCnt",nomalCnt);
			}else { //그게아니면
				System.out.println("else안");
				SmallPosDTO dto = travelService.getPosInfo(posList.get(i));
				int posCnt = travelService.posCount(Integer.parseInt(gNo),posList.get(i));
				posMem.put(dto.getPosName(),posCnt);
			}
		}

		
		//갤러리
		List gList = travelService.getGroupImgs(Integer.parseInt(gNo));
		System.out.println("갤러리 사진있니?" +  gList);

		
		
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("gList",gList);
		model.addAttribute("getGroup", getGroup);
		model.addAttribute("scheList", scheList);
		model.addAttribute("posMem", posMem);
		model.addAttribute("gMem", gMem);
		model.addAttribute("result", result);
		
		
		
		return "client/mypage/myHistoryCont";
	}
	
	
	//코멘트 관리
	
	//나의 랜드마크
	@RequestMapping("myLand.tm")
	public String myLand(Model model) throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		List<LandmarkLikedDTO> list = landmarkService.myLandLiked(id);
		List<LandmarkBoardDTO> likedLand = new ArrayList();
		for(int i=0;i<list.size();i++) {
			int lNo = list.get(i).getlNo();
			LandmarkBoardDTO dto = landmarkService.getLand(lNo);
			likedLand.add(dto);
		}
		List writtenLand = landmarkService.myLand(id);
		model.addAttribute("wLand",writtenLand);
		model.addAttribute("lLand",likedLand);
		return "client/mypage/myLand";
	}
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