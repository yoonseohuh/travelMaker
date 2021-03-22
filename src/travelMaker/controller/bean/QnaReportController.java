package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.service.bean.QnaReportServiceImpl;

@Controller
@RequestMapping("/qr/")
public class QnaReportController {
	
	@Autowired
	private QnaReportServiceImpl qnaReportService = null;
	
	@RequestMapping("myQnaReportList.tm")
	public String myQnaReportList() {
		return "client/mypage/myQnaReportList";
	}	
	
	@RequestMapping("reportWriteForm.tm")
	public String reportWriteForm(int rType, Model model) throws SQLException {		
		List res = qnaReportService.selectReason(rType);
		model.addAttribute("res", res);
		model.addAttribute("rType", rType);
		return "client/report/reportWriteForm";
	}
	
	@RequestMapping("reportWritePro.tm")
	public String reportWritePro(int rNo, Model model) {
		model.addAttribute("rNo", rNo);
		return "client/report/reportWritePro";
	}	

}