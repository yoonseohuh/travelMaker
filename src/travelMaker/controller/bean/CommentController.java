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
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserCmtDTO;
import travelMaker.service.bean.CommentService;

@Controller
@RequestMapping("/cmt/")
public class CommentController {
	
	@Autowired
	private CommentService commentService = null;
	
	//코멘트 조회 페이지
	@RequestMapping("comment.tm")
	public String comment(String id,Model model)throws SQLException {
		
		id = "test4"; //임시 아이디 테스트
		//여행목록 가져옴
		List dtoList = commentService.getMyGroup(id);
		
		
		//그룹멤버들dto로 가져옴
		List fin = commentService.groupUser(id);
		
		
		
		// 여행 갯수 가져옴
		int count = commentService.countGroup(id);
		
		//받는사람이 사용자인 userCmtDTO가져오기
		List comRecUser = commentService.comRecUser(id);
		
		// 보낸사람이 사용자인 userCmtDTO가져오기
		List comSenUser = commentService.comSenUser(id);
		
		
		
		System.out.println("갔다");
		model.addAttribute("dtoList", dtoList);
		model.addAttribute("fin", fin);
		model.addAttribute("count", count);
		model.addAttribute("comRecUser", comRecUser);
		model.addAttribute("comSenUser", comSenUser);
		
		System.out.println("받은사람 :" + ((UserCmtDTO)comRecUser.get(1)).getSender());
		System.out.println("왔다");
		
		return "client/mypage/comment";
	}

	
	//코멘트 작성 프로 페이지
	@RequestMapping("commentWritePro.tm")
	public String commentWritePro(String id, String groupNum, String groupMem, String comment, Model model) {
		
		commentService.insertCom(id, groupNum, groupMem, comment);
		
		
		model.addAttribute("groupNum", groupNum);
		model.addAttribute("groupMem", groupMem);
		model.addAttribute("comment", comment);
		
		return "client/mypage/commentWritePro";
	}

}
