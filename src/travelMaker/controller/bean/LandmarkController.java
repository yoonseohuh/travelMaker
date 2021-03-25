package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		List land = landmarkService.getLand();
		model.addAttribute("land", land);		
		
		return "client/landmark/landmark";
	}
	
	// 랜드마크 페이지 데이터 가져오기 ajax 요청 
	@RequestMapping("landmarkList.tm")
	@ResponseBody
	public List landmarkList() throws SQLException {
		
		List land = landmarkService.getLand();
		
		return land;
	}
	
	// 랜드마크 작성 페이지
	@RequestMapping("landWrite.tm")
	public String landWriteForm(LandmarkBoardDTO dto) {
		// 좋아요 수 0으로 시작? 
		return "client/landmark/landWriteForm";
	}
	
	// 랜드마크 프로 페이지
	@RequestMapping("landWritePro.tm")
	public String landWritePro(LandmarkBoardDTO dto, Model model) throws SQLException {
		landmarkService.insertLand(dto); // 오토와이어드 해놓은 landmarkService를 쓴다음 고놈이 가지고 있는 insertLand를 사용한다. 
		model.addAttribute("land", dto); // model은 값이 들어갔는지 확인하기 위해 사용 되는 놈
		return "client/landmark/landWritePro";
	}
	
	// 내가 작성한 랜드마크
	
	
	
}
