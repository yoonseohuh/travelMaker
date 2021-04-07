package travelMaker.controller.bean;


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
import travelMaker.service.bean.LandmarkService;

@Controller
@RequestMapping("/land/")
public class LandmarkController {
	
	@Autowired
	private LandmarkService landmarkService = null;
	
	// 랜드마크 페이지
	@RequestMapping("landmark.tm")
	public String landmark(Model model) throws Exception{
		// 고유번호, 작성자, 장소명, 유형, 주소, 소개, 공개범위, x,y값
		
		List land = landmarkService.getLands();
		model.addAttribute("land", land);		
		
		return "client/landmark/landmark";
	}
	
	// 랜드마크 페이지 데이터 가져오기 ajax 요청 
	@RequestMapping("landmarkList.tm")
	@ResponseBody
	public List landmarkList() throws Exception {
		
		List land = landmarkService.getLands();
		
		return land;
	}
	
	// 랜드마크 클릭 시 랜드마크 가져오기
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
		System.out.println(lNo);
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
	
	//나의 랜드마크
	@RequestMapping("myLand.tm")
	public String myLand(HttpSession session, int lNo, Model model) throws Exception {
		// 구면인데 초면 같으신 분
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		//내가 작성한 랜마
		List myLand = landmarkService.myLand(id);
		model.addAttribute("memId", id);
		model.addAttribute("myLand", myLand);
		
		//내가 좋아요한 랜드마크
		List myLandLiked = landmarkService.myLandLiked(id, lNo);
		model.addAttribute("memId", id);
		model.addAttribute("lNo", lNo);
		model.addAttribute("myLandLiked", myLandLiked);
		
		return "client/mypage/myLand";
	}
	
	@RequestMapping("myLandDelete.tm")
	public String myLandDelete(int lNo) {
		System.out.println(lNo);
		return "client/mypage/myLandDelete";
	}
	
	@RequestMapping("myLandDeletePro.tm")
	public String myLandDeletePro(HttpSession session, String pw, String lNo) throws Exception{
		//아이디, 비밀번호 일치하는지 확인하는 메서드 
		// 맞으면 삭제해주는 메서드
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
	
	
	
	
	
	// 

	
	
}
