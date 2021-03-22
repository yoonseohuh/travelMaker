package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		id = "test2";
		
		//List myGroupInfo = commentService.getMyGroup(id);
		//model.addAttribute("myGroupInfo", myGroupInfo);
		
		return "client/mypage/commentWrite";
	}

}
