package travelMaker.controller.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.service.bean.QnaReportService;

@Controller
@RequestMapping("/qr/")
public class QnaReportController {
	
	@Autowired
	private QnaReportService qnaReportService = null;
	
	@RequestMapping("reportWrite.tm")
	public String reportWrite() {
		return "client/report/reportWriteForm";
	}

}
