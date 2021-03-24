package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.model.dto.ReportReasonDTO;
import travelMaker.service.bean.QnaReportServiceImpl;

@Controller
@RequestMapping("/admin/")
public class AdminController {
		
	@Autowired
	private QnaReportServiceImpl qnaReportService = null;
	
	//관리자 홈
	@RequestMapping("index.tm")
	public String index() {
		return "admin/index";
	}
	
	//회원관리
	
	//그룹관리
	
	//문의관리
	@RequestMapping("qna.tm")
	public String qna(String pageNum, Model model) throws SQLException {
		Map map = qnaReportService.getQnas(pageNum);
		
		model.addAttribute("pageNum",map.get("pageNum"));
		model.addAttribute("pageSize",map.get("pageSize"));
		model.addAttribute("currPage",map.get("currPage"));
		model.addAttribute("start",map.get("start"));
		model.addAttribute("end",map.get("end"));
		model.addAttribute("count",map.get("count"));
		model.addAttribute("number",map.get("number"));
		model.addAttribute("qnaList",map.get("qnaList"));
		return "admin/qna/qna";
	}
	
	@RequestMapping("qnaCont.tm")
	public String qnaCont() throws SQLException {
		return "admin/qna/qnaCont";
	}
	
	@RequestMapping("qnaWrite.tm")
	public String qnaWrite() throws SQLException {
		return "admin/qna/qnaWrite";
	}
	
	@RequestMapping("qnaModi.tm")
	public String qnaModi() throws SQLException {
		return "admin/qna/qnaModi";
	}
	
	//신고관리
	@RequestMapping("report.tm")
	public String report(String pageNum, Model model) throws SQLException {
		Map map = qnaReportService.getReports(pageNum);
		
		model.addAttribute("pageNum",map.get("pageNum"));
		model.addAttribute("pageSize",map.get("pageSize"));
		model.addAttribute("currPage",map.get("currPage"));
		model.addAttribute("start",map.get("start"));
		model.addAttribute("end",map.get("end"));
		model.addAttribute("count",map.get("count"));
		model.addAttribute("number",map.get("number"));
		model.addAttribute("qnaList",map.get("qnaList"));
		return "admin/report/report";
	}
	
	@RequestMapping("reportCont.tm")
	public String reportCont() throws SQLException {
		return "admin/report/reportCont";
	}
	
	@RequestMapping("reportWrite.tm")
	public String reportWrite() throws SQLException {
		return "admin/report/reportWrite";
	}
	
	@RequestMapping("reportModi.tm")
	public String reportModi() throws SQLException {
		return "admin/report/reportModi";
	}
	
	//신고사유/문의유형
	@RequestMapping("reason.tm")
	public String reason(Model model) throws SQLException {
		List res = qnaReportService.selectReasonAll();
		model.addAttribute("res", res);
		return "admin/reason/reason";
	}
	
	@RequestMapping("reasonInsert.tm")
	public String reasonInsert(ReportReasonDTO dto) throws SQLException {		
		qnaReportService.insertReason(dto);
		return "redirect:reason.tm";
	}
	
	//공지사항
	
	//포지션/레벨
	
	
}
