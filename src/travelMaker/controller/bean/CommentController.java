package travelMaker.controller.bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserCmtDTO;
import travelMaker.service.bean.CommentService;
import travelMaker.service.bean.TravelService;

@Controller
@RequestMapping("/cmt/")
public class CommentController {
   
   @Autowired
   private CommentService commentService = null;
   @Autowired
   private TravelService travelService = null;
   
   //코멘트 셀렉트박스 두개 ajax
   @RequestMapping("selectTravel.tm")
   @ResponseBody
   public Object test(int gNo) throws SQLException {
      System.out.println("에이작스테스트" + gNo);
      List memList = new ArrayList<GroupMemberDTO>();
      memList = commentService.getCmtGMem(gNo);
      
     // System.out.println("에이작스멤리스트" + ((GroupMemberDTO)memList.get(0)).getNickname());
       
      //Map<String, Object> msvo = new HashMap<String, Object>();
        //msvo.put("memList", memList);
      
      System.out.println("msvo출력" + memList);
      for(int i = 0; i<memList.size(); i++) {
    	  System.out.println("msvo리스트 출력" + ((GroupMemberDTO)memList.get(i)).getId());
      }
      System.out.println("에이작스테스트");
            //partyService.sPartyGetMembershipDetail(no);
      return memList;
   }
   
   
   
   
   /*
   //에이작스테스트
   @RequestMapping("testComment.tm")
   public String testComment(Model model) throws SQLException {
      String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
      List<GroupSpaceDTO> gList = commentService.getMyGroup(id);
      for(int i=0 ; i<gList.size() ; i++) {
         System.out.print(gList.get(i).getSubject()+"/");
      }
      
      //여행목록 가져옴
            List dtoList = commentService.getMyGroup(id);
            
            //그룹멤버들dto로 가져옴
            List fin = commentService.groupUser(id);
      System.out.println("디티오 리스트" + dtoList);
      System.out.println("fin 리스트" + fin);
      
      //travelService.getMembers(gNo)
      model.addAttribute("dtoList", dtoList);
      model.addAttribute("fin", fin);
      model.addAttribute("gList",gList);
      return "client/mypage/testComment";
   }
   */
   
   
   //코멘트 조회 페이지
   @RequestMapping("comment.tm")
   public String comment(Model model)throws SQLException {
      String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
      System.out.println("나와라id" + id);
      //id = "test4"; //임시 아이디 테스트
      
      //코멘트에서 사용할 여행목록(코멘트 다 사라지면 목록에서 사라짐)
      List cmtGroupList = commentService.cmtGroup(id);
      System.out.println("꼬였다" + cmtGroupList);
      
      
      //왜안뜨니
      List dtoList = commentService.getMyGroup(id);
      for(int i = 0; i<dtoList.size(); i++) {
      System.out.println("컨트롤러에서 dtoList" + ((GroupSpaceDTO)dtoList.get(i)).getSubject());
      }
      
      //그룹멤버들dto로 가져옴
      List fin = commentService.groupUser(id);
      
      // 여행 갯수 가져옴
      int count = commentService.countGroup(id);
      System.out.println("여행목록 카운트" + count);
      
      //받는사람이 사용자인 userCmtDTO가져오기
      List comRecUser = commentService.comRecUser(id);
      for(int i = 0; i<comRecUser.size(); i++) {
    	  System.out.println("컴리시브유저의 코멘트가 있나보자" + ((UserCmtDTO)comRecUser.get(i)).getcCont());
      }
      
      // 보낸사람이 사용자인 userCmtDTO가져오기
      List comSenUser = commentService.comSenUser(id);
      
      
      //model.addAttribute("dtoList", dtoList);
      
      model.addAttribute("dtoList", dtoList);
      model.addAttribute("cmtGroupList", cmtGroupList);
      model.addAttribute("fin", fin);
      model.addAttribute("count", count);
      model.addAttribute("comRecUser", comRecUser);
      model.addAttribute("comSenUser", comSenUser);
      
      System.out.println("코멘트끝!!!!!!!!!!!");
      
      return "client/mypage/comment";
   }

   
   //코멘트 작성 프로 페이지
   @RequestMapping("commentWritePro.tm")
   public String commentWritePro(String id, String groupNum, String groupMem, String comment, Model model) {
      
      if(groupNum != null && groupMem != null) {
         
         int result = commentService.insertCom(id, groupNum, groupMem, comment);
         
         model.addAttribute("result", result);
         model.addAttribute("groupNum", groupNum);
         model.addAttribute("groupMem", groupMem);
         model.addAttribute("comment", comment);
         
      }else { //null이면
         int result = 2;
         model.addAttribute("result", result);
      }
      
      return "client/mypage/commentWritePro";
   }
   
   
}