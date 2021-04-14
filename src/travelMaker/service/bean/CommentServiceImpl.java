package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.Remove;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import travelMaker.model.dao.UserCmtDAO;
import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserCmtDTO;

@Service
public class CommentServiceImpl implements CommentService {

   @Autowired
   private UserCmtDAO userCmtDAO = null;

   
   
   // 사용자가 참여중인 그룹스페이스를 한줄씩(groupSpaceDTO) 가져올것임
   public GroupSpaceDTO getGroupInfo(int num) throws SQLException{
      GroupSpaceDTO gInfo = userCmtDAO.getGroupInfo(num);
    //  System.out.println("서비스에서 그룹명이 안뜨나? " + gInfo.getSubject());
      return gInfo;
   }
         
   
   //사용자가 여행한 모든 여행그룹 가져오기 (상태4)
   @Override
   public List getMyGroup(String id) throws SQLException {      
      
     //사용자가 참여중인 그룹들 가져옴
      List<GroupMemberDTO> myGroup = userCmtDAO.myGroup(id);

      
      List dtoList = new ArrayList();
      for(int i = 0 ; i < myGroup.size(); i++) {
        // System.out.println("마이그룹사이즈" + myGroup.size());
        // System.out.println(i + "번쨰 : " + ((GroupMemberDTO)myGroup.get(i)).getgNo());
         
           GroupSpaceDTO gInfo = getGroupInfo(((GroupMemberDTO)myGroup.get(i)).getgNo());
           if(gInfo.getStatus() == 4 ) { //GroupSpace 여행상태가 4인것들만 담는다
         
              dtoList.add(gInfo);
              
           }   
      }
    //  for(int i = 0; i < dtoList.size(); i++) {
    //	  System.out.println("디티오리스트" + ((GroupSpaceDTO)dtoList.get(i)).getSubject());
    //  }
      return dtoList;
   }
   
   
   //사용자가 여행한 모든 여행그룹인데 사용자 혼자여행인건 뺀 여행그룹 (상태4)
   @Override
   public List cmtMyGroup(String id) throws SQLException {      
      
     //사용자가 참여중인 그룹들 가져옴
      List<GroupMemberDTO> myGroup = userCmtDAO.myGroup(id);
      List cmtMyGroup = new ArrayList();
      
      for(int i = 0; i < myGroup.size(); i++) {
    	  int result = userCmtDAO.groupMemCnt(((GroupMemberDTO)myGroup.get(i)).getgNo());
    	  if(result > 1) { //사용자가 참여중인 그룹넘 보내서 그룹멤버 카운트가 1이면 혼자여행이니까 1보다 클경우 담는다 
    		//  System.out.println("마이그룹사이즈" + myGroup.size());
    	    //  System.out.println(i + "번쨰 : " + ((GroupMemberDTO)myGroup.get(i)).getgNo());
    	         
    	      GroupSpaceDTO gInfo = getGroupInfo(((GroupMemberDTO)myGroup.get(i)).getgNo());
    	      if(gInfo.getStatus() == 4 ) { //GroupSpace 여행상태가 4인것들만 담는다
    	        	   cmtMyGroup.add(gInfo);
    	      }
    	  }
    	  
      }
    	 
     // for(int i = 0; i < cmtMyGroup.size(); i++) {
     //	  System.out.println("디티오리스트" + ((GroupSpaceDTO)cmtMyGroup.get(i)).getSubject());
     // }

      return cmtMyGroup;
   } 
   
   
   // 그룹방별로 받는사람이 사용자인거 카운트
   public Map comRecUserCnt(String id)throws SQLException {
	   Map comRecUserCnt = new HashMap();
	   
	   //사용자가 여행한 모든 여행그룹인데 사용자 혼자여행인건 뺀 여행그룹 (상태4)
	   List<GroupSpaceDTO> list = cmtMyGroup(id);
	   
	   for(int i = 0; i < list.size(); i++) {
		   //그룹방서 코멘트 받는 사람이 사용자인거 카운트해서 map에다가 gNo, 카운트값 으로 담음 
		   int result = userCmtDAO.comRecUserCnt(id, ((GroupSpaceDTO)list.get(i)).getgNo());
		   comRecUserCnt.put(((GroupSpaceDTO)list.get(i)).getgNo(), result);
	   }
	   
	  
	   return comRecUserCnt; 
   }
   
   
   // 그룹방별로 보낸사람이 사용자인거 카운트
   public Map comSenUserCnt(String id)throws SQLException {
	   Map comSenUserCnt = new HashMap();
	   
	   //사용자가 여행한 모든 여행그룹인데 사용자 혼자여행인건 뺀 여행그룹 (상태4)
	   List<GroupSpaceDTO> list = cmtMyGroup(id);
	   
	   for(int i = 0; i < list.size(); i++) {
		   //그룹방서 코멘트 보낸 사람이 사용자인거 카운트해서 map에다가 gNo, 카운트값 으로 담음 
		   int result = userCmtDAO.comSenUserCnt(id, ((GroupSpaceDTO)list.get(i)).getgNo());
		   comSenUserCnt.put(((GroupSpaceDTO)list.get(i)).getgNo(), result);
	   }
	   
	  
	   return comSenUserCnt; 
   }
   
   
   
   
   
   //코멘트 조회에서 사용할 여행목록(동행자한테 코멘트 다 작성하면 사라지게함)
   public List cmtGroup(String id)throws SQLException {
	   List list = new ArrayList<GroupSpaceDTO>();
	   List cmtGroupList = new ArrayList<GroupSpaceDTO>();
	   
	   
	   list = getMyGroup(id); // 여행상태4인 그룹스페이스만 담겨있음
	   for(int i = 0; i<list.size(); i++) {
		   
		   //참여중인 그룹인원확인  51번 카운트 7
		   int groupMemCnt = groupMemCnt(((GroupSpaceDTO)list.get(i)).getgNo());
		   
		   //내가 작성한 코멘트 전체갯수  51카운트 1
		   int cmtCnt = userCmtDAO.cntCmt(((GroupSpaceDTO)list.get(i)).getgNo(), id);
		   
		   //System.out.println("그룹멤버 총인원확인" + groupMemCnt);
		   
		        //      3 >1   ||    2   <  3-1                     
		   if(groupMemCnt > 1 && cmtCnt < groupMemCnt-1) {   
			   cmtGroupList.add(list.get(i));
		   }
		   
	   }
	 //  for(int i = 0; i<cmtGroupList.size(); i++) {
	//   System.out.println("꼬여버린듯하다.. dto리스트" + ((GroupSpaceDTO)cmtGroupList.get(i)).getSubject());
	//   }
	   return cmtGroupList;
   }
   
   
   //그룹인원확인
   public int groupMemCnt(int gNo) {
	   int result = userCmtDAO.groupMemCnt(gNo);
	   return result;
   }
   
   
   
   //사용자아이디가 참여중인 그룹넘들 가져오기
   public List getGroupNum(String id) throws SQLException{
      //그룹멤버dto담겨있음
      List myGroup = userCmtDAO.myGroup(id);
   
      return myGroup;
   }
   
   // 그그룹넘에 해당하는 사람들 가져오기
   public List getGMem(int gNo) throws SQLException{
      List gMem = userCmtDAO.getMem(gNo);
      return gMem;
   }
   

   
      
   // 코멘트 전용..그룹멤버들
   public List getCmtGMem(int gNo) {
	   String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
	  // System.out.println("코멘트전용id" + id);
	   List<GroupMemberDTO> list = userCmtDAO.getMem(gNo); 
	   List blank = new ArrayList();
	   
	   List memList = new ArrayList<GroupMemberDTO>();
	   //사용자 아이디 빼줄꺼임 
	   for(int i = 0; i<list.size(); i++) {
		   int result = userCmtDAO.chComment(id, list.get(i).getId(), gNo);
		 //  System.out.println("result : " + result + " id :" + id + "receiver : " + list.get(i).getId() + " gNo : " + gNo);
		   if(!id.equals(list.get(i).getId()) && result == 0){
			  // System.out.println("담기는 멤버 : " + list.get(i).getId());
			   memList.add(list.get(i));
		   }
	   }
	 //  System.out.println("멤리스트출력"+ memList);
	   
	   return memList;
   }
   
   
   
   //같은 여행그룹의 tmUSER 정보 담기  (필요에따라 빼써라)
   public List groupUser(String id) throws SQLException {
      
      //그룹멤버dto담겨있음 gNo뽑아야함
      List myG = getGroupNum(id);  //사용자가 가입된 그룹리스트
    //  System.out.println("마이지사이즈" + myG.size());
      
      //1.gno하나씩 뽑아서 그그룹에 해당하는 멤버들  닉네임담음
      List memList = new ArrayList();
      
      List comMemList = new ArrayList();
      
      List fin = new ArrayList();
      
      
      for(int i = 0; i < myG.size(); i++) {
         memList = userCmtDAO.getMem(((GroupMemberDTO)myG.get(i)).getgNo());   //가입된 그룹번호를 하나씩 크게 돌려서 그 그룹에 해당하는 멤버들 목록에 담음?
       //  System.out.println(" 그룹번호" + ((GroupMemberDTO)myG.get(i)).getgNo());
         //코멘트 남겼는지 확인할꺼
         for(int j = 0; j < memList.size(); j++) {
            int result = userCmtDAO.chComment(id,((GroupMemberDTO)memList.get(j)).getId(),((GroupMemberDTO)myG.get(i)).getgNo());
            
            // 밑에서 사용자아이디인지 체크할 변수
            String chId =((GroupMemberDTO)memList.get(j)).getId();
          //  System.out.println(chId);
            //System.out.println(" 그룹목록"+i +" : " + ((GroupMemberDTO)myG.get(i)).getgNo());
            
          //  System.out.println("result값" + result);
            
               if(result == 0 && !chId.equals(id)) {
                  comMemList.add(((GroupMemberDTO)memList.get(j)));
                  //System.out.println("멤버목록" + j + " : " + ((GroupMemberDTO)memList.get(j)).getId());
               }
            
         
         }//작은  for문 memList돌린거
         
         
      }//큰 for문 myG돌린거
      //fin.add(comMemList);

      
      return comMemList;
   }
   
   
   
   
   
   //코멘트 insert문
   public int insertCom(String id, String groupNum, String groupMem, String comment) {
      
      int gNo = Integer.parseInt(groupNum);
      userCmtDAO.insertCom(id, gNo, groupMem, comment);
      int result = 1;
      
      return result;
   }
   
   
   // 사용자 여행그룹 갯수 count
   public int countGroup(String id) {
      int count = userCmtDAO.countGroup(id);

      return count;
   }
   
   
   // 코멘트DTO가져오 받는사람 사용자
   public List comRecUser(String id) throws SQLException {
      List comRecUser = new ArrayList();
      
      comRecUser = userCmtDAO.comRecUser(id);
   
    //  System.out.println("comRecUser" + comRecUser.size());
      return comRecUser;
   }
   
   // 보낸사람이 사용자인 코멘트DTO가져오기 
   public List comSenUser(String id) throws SQLException {
      
      List comSenUser = new ArrayList();
      comSenUser= userCmtDAO.comSenUser(id);
   //   System.out.println("comSenUser :" + comSenUser.size());
         
      return comSenUser;
   }
   
   /* 없애도 되는듯?.. 주석해도 에러안뜬다
   @Override
   public List gMem(String id) throws SQLException{
      List group = userCmtDAO.myGroup(id);
      System.out.println(((GroupMemberDTO)group.get(0)).getgNo());
      
      List gMemList = new ArrayList();
      
      for(int i = 0; i < group.size(); i++) {
         
         //사용자가 참여중인 그룹 넘 보냄
         userCmtDAO.getMem(((GroupMemberDTO)group.get(i)).getgNo());
      }
      return group;
   }
   */
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}