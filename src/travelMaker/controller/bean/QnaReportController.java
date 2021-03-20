package travelMaker.controller.bean;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.model.dto.ReportReasonDTO;
import travelMaker.service.bean.QnaReportServiceImpl;

@Controller
@RequestMapping("/qr/")
public class QnaReportController {
	
	@Autowired
	private QnaReportServiceImpl qnaReportService = null;
	
	@RequestMapping("reportWriteForm.tm")
	public String reportWriteForm() {
		return "client/report/reportWriteForm";
	}
	
	@RequestMapping("reportWritePro.tm")
	public String reportWritePro() {
		return "client/report/reportWritePro";
	}
	
	@RequestMapping("reason.tm")
	public String reason() {
		return "admin/qnaReport/reason";
	}
	
	@RequestMapping("reasonInsert.tm")
	public String reasonInsert(ReportReasonDTO dto) throws SQLException {
		
		qnaReportService.addReason(dto);
		
		return "redirect:reason.tm";
	}

}