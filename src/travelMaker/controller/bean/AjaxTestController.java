package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.service.bean.CommentService;
import travelMaker.service.bean.TravelService;

@Controller
@RequestMapping("/test/")
public class AjaxTestController {
	
	@Autowired
	private TravelService travelService = null;
	
	@Autowired
	private CommentService commentService = null;
	
	@RequestMapping("test.tm")
	public String test() {
		return "/client/travel/testFile";
	}

	
	public String testComment() {
		
		return "/client/mypage/testComment";
	}
	
	
	@ResponseBody
	@RequestMapping("ajaxIdAvail.tm")
	public ResponseEntity<String> ajaxIdAvail(String id) throws Exception{
		String result ="오와";

		

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");

		return new ResponseEntity<String>(result, responseHeaders, HttpStatus.OK);

					
		
			
		
		//HttpHeaders responseHeaders = new HttpHeaders();
		//responseHeaders.add("Content-Type", text/html;charset=utf-8);

		
	}
	
	
	@RequestMapping("select1.tm")
	@ResponseBody
	public Object test(int gNo) throws SQLException {
		System.out.println("에이작스테스트" + gNo);
		List memList = new ArrayList<GroupMemberDTO>();
		memList = commentService.getGMem(gNo);
		System.out.println("에이작스멤리스트" + ((GroupMemberDTO)memList.get(0)).getNickname());
       
		//Map<String, Object> msvo = new HashMap<String, Object>();
        //msvo.put("memList", memList);
		
		System.out.println("msvo출력" + memList);
		System.out.println("msvo리스트 출력" + ((GroupMemberDTO)memList.get(0)).getNickname());
		System.out.println("에이작스테스트");
				//partyService.sPartyGetMembershipDetail(no);
		return memList;
	}
}
