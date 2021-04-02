package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.service.bean.QnaReportServiceImpl;
import travelMaker.service.bean.TravelService;

@Controller
@RequestMapping("/my/")
public class MypageController {
	
	@Autowired
	private QnaReportServiceImpl qnaReportService = null;
	
	@Autowired
	private TravelService travelService = null;
	
	//마이페이지 홈
	@RequestMapping("myPage.tm")
	public String index() {		
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