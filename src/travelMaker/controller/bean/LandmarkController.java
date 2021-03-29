package travelMaker.controller.bean;

import java.sql.SQLException;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import travelMaker.model.dto.LandmarkBoardDTO;
import travelMaker.service.bean.LandmarkService;

@Controller
@RequestMapping("/land/")
public class LandmarkController {
	
	@Autowired
	private LandmarkService landmarkService = null;
	
	// 랜드마크 페이지
	@RequestMapping("landmark.tm")
	public String landmark(Model model) throws SQLException{
		// 고유번호, 작성자, 장소명, 유형, 주소, 소개, 공개범위, x,y값
		List land = landmarkService.getLands();
		model.addAttribute("land", land);		
		
		return "client/landmark/landmark";
	}
	
	// 랜드마크 페이지 데이터 가져오기 ajax 요청 
	@RequestMapping("landmarkList.tm")
	@ResponseBody
	public List landmarkList() throws SQLException {
		
		List land = landmarkService.getLands();
		
		return land;
	}
	
	// 랜드마크 클릭 시 랜드마크 가져오기
	@RequestMapping("landmarkCont.tm")
	public String landmarkCont(int lNo, Model model) throws SQLException {
		 LandmarkBoardDTO land =  landmarkService.getLand(lNo);
		 System.out.println(land);
		 model.addAttribute("land", land);
		return "client/landmark/landmarkCont";
	}

	
	// 랜드마크 작성 페이지
	@RequestMapping("landWrite.tm")
	public String landWriteForm(LandmarkBoardDTO dto) {
		
		return "client/landmark/landWriteForm";
	}
	
	// 랜드마크 프로 페이지
	@RequestMapping("landWritePro.tm")
	public String landWritePro(LandmarkBoardDTO dto, Model model) throws SQLException {
		landmarkService.insertLand(dto); // 오토와이어드 해놓은 landmarkService를 쓴다음 고놈이 가지고 있는 insertLand를 사용한다. 
		model.addAttribute("land", dto); // model은 값이 들어갔는지 확인하기 위해 사용 되는 놈
		return "client/landmark/landWritePro";
	}
	
	//나의 랜드마크
	@RequestMapping("myLand.tm")
	public String myLand(HttpSession session, Model model) throws SQLException {
		// 구면인데 초면 같으신 분
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		//내가 작성한 랜마
		List myLand = landmarkService.myLand(id);
		model.addAttribute("memId", id);
		model.addAttribute("myLand", myLand);
		//내가 좋아요한 랜마 이건 나중에 추가
		return "client/mypage/myLand";
	}
	
	@RequestMapping("myLandDelete.tm")
	public String myLandDelete(HttpSession session) {
		
		return "client/mypage/myLandDelete";
	}
	
	
	
	// 

	
	
}
