package travelMaker.controller.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import travelMaker.model.dto.MessageDTO;
import travelMaker.service.bean.MessageService;

@Controller
@RequestMapping("/msg/")
public class MessageController {
	
	
	@Autowired
	private MessageService messageService = null;
	
	@RequestMapping("message.tm")
	public String message(Model model) {
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		//임시아이디
		//String id = "test4";
		
		// 보낸 쪽지 가져오기
		List senMsgList = messageService.getSenMsg(id);
		
		// 받은 쪽지 가져오기
		List recMsgList = messageService.getRecMsg(id); 

		// 사용자가 받은 쪽지 카운트
		int recMsgCnt = messageService.recMsgCnt(id);
		
		//사용자가 보낸 쪽지 카운트
		int senMsgCnt = messageService.senMsgCnt(id);
		
		
		model.addAttribute("senMsgList", senMsgList);
		model.addAttribute("recMsgList", recMsgList);
		model.addAttribute("recMsgCnt", recMsgCnt);
		model.addAttribute("senMsgCnt", senMsgCnt);
		return "client/message/message";
	}
	
	
	// 메세지 작성
	@RequestMapping("messageWrite.tm")
	public String messageWrite(String receiver, Model model, String reply) {
		System.out.println("답장받는사람" + reply);
		
		model.addAttribute("receiver",receiver);
		model.addAttribute("reply", reply);
		return "client/message/messageWrite";
	}
	
	
	// 메세지 작성 pro
	@RequestMapping("messageWritePro.tm")
	public String messageWritePro(MessageDTO msgDto, Model model) {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		msgDto.setSender(id);
		int result = messageService.insertMsg(msgDto);
		
		model.addAttribute("result", result);
		return "client/message/messageWritePro";
	}
	
	
	//메세지 삭제
	@RequestMapping("messageDel.tm")
	public String messageDel(String msgNo, Model model) {
		int mNo = Integer.parseInt(msgNo);
		int result = messageService.deleteMsg(mNo);
		//result 1이면 삭제 완료
		model.addAttribute("result", result);
		return "client/message/messageDel";
	}
	
	

}
