package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.service.bean.QnaReportServiceImpl;

@Controller
@RequestMapping("/my/")
public class MypageController {
	
	@Autowired
	private QnaReportServiceImpl qnaReportService = null;
	
	//마이페이지 홈
	@RequestMapping("myPage.tm")
	public String index() {		
		return "client/mypage/myPage";
	}
	
	//여행이력
	
	//코멘트 관리
	
	//나의 랜드마크
	
	//내정보 관리
	
	//문의 및 신고
	@RequestMapping("myQnaReportList.tm")
	public String myQnaReportList() {
		return "client/mypage/myQnaReportList";
	}
	
	@RequestMapping("myQnaWrite.tm")
	public String myQnaWriteForm(int rType, Model model) throws SQLException {
		List res = qnaReportService.selectReason(rType);
		model.addAttribute("res", res);
		model.addAttribute("rType", rType);
		return "client/mypage/myQnaWriteForm";
	}
	
	@RequestMapping("myQnaWritePro.tm")
	public String myQnaWritePro(QnaBoardDTO dto) throws SQLException {
		qnaReportService.insertQna(dto);
		return "client/mypage/myQnaWritePro";
	}
	
}