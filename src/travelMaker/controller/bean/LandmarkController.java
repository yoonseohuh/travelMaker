package travelMaker.controller.bean;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.fasterxml.jackson.databind.ObjectMapper;

import travelMaker.model.dto.LandmarkBoardDTO;
import travelMaker.model.dto.LandmarkLikedDTO;
import travelMaker.service.bean.LandmarkService;

@Controller
@RequestMapping("/land/")
public class LandmarkController {
	
	@Autowired
	private LandmarkService landmarkService = null;
	
	// 랜드마크 페이지
	@RequestMapping("landmark.tm")
	public String landmark(Model model) throws Exception{
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		List<LandmarkLikedDTO> list = landmarkService.myLandLiked(id);
		List<LandmarkBoardDTO> likedLand = new ArrayList();
		for(int i=0;i<list.size();i++) {
			int lNo = list.get(i).getlNo();
			System.out.println(lNo);
			LandmarkBoardDTO dto = landmarkService.getLand(lNo);
			likedLand.add(dto);
		}
		
		//좋아요한 랜드마크의 lNo만 int[]에 담아 보내준다
		int [] arr = new int[list.size()];
		for(int i=0; i<list.size(); i++) {
			arr[i]=list.get(i).getlNo();
		}
		model.addAttribute("lLand",likedLand);
		model.addAttribute("lNoArr",arr);
		
		return "client/landmark/landmark";
	}
	
	// 랜드마크 페이지 데이터 가져오기 ajax 요청 
	@RequestMapping("landmarkList.tm")
	@ResponseBody
	public List landmarkList() throws Exception {
		
		List land = landmarkService.getLands();
		
		return land;
	}
	
	//랜드마크 클릭 시 랜드마크 가져오기
	@ResponseBody
	@RequestMapping("landmarkCont.tm")
	public Map landmarkCont(@RequestBody Map<Object, Object> map) throws Exception {
		String lName = (String)map.get("lName");
		List land = landmarkService.getLands();
		int lNo = -1;
		for(int i=0 ; i<land.size() ; i++) {
			LandmarkBoardDTO lm = (LandmarkBoardDTO)land.get(i);
			if(lName.equals(lm.getlName())) {
				lNo = lm.getlNo();
			}
		}
		LandmarkBoardDTO cont = landmarkService.getLand(lNo);
		Map resMap = new HashMap();
		resMap.put("lNo",cont.getlNo());
		resMap.put("writer",cont.getWriter());
		resMap.put("lName",cont.getlName());
		resMap.put("lType",cont.getlType());
		resMap.put("addr",cont.getAddr());
		resMap.put("xLoc",cont.getxLoc());
		resMap.put("yLoc",cont.getyLoc());
		resMap.put("lCont",cont.getlCont());
		resMap.put("lOpen",cont.getlOpen());
		resMap.put("likedCnt",cont.getLikedCnt());		
		resMap.put("reg",cont.getReg());
		return resMap;
	}

	
	// 랜드마크 작성 페이지
	@RequestMapping("landWrite.tm")
	public String landWriteForm(LandmarkBoardDTO dto) throws Exception{
		
		return "client/landmark/landWriteForm";
	}
	
	// 랜드마크 프로 페이지
	@RequestMapping("landWritePro.tm")
	public String landWritePro(LandmarkBoardDTO dto, Model model) throws Exception {
		landmarkService.insertLand(dto); // 오토와이어드 해놓은 landmarkService를 쓴다음 고놈이 가지고 있는 insertLand를 사용한다. 
		model.addAttribute("land", dto); // model은 값이 들어갔는지 확인하기 위해 사용 되는 놈
		return "client/landmark/landWritePro";
	}
	
	//내가 작성한 랜드마크
	@ResponseBody
	@RequestMapping("myWrittenLand.tm")
	public List myWrittenLand() throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		List myLand = landmarkService.myLand(id);
		
		return myLand;
	}
	
	//내가 좋아요한 랜드마크
	@ResponseBody
	@RequestMapping("myLikedLand.tm")
	public List myLikedLand() throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		List<LandmarkLikedDTO> list = landmarkService.myLandLiked(id);
		List<LandmarkBoardDTO> likedLand = new ArrayList();
		for(int i=0;i<list.size();i++) {
			landmarkService.getLand(list.get(i).getlNo());
			likedLand.add(landmarkService.getLand(list.get(i).getlNo()));
		}
		return likedLand;
	}
	
	
	@RequestMapping("myLandDelete.tm")
	public String myLandDelete(int lNo) {
		System.out.println(lNo);
		return "client/mypage/myLandDelete";
	}
	
	@RequestMapping("myLandDeletePro.tm")
	public String myLandDeletePro(HttpSession session, String pw, String lNo) throws Exception{
		//아이디, 비밀번호 일치하는지 확인하는 메서드 
		//맞으면 삭제해주는 메서드
		//landmarkService.deleteMyLand(pw);
		System.out.println(pw);
		System.out.println(lNo);
		return "redirect:/myLand.tm";
	}
	
	@ResponseBody
	@RequestMapping("landmarkLiked.tm")
	public String landmarkLiked(@RequestBody Map<Object, Object> map) throws Exception {
		String id = (String)map.get("id");
		int lNo = Integer.parseInt((String)map.get("lNo"));
		landmarkService.landmarkLiked(id, lNo);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString("좋아요 완료");
		return json;
	}
	
}
