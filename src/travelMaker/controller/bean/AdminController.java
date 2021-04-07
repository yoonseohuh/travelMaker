package travelMaker.controller.bean;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import travelMaker.model.dao.TmUserDAO;
import travelMaker.model.dto.GalleryDTO;
import travelMaker.model.dto.ReportReasonDTO;
import travelMaker.model.dto.SmallPosDTO;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserRkDTO;
import travelMaker.service.bean.MemberService;
import travelMaker.service.bean.QnaReportServiceImpl;
import travelMaker.service.bean.TravelService;

@Controller
@RequestMapping("/admin/")
public class AdminController {
		
	@Autowired
	private QnaReportServiceImpl qnaReportService = null;
	
	@Autowired
	private MemberService memService = null;
	
	@Autowired
	private TravelService travelService = null;
	
	
	//관리자 홈
	@RequestMapping("index.tm")
	public String index() {
		return "admin/index";
	}
	
	//회원관리
	
	//멤버 리스트 정렬 
	@RequestMapping("member.tm")
	public String member(String pageNum, HttpServletRequest request, Model model) {
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
	@RequestMapping("adminGroup.tm")
	public String adminGroup(String sel, String search, Model model) {
		System.out.println("sel입니당" + sel);
		System.out.println("search입니당" +search);
		
		
		List searchGroupList = new ArrayList();
		List groupAllList = new ArrayList();
		int groupAllCnt = 0;
		int searchGroupCtn = 0;
		
		if(sel != null & search != null) {
			
			if(sel.equals("loc")) {		
				if(search.equals("서울")) {
					search = "seoul";
				}else if(search.equals("인천")) {
					search = "incheon";
				}else if(search.equals("경기도")) {
					search = "gyunggi";
				}else if(search.equals("강원도")) {
					search = "gangwon";
				}else if(search.equals("세종")) {
					search = "sejong";
				}else if(search.equals("대전")) {
					search = "daejeon";
				}else if(search.equals("충청남도")) {
					search = "chungnam";
				}else if(search.equals("충청북도")) {
					search = "chungbuk";
				}else if(search.equals("광주")) {
					search = "gwangju";
				}else if(search.equals("전라남도")) {
					search = "jeonnam";
				}else if(search.equals("전라북도")) {
					search = "jeonbuk";
				}else if(search.equals("부산")) {
					search = "busan";
				}else if(search.equals("울산")) {
					search = "ulsan";
				}else if(search.equals("대구")) {
					search = "daegu";
				}else if(search.equals("경상남도")) {
					search = "gyungnam";
				}else if(search.equals("경상북도")) {
					search = "gyungbuk";
				}else if(search.equals("제주도")) {
					search = "jeju";
				}
			}
			//검색결과 리스트 담기
			searchGroupList = travelService.searchGroupList(sel, search);
			searchGroupCtn = travelService.searchGroupCtn(sel, search);
				
			}else {
				groupAllList = travelService.groupAllList();
				groupAllCnt = travelService.groupAllCnt();
		}
		
		model.addAttribute("sel", sel);
		model.addAttribute("search", search);
		model.addAttribute("groupAllList", groupAllList);
		model.addAttribute("searchGroupList", searchGroupList);
		model.addAttribute("searchGroupCtn", searchGroupCtn);
		model.addAttribute("groupAllCnt", groupAllCnt);
		
		return "admin/travel/adminGroup";
	}
	
	
	
	
	
	
	
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
	
	//포지션/랭크
	
	//랭크 리스트
	@RequestMapping("rkPos.tm")
	public String rkPos(Model model) {
		List rkList = memService.getRk();
		int number = 1;
		model.addAttribute("rkList", rkList);
		model.addAttribute("number", number);
		return "admin/rankPosition/rkPos";
	}
	
	//랭크 추가 Pro
	@RequestMapping("addRkPro.tm")
	public String addRkPro(UserRkDTO rkdto) {
		//랭크 insert 시키는 메서드 작성 
		memService.insertRank(rkdto);
		return "redirect:rkPos.tm";
	}

	//랭크 수정
	@RequestMapping("modifyFormRk.tm")
	public String modifyRk(int rkNo,Model model) {
		//rNo으로 해당 랭크 정보 불러오는 메서드 
		UserRkDTO rdto = memService.getRkInfo(rkNo);
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
	@RequestMapping("deleteRk.tm")
	public String deleteRk(String rkNo) {
		//rkNo으로 랭크 삭제하는 메서드
		//int rkNo1 = Integer.parseInt(rkNo);
		System.out.println(rkNo);
		memService.deleteRk(rkNo); 
		 
		return "redirect:rkPos.tm";
	}


	//포지션 추가 Pro
	@RequestMapping("addSPosPro.tm")
	public String addSPos(SmallPosDTO spdto, MultipartHttpServletRequest request)throws Exception {
		//포지션 insert 시키는 메서드 
		MultipartFile mf = null;
		String newName = null;
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			
			//파일 정보 담기.
			mf = request.getFile("img");
			long size = mf.getSize();
			System.out.println(size);
			
			//이름 중복처리하여 저장시키는 버전.
			// 오리지널 파일명 가져오기 
			String orgName = mf.getOriginalFilename();
			System.out.println("orgName:" + orgName);
			//이름 나누기 확장자 빼기
			String imgName = orgName.substring(0, orgName.lastIndexOf('.'));
			System.out.println("imgName: "+imgName);
			// 확장자 가져오기
			String ext = orgName.substring(orgName.lastIndexOf('.'));
			System.out.println("ext : " + ext);
			// 시간 추가한 새이름 저장될 이름!
			long date= System.currentTimeMillis();
			newName= imgName + date + ext;
			System.out.println("newName:" + newName);
			//파일 저장
			String path = request.getRealPath("/resources/upload"); 
			System.out.println("path:" + path);
			String imgPath = path + "\\" + newName;
			System.out.println("imgPath :" +imgPath);
			File copyFile = new File(imgPath);
			mf.transferTo(copyFile);
			spdto.setPosRoot(newName);
			
			//서버 폴더에 저장된 이미지 복사해서 github에 공유하는 workspace에도 넣기
			fis = new FileInputStream(copyFile);
			fos = new FileOutputStream(new File("D:\\hun2\\project2\\travelMaker\\tmGallery\\posIcon\\"+newName));
			int readBuffer = 0;			
            byte [] buffer = new byte[(int)copyFile.length()];
            System.out.println(copyFile.length());
            while((readBuffer = fis.read(buffer))!=-1) {
                fos.write(buffer, 0, readBuffer);
            }
            fis.close();
            fos.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		//포지션 추가하는 메서드 
		memService.addSPos(spdto);
		return "redirect:posList.tm";
	}
	//포지션 수정
	@RequestMapping("modifyFormPos.tm")
	public String modifyFormPos(int posNo,Model model) {
		//posNo으로 해당 포지션 정보 불러오는 메서드 
		SmallPosDTO spdto = memService.getSPosInfo(posNo);
		System.out.println(spdto.getPosName());
		model.addAttribute("spdto",spdto);
		return "admin/rankPosition/modifyFormPos";
	}
	
	//포지션 수정 Pro
	@RequestMapping("modifyProPos.tm")
	public String modifyProPos(SmallPosDTO spdto, MultipartHttpServletRequest request) {
		//포지션 insert 시키는 메서드 
		MultipartFile mf = null;
		String newName = null;
		FileInputStream fis = null;
		FileOutputStream fos = null;
		SmallPosDTO spdtoEx = memService.getSPosInfo(spdto.getPosNo());
		//만약에 넘어오는 파일경로가 없으면 이전 경로로 넣어줌.
		System.out.println("변경된 경로 : "+spdto.getPosRoot());
		System.out.println("이전경로: "+spdtoEx.getPosRoot());
		mf = request.getFile("img");
		String orgName = mf.getOriginalFilename();
		if(orgName==null||orgName==""||orgName.equals(null)) {
			spdto.setPosRoot(spdtoEx.getPosRoot());
		}else {
			try {
				
				//파일 정보 담기.
				mf = request.getFile("img");
				System.out.println("mf:" +mf);
				long size = mf.getSize();
				System.out.println(size);
				
				//이름 중복처리하여 저장시키는 버전.
				// 오리지널 파일명 가져오기 
				 orgName = mf.getOriginalFilename();
					
						System.out.println("orgName:" + orgName);
						//이름 나누기 확장자 빼기
						String imgName = orgName.substring(0, orgName.lastIndexOf('.'));
						System.out.println("imgName: "+imgName);
						// 확장자 가져오기
						String ext = orgName.substring(orgName.lastIndexOf('.'));
						System.out.println("ext : " + ext);
						// 시간 추가한 새이름 저장될 이름!
						long date= System.currentTimeMillis();
						newName= imgName + date + ext;
						System.out.println("newName:" + newName);
						//파일 저장
						String path = request.getRealPath("/resources/upload"); 
						System.out.println("path:" + path);
						String imgPath = path + "\\" + newName;
						System.out.println("imgPath :" +imgPath);
						File copyFile = new File(imgPath);
						mf.transferTo(copyFile);
						spdto.setPosRoot(newName);
						
						//서버 폴더에 저장된 이미지 복사해서 github에 공유하는 workspace에도 넣기
						fis = new FileInputStream(copyFile);
						fos = new FileOutputStream(new File("D:\\hun2\\project2\\travelMaker\\tmGallery\\posIcon\\"+newName));
						int readBuffer = 0;			
			            byte [] buffer = new byte[(int)copyFile.length()];
			            System.out.println(copyFile.length());
			            while((readBuffer = fis.read(buffer))!=-1) {
			                fos.write(buffer, 0, readBuffer);
			            }
			            fis.close();
			            fos.close();
					//else
			}catch(Exception e) {
				e.printStackTrace();
			}//try
		}//else
			/*
			 * if(orgName==null || orgName=="" || orgName.equals(null)) {
						spdto.setPosRoot(spdtoEx.getPosRoot());
						System.out.println("root: "+spdto.getPosRoot());
					}else {
			 */
		
		//포지션 update 하는 메서드 
		memService.updatePos(spdto);
		return "redirect:posList.tm";
	}
	
	//포지션 삭제
	@RequestMapping("deletePos.tm")
	public String deletePos(String posNo) {
		//rkNo으로 랭크 삭제하는 메서드
		memService.deletePos(posNo); 
		 
		return "redirect:posList.tm";
	}
	
	//pos 대분류 선택
	@ResponseBody
	@RequestMapping("posSel.tm")
	public String posSel(@RequestBody Map<Object,Object> map,Model model) throws Exception {
		String posCate = (String)map.get("posCate");
		String pageNum = (String)map.get("pageNum");
		//posList 로 List 당마오는 메서드 작성 
		System.out.println(pageNum);
		System.out.println(posCate);
		Map mmap = new HashMap();
		List sPosList = memService.selPosList(posCate);
		mmap.put("sPosList", sPosList);
		//전체 눌렀을 때 
		if(posCate=="0") {
			mmap = memService.getPositions(pageNum);
			model.addAttribute("pageNum", mmap.get("pageNum"));
			model.addAttribute("pageSize", mmap.get("pageSize"));
			model.addAttribute("currPage", mmap.get("currPage"));
			model.addAttribute("startRow", mmap.get("startRow"));
			model.addAttribute("endRow", mmap.get("endRow"));
			model.addAttribute("number", mmap.get("number"));
			model.addAttribute("count", mmap.get("count"));
			model.addAttribute("sPosList", mmap.get("sPosList"));
		}
		
		System.out.println(sPosList);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(mmap);
		
		return  json;
	}
	//포지션 리스트 ajax 데이터 받는 페이지 
	
	
	//포지션 리스트 
	@RequestMapping("posList.tm")
	public String smallPos(String pageNum,HttpServletRequest request, Model model) {
		//포지션 대분류 리스트
		//포지션 소분류 리스트
		//Map으로  list, request, pageNum등을 받아오는 메서드 작성 
		Map every = memService.getPositions(pageNum);
		model.addAttribute("pageNum", every.get("pageNum"));
		model.addAttribute("pageSize", every.get("pageSize"));
		model.addAttribute("currPage", every.get("currPage"));
		model.addAttribute("startRow", every.get("startRow"));
		model.addAttribute("endRow", every.get("endRow"));
		model.addAttribute("number", every.get("number"));
		model.addAttribute("count", every.get("count"));
		model.addAttribute("sPosList", every.get("sPosList"));
		return "admin/rankPosition/posList";
	}
}
