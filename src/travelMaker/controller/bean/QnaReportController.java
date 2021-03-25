package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import travelMaker.service.bean.QnaReportServiceImpl;

@Controller
@RequestMapping("/qr/")
public class QnaReportController {
	
	@Autowired
	private QnaReportServiceImpl qnaReportService = null;	
	
	//신고사유/문의유형
	@RequestMapping("reportWriteForm.tm")
	public String reportWriteForm(int rType, String idx, Model model) throws SQLException {		
		List res = qnaReportService.selectReason(rType);
		model.addAttribute("res", res);
		model.addAttribute("rType", rType);
		model.addAttribute("idx", idx);
		return "client/report/reportWriteForm";
	}
	
	@RequestMapping("reportWritePro.tm")
	public String reportWritePro(int rNo, int rType, String memId, String idx, Model model) {
		model.addAttribute("rNo", rNo);
		model.addAttribute("rType", rType);
		model.addAttribute("memId", memId);
		model.addAttribute("idx", idx);
		return "client/report/reportWritePro";
	}
	
	
	//신고 테스트 페이지
	@RequestMapping("reportTest.tm")
	public String reportWritePro() {
		return "client/report/reportTest";
	}

}