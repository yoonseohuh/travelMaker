package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import travelMaker.model.dao.TmUserDAO;
import travelMaker.model.dto.ReportReasonDTO;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserRkDTO;
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
	
	//멤버 정보 수정 Form
	//회원 정보수정 버튼으로 id 넘겨 받음 
	@RequestMapping("memberModiForm.tm")
	public String memberModiForm(String id,Model model) {
		//id로 mem 전체 정보 받아오기
		TmUserDTO mem = memService.getMember(id);
		//posNo으로 posName 구하는 메서드
		String pName1 = memService.getPosName(mem.getPosition1());
		String pName2 = memService.getPosName(mem.getPosition2());
		//posNo,posName 전체 리스트로 가져오는 메서드
		List posList =  memService.getAllPos();
		model.addAttribute("mem", mem);
		model.addAttribute("pName1", pName1);
		model.addAttribute("pName2", pName2);
		model.addAttribute("posList", posList);
		
		return "admin/member/memberModi";
	}
	
	//멤버 정보 수정 Pro
	@RequestMapping("memberModiPro.tm")
	public String memberModiPro(TmUserDTO mem,Model model) {
		//Form에서 받은 정보를 update 해주는 메서드 
		memService.updateMember(mem);
		return "redirect:member.tm";
	}	
	
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
	
	//랭크 리스트
	@RequestMapping("rkPos.tm")
	public String rkPos(Model model) {
		List rkList = memService.getRk();
		int number = 1;
		model.addAttribute("rkList", rkList);
		model.addAttribute("number", number);
		return "admin/rankPosition/rkPos";
	}
	
	//랭크 추가
	@RequestMapping("addRk.tm")
	public String addRk(Model model) {
		List rkList = memService.getRk();
		int number = 1;
		model.addAttribute("rkList", rkList);
		model.addAttribute("number", number);
		System.out.println("rkList.size " + rkList.size());
		return "admin/rankPosition/addRk";
	}
	
	//랭크 추가 Pro
	@RequestMapping("addRkPro.tm")
	public String addRkPro(UserRkDTO rkdto) {
		//포지션 insert 시키는 메서드 작성 
		memService.insertRank(rkdto);
		return "redirect:rkPos.tm";
	}
	
	//랭크 수정
	@RequestMapping("modifyFormRk.tm")
	public String modifyRk(int rkNo,Model model) {
		//rNo으로 해당 포지션 정보 불러오는 메서드 
		UserRkDTO rdto = memService.getRkInfo(rkNo);
		//랭크 전체 보면 서 수정할 수 있도록 전체 불러오기.
		//하지만 지금하긴 귀찮은걸 keep
		model.addAttribute("rdto",rdto);
		return "admin/rankPosition/modifyFormRk";
	}
	
	//랭크 수정 Pro
	@RequestMapping("modifyProRk.tm")
	public String modifyRkPro(UserRkDTO rdto) {
		//랭크 update 하는 메서드 
		memService.updateRank(rdto);
		return "redirect:rkPos.tm";
	}
		
	//랭크 삭제
	@RequestMapping("deleteRk")
	public String deleteRk(String rkNo) {
		System.out.println("hi");
		System.out.println("rkNo: "+rkNo);
		return "redirect:rkPos.tm";
	}
	
}
