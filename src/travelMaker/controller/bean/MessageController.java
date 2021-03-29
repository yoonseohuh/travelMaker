package travelMaker.controller.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import travelMaker.model.dto.MessageDTO;
import travelMaker.service.bean.MessageService;

@Controller
@RequestMapping("/msg/")
public class MessageController {
	
	
	@Autowired
	private MessageService messageService = null;
	
	@RequestMapping("message.tm")
	public String message(Model model) {
		
		//임시아이디
		String id = "smlee";
		
		// 보낸 쪽지 가져오기
		List senMsgList = messageService.getSenMsg(id);
		
		// 받은 쪽지 가져오기
		List recMsgList = messageService.getRecMsg(id); 
		
		model.addAttribute("senMsgList", senMsgList);
		model.addAttribute("recMsgList", recMsgList);
		
		
		
		return "client/message/message";
	}
	
	
	// 메세지 작성
	@RequestMapping("messageWrite.tm")
	public String messageWrite(String receiver, Model model) {
		model.addAttribute("receiver",receiver);
		return "client/message/messageWrite";
	}
	
	
	// 메세지 작성 pro
	@RequestMapping("messageWritePro.tm")
	public String messageWritePro(MessageDTO msgDto, Model model) {
		msgDto.setSender("smlee");
		int result = messageService.insertMsg(msgDto);
		model.addAttribute("result", result);
		
		return "client/message/messageWritePro";
	}
	
	//메세지 삭제
	
	@RequestMapping("messageDel.tm")
	public String messageDel(String msgNo) {
		System.out.println(); 
		return "client/message/messageDel";
	}
	
	

}
