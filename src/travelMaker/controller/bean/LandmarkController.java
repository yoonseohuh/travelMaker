package travelMaker.controller.bean;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.model.dto.LandmarkBoardDTO;
import travelMaker.service.bean.LandmarkService;

@Controller
@RequestMapping("/land/")
public class LandmarkController {
	
	@Autowired
	private LandmarkService landmarkService = null;
	
	// 랜드마크 페이지
	@RequestMapping("landmark.tm")
	public String landmark() {
		// 고유번호, 작성자, 장소명, 유형, 주소, 소개, 공개범위, x,y값
		return "client/landmark/landmark";
	}
	
	// 랜드마크 작성 페이지
	@RequestMapping("landWrite.tm")
	public String landWriteForm(LandmarkBoardDTO dto) {
		// 고유번호, 작성자, 장소명, 유형, 주소, 소개, 공개범위, x,y값 
		// 좋아요 수 0으로 시작
		int likedCnt = 0;
		
		
		return "client/landmark/landWriteForm";
	}
	
	// 랜드마크 프로 페이지
	@RequestMapping("landWritePro.tm")
	public String landWritePro(LandmarkBoardDTO dto, Model model) throws SQLException {
		landmarkService.insertLand(dto);
		model.addAttribute("land", dto);
		return "client/landmark/landWritePro";
	}
	
	
}
