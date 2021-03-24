package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.service.bean.CommentService;

@Controller
@RequestMapping("/cmt/")
public class CommentController {
	
	@Autowired
	private CommentService commentService = null;
	
	//코멘트 조회 페이지
	@RequestMapping("comment.tm")
	public String comment(String id,Model model)throws SQLException {
		
		
		return "client/mypage/comment";
	}
	
	
	//코멘트 작성 페이지
	@RequestMapping("commentWrite.tm")
	public String commentWrite(String id, Model model)throws SQLException {
		
		id = "test4"; //임시 아이디 테스트
		//여행목록 가져옴
		List dtoList = commentService.getMyGroup(id);
		
		
		//그룹멤버들dto로 가져옴
		List fin = commentService.groupUser(id);
		
		
		model.addAttribute("dtoList", dtoList);
		model.addAttribute("fin", fin);
	
		return "client/mypage/commentWrite";
	}
	
	//코멘트 작성 프로 페이지
	@RequestMapping("commentWritePro.tm")
	public String commentWritePro(String groupNum, String mem, String comment, Model model) {
		
		Map map = new HashMap();
		map.put("groupNum", groupNum);
		map.put("groupNum", groupNum);
		map.put("groupNum", groupNum);
		
	
		
		model.addAttribute("groupNum", groupNum);
		model.addAttribute("mem", mem);
		model.addAttribute("comment", comment);
		
		return "client/mypage/commentWritePro";
	}

}
