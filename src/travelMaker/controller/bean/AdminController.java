package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import travelMaker.model.dto.ReportReasonDTO;
import travelMaker.service.bean.MemberService;
import travelMaker.service.bean.QnaReportServiceImpl;

@Controller
@RequestMapping("/admin/")
public class AdminController {
		
	@Autowired
	private QnaReportServiceImpl qnaReportService = null;
	
	@Autowired
	private MemberService memService = null;
	
	//관리자 홈
	@RequestMapping("index.tm")
	public String index() {
		return "admin/index";
	}
	
	//회원관리
	
	//멤버 리스트 정렬 
	@RequestMapping("member.tm")
	public String member(String pageNum, HttpServletRequest request, Model model) {
		System.out.println(1);
		System.out.println(pageNum);
		Map every = memService.getMembers(pageNum);
		model.addAttribute("request", request);
		model.addAttribute("pageNum", every.get("pageNum"));
		model.addAttribute("pageSize", every.get("pageSize"));
		model.addAttribute("currPage", every.get("currPage"));
		model.addAttribute("startRow", every.get("startRow"));
		model.addAttribute("endRow", every.get("endRow"));
		model.addAttribute("number", every.get("number"));
		model.addAttribute("count", every.get("count"));
		model.addAttribute("memList", every.get("memList"));
		model.addAttribute("search", every.get("search"));
		return "admin/member/memberList";
	}
	//그룹관리
	
	//신고/문의관리
	@RequestMapping("qnaReport.tm")
	public String qnaReport() throws SQLException {
		return "admin/qnaReport/qnaReport";
	}
	
	@RequestMapping("qnaReportCont.tm")
	public String qnaReportCont() throws SQLException {
		return "admin/qnaReport/qnaReportCont";
	}
	
	@RequestMapping("qnaReportWrite.tm")
	public String qnaReportWrite() throws SQLException {
		return "admin/qnaReport/qnaReportWrite";
	}
	
	@RequestMapping("qnaReportModi.tm")
	public String qnaReportModi() throws SQLException {
		return "admin/qnaReport/qnaReportModi";
	}
	
	//신고사유/문의유형
	@RequestMapping("reason.tm")
	public String reason(Model model) throws SQLException {
		List res = qnaReportService.selectReasonAll();
		model.addAttribute("res", res);
		return "admin/qnaReport/reason";
	}
	
	@RequestMapping("reasonInsert.tm")
	public String reasonInsert(ReportReasonDTO dto) throws SQLException {		
		qnaReportService.insertReason(dto);
		return "redirect:reason.tm";
	}
	
	//공지사항
	
	//포지션/레벨
	
	
}
