package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import travelMaker.service.bean.CommentService;

@Controller
@RequestMapping("/cmt/")
public class CommentController {
	
	@RequestMapping("comment.tm")
	public String comment(String id,Model model)throws SQLException {
		
		
		return "client/mypage/comment";
	}

}
