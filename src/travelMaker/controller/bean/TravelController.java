package travelMaker.controller.bean;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.fasterxml.jackson.databind.ObjectMapper;
import travelMaker.model.dto.GalleryDTO;
import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.SmallPosDTO;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserRkDTO;
import travelMaker.service.bean.TravelService;

@Controller
@RequestMapping("/travel/")
public class TravelController {

	@Autowired
	private TravelService travelService = null;
	
	@RequestMapping("makingWrite.tm")
	public String makingWrite(String pageNum, Model model) {
		model.addAttribute("pageNum",pageNum);
		return "/client/travel/makingWrite";
	}
	
	@RequestMapping("makingWritePro.tm")
	public String makingWritePro(String pageNum, GroupSpaceDTO dto, Model model) throws Exception {
		travelService.insertMaking(dto);
		model.addAttribute("pageNum",pageNum);
		return "redirect:makingList.tm";
	}
	
	@RequestMapping("makingList.tm")
	public String makingList(String pageNum, Model model) throws Exception {
		//유저 정보
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		model.addAttribute("id",id);
		UserRkDTO rkInfo = new UserRkDTO();
		if(id!=null) {			
			rkInfo = travelService.getMemRk(id);
		}else if(id==null) {
			rkInfo.setRkNo(0);
			rkInfo.setRkName("비로그인");
		}
		//모든 여행 가져와서 상태가 참여 중(1)인 것만 담음
		List JList = travelService.getMyGroups(id,1);
		model.addAttribute("joiningList",JList);		
		//모든 여행 가져와서 상태가 대기 중(0)인 것만 담음
		List WList = travelService.getMyGroups(id,0);
		model.addAttribute("waitingList",WList);

		//모집 중인 여행
		Map map = travelService.getArticles(pageNum);
		model.addAttribute("rkInfo",rkInfo);
		model.addAttribute("pageNum",map.get("pageNum"));
		model.addAttribute("pageSize",map.get("pageSize"));
		model.addAttribute("currPage",map.get("currPage"));
		model.addAttribute("start",map.get("start"));
		model.addAttribute("end",map.get("end"));
		model.addAttribute("count",map.get("count"));
		model.addAttribute("number",map.get("number"));
		model.addAttribute("articleList",map.get("articleList"));
		return "/client/travel/makingList";
	}
	
	@ResponseBody
	@RequestMapping("listSearch.tm")
	public String listSearch(String pageNum, @RequestBody Map<Object,Object> map) throws Exception {
	/*	인코딩처리
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8"); */
	//	검색(시작일,종료일)값을 각각 변수에 담아 매개변수로 보내줌
		String startD = (String)map.get("startD");
		String endD = (String)map.get("endD");
		System.out.println(startD);
		System.out.println(endD);
		Map listMap = new HashMap();
		listMap = travelService.getSearchArticles(pageNum, startD, endD);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(listMap);

		return json;
	}
	
	
	@RequestMapping("makingCont.tm")
	public String makingCont(String pageNum, int gNo, Model model) throws Exception {
		GroupSpaceDTO content = travelService.getContent(gNo);
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int writerGender = travelService.getGender(content.getId());
		int memIdGender = travelService.getGender(id);
		
		int memStatus = travelService.getMemStatus(gNo, id);
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("content",content);
		model.addAttribute("writerGender",writerGender);
		model.addAttribute("id",id);
		model.addAttribute("memIdGender",memIdGender);
		model.addAttribute("memStatus",memStatus);
		return "/client/travel/makingCont";
	}
	
	@RequestMapping("makingDel.tm")
	public String makingDel(int gNo) throws Exception {
		travelService.deleteContent(gNo);
		System.out.println("deldel");
		return "redirect:makingList.tm";
	}
	
	@RequestMapping("makingReq.tm")
	public String makingReq(int gNo, Model model) throws Exception {
		GroupSpaceDTO content = travelService.getContent(gNo);
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		Map<String, Integer> map = travelService.getUserPos(id);
		
		SmallPosDTO posInfo1 = travelService.getPosInfo(map.get("pos1"));
		SmallPosDTO posInfo2 = travelService.getPosInfo(map.get("pos2"));
		
		model.addAttribute("content",content);
		model.addAttribute("id",id);
		model.addAttribute("pos1",map.get("pos1"));
		model.addAttribute("pos2",map.get("pos2"));
		model.addAttribute("posInfo1",posInfo1);
		model.addAttribute("posInfo2",posInfo2);
		return "/client/travel/makingReq";
	}
	
	@RequestMapping("makingReqPro.tm")
	public String makingReqPro(GroupRequestDTO dto) throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		dto.setId(id);
		//신청 처리하기
		travelService.applyForGroup(dto);
		return "redirect:makingList.tm";	
	}
	
	@RequestMapping("groupSpace.tm")
	public String groupSpace(int gNo, Model model) throws Exception {
		//그룹 방에 필요한 것: ①개설자가 볼 신청자 목록 ②현재 멤버 리스트 ③채팅 ④일정 ⑤갤러리 ⑥그룹 상태
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int idStatus = travelService.getMemStatus(gNo, id);
		//gNo 주고 해당 개설자 ID 가져오기(groupSpace테이블)
		GroupSpaceDTO grpSpace = travelService.getContent(gNo);
		String leader = grpSpace.getId();
		List grpMem = travelService.getMembers(gNo);
		List grpReq = travelService.getRequests(gNo);
		//groupMember status가 0인 레코드만 뽑아서 groupRequest 정보를 담아 신청자 명단에 사용
		List<GroupRequestDTO> awaiters = new ArrayList<GroupRequestDTO>();
		for(int i=0;i<grpReq.size();i++) {
			GroupRequestDTO req = (GroupRequestDTO)grpReq.get(i);
			int status = travelService.getMemStatus(gNo, req.getId());
			if(status==0) {
				awaiters.add(req);
			}
		}
		
		
		//jbr여기부터...
		//status = 1 인 멤버들의 그룹리퀘스트dto
		List<GroupRequestDTO> joinMem = new ArrayList<GroupRequestDTO>();
		for(int i=0;i<grpReq.size();i++) {
			GroupRequestDTO req = (GroupRequestDTO)grpReq.get(i);
			int status = travelService.getMemStatus(gNo, req.getId());
			if(status==1) {
				joinMem.add(req);
			}
		}
		
		//joinMem의 posNo를 리스트에 담는다
		List<Integer> posList = new ArrayList<Integer>();
		for(int i = 0; i < joinMem.size(); i++) {
			posList.add(((GroupRequestDTO)joinMem.get(i)).getPosNo());
		}
		
		 System.out.println("포스넘 출려되니?" + posList);
		//중복제거..
		HashSet posListFin = new HashSet();
		posListFin.addAll(posList);
		posList.clear();
		posList.addAll(posListFin);

		System.out.println("포지션리스트" + posListFin);
		int nomalCnt = 0;
		Map map = new HashMap();
		
	
	/*	
		for(int i = 0; i < posList.size(); i++) {
			if(posList.get(i) == -1) {   //포지션에 번호가 -1 이면
				nomalCnt = nomalCnt + 1 ;   // +1추가
			}else { //그게아니면
			ListtravelService.getPosInfo(posList.get(i));
			}
		}
	*/	
		//jbr여기까지...
		
		
		
		
		//갤러리
		List gList = travelService.getGroupImgs(gNo);
		model.addAttribute("gList",gList);
		
		//일정 채팅 아직
		model.addAttribute("gNo",gNo);
		model.addAttribute("awaiters",awaiters);
		model.addAttribute("id",id);
		model.addAttribute("idStatus",idStatus);
		model.addAttribute("grpSpace",grpSpace);
		model.addAttribute("leader",leader);
		model.addAttribute("grpMem",grpMem);
		model.addAttribute("grpReq",grpReq);
		return "/client/travel/groupSpace";
	}
	
	
	@ResponseBody
	@RequestMapping("accepted.tm")
	public String accepted(@RequestBody Map<Object,Object> map) throws Exception {
		String requestId = (String)map.get("requestId");
		int gNo = Integer.parseInt((String)map.get("gNo"));
		System.out.println(requestId);
		System.out.println(gNo);
		//gNo에 신청한 ID를 그룹에 참여 처리 && groupSpace테이블에 actualNum +1 처리
		travelService.acceptOrReject(requestId, gNo, 1);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(requestId);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("rejected.tm")
	public String rejected(@RequestBody Map<Object,Object> map) throws Exception {
		String requestId = (String)map.get("requestId");
		int gNo = Integer.parseInt((String)map.get("gNo"));
		System.out.println(requestId);
		System.out.println(gNo);
		//gNo에 신청한 ID를 그룹에 거절 처리
		travelService.acceptOrReject(requestId, gNo, 2);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(requestId);
		return json;
	}
	
	@RequestMapping("uploadPro.tm")
	public String uploadPro(MultipartHttpServletRequest request) throws Exception {
												//ServletContext context
		MultipartFile mf = null;
		String finalName = null;
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			mf = request.getFile("img");
			long size = mf.getSize();
			String orgName = mf.getOriginalFilename();							//sample.jpg
			String imgName = orgName.substring(0, orgName.lastIndexOf('.'));	//sample
			String ext = orgName.substring(orgName.lastIndexOf('.'));
			long date = System.currentTimeMillis();
			finalName = imgName+date+ext;										//sample1616999640437.jpg

			String path = request.getRealPath("save");
			String imgPath = path+"\\"+finalName;
			File copyFile = new File(imgPath);					//D:\yoonseohuh\framework\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\travelMaker\save\sample1616999640437.jpg
			mf.transferTo(copyFile);
			System.out.println(copyFile);
			
			//서버 폴더에 저장된 이미지 복사해서 github에 공유하는 workspace에도 넣기
			fis = new FileInputStream(copyFile);
			fos = new FileOutputStream(new File("D:\\yoonseohuh\\framework\\workspace\\travelMaker\\tmGallery\\"+finalName));
			int readBuffer = 0;
            byte [] buffer = new byte[(int)copyFile.length()];
            System.out.println(copyFile.length());
            while((readBuffer = fis.read(buffer))!=-1) {
                fos.write(buffer, 0, readBuffer);
            }
            fis.close();
            fos.close();
            
			//DB에 저장
			GalleryDTO dto = new GalleryDTO();
			dto.setgNo(Integer.parseInt(request.getParameter("gNo")));
			dto.setWriter(request.getParameter("writer"));
			dto.setpRoot(finalName);
			travelService.uploadImage(dto);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		String gNo = request.getParameter("gNo");
		return "redirect:groupSpace.tm?gNo="+gNo;
	}
	
	@RequestMapping("gallery.tm")
	public String gallery(int gNo, Model model) throws Exception {
		GroupSpaceDTO grp = travelService.getContent(gNo);
		List list = travelService.getGroupImgs(gNo);
		model.addAttribute("grp",grp);
		model.addAttribute("list",list);
		return "/client/travel/gallery";
	}
	
	@RequestMapping("galleryLiked.tm")
	public String galleryLiked() throws Exception {
		return "";
	}
	
	
	
	
}
