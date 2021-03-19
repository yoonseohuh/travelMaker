package travelMaker.controller.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.service.bean.QnaReportService;

@Controller
@RequestMapping("/qr/")
public class QnaReportController {
	
	@RequestMapping("reportWriteForm.tm")
	public String reportWriteForm() {
		return "client/report/reportWriteForm";
	}
	
	@RequestMapping("reportWritePro.tm")
	public String reportWritePro() {
		return "client/report/reportWritePro";
	}
	

}
