package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupSpaceDTO;

@Repository
public class UserCmtDAOImpl implements UserCmtDAO {
   
   @Autowired
   private SqlSessionTemplate sqlSession = null;
   
   // groupMember테이블에서 사용자가 참여중인 그룹 가져오기
   @Override
   public List myGroup(String id) throws SQLException {
     // System.out.println("dao에서 id:" +id);
      //status=1임
      List<GroupMemberDTO> myGroup = sqlSession.selectList("userCmt.myGroup", id); 
      
      
      return myGroup;
   }

   
   //그룹고유번호 보내서 그룹정보 가져오기 
   @Override
   public GroupSpaceDTO getGroupInfo(int num) throws SQLException {
      
      GroupSpaceDTO gInfo = sqlSession.selectOne("userCmt.getGroupInfo", num);
      
      return gInfo;
   }

   
   //그룹고유번호로 참여중인 멤버 가져오기  1=> 5명..2=>2명. 리스트에 담아줌
   public List getMem(int gNo) {
      List getMemList = sqlSession.selectList("userCmt.getMem",gNo);  //그룹멤버dto로 list에 담음
      
         
      return getMemList;
   }
   
   // 그룹방별로 받는사람이 사용자인거 카운트
   public int comRecUserCnt(String id, int gNo) {
	   Map map = new HashMap();
	   map.put("id", id);
	   map.put("gNo", gNo);
	   
	   int result = sqlSession.selectOne("userCmt.comRecUserCnt", map);
	   
	   return result; 
   }
   
   
   // 그룹방별로 보낸사람이 사용자인거 카운트
   public int comSenUserCnt(String id, int gNo)throws SQLException {
	   Map map = new HashMap();
	   map.put("id", id);
	   map.put("gNo", gNo);
	   
	   int result = sqlSession.selectOne("userCmt.comSenUserCnt", map);
	   
	   return result; 
   }
   
   
   
   
   
   // 코멘트 남겼는지 확인
   public int chComment(String id, String recId, int gNo ) {
      Map map = new HashMap();
      map.put("senId",id);
      map.put("recId", recId);
      map.put("gNo", gNo);
      
      int result = sqlSession.selectOne("userCmt.chcomment", map);
      
      return result;
   }
   
   
   //코멘트 insert
   public void insertCom(String id, int gNo, String groupMem, String comment) {
      System.out.println(" id" +id +"쥐넘" +gNo+"그멤" + groupMem +"z코멘"+comment);

      Map map = new HashMap();
      map.put("senId",id);
      map.put("gNo",gNo);
      map.put("recId",groupMem);
      map.put("comment",comment);

      sqlSession.insert("userCmt.insertCom",map);
      
      
   } 
   
   // 사용자 여행그룹 갯수 가져오기
   public int countGroup(String id) {
      int result = sqlSession.selectOne("userCmt.countGroup",id);
      
      return result;
   }
   
   //받는 사람이 사용자인 코멘트DTO가져오기
   public List comRecUser(String id) {
      
      List comRecUser = sqlSession.selectList("userCmt.comRecUser", id);
      
      return comRecUser;
   }
   
   //보낸사람이 사용자인 코멘트DTO 가져오기
   public List comSenUser(String id) {
      List comSenUser = sqlSession.selectList("userCmt.comSenUser", id);
      
      return comSenUser;
   }
   
   //그룹인원확인
   public int groupMemCnt(int gNo) {
	   int result = sqlSession.selectOne("groupMember.groupMemCnt", gNo);
	   return result;
   }
   
   //그룹방에 내가 작성한 코멘트 갯수 확인
   public int cntCmt(int gNo, String id) {
	   
	   Map map = new HashMap();
	   	map.put("senId",id);
	   	map.put("gNo",gNo);
	      
	   int result = sqlSession.selectOne("userCmt.cntCmt", map);
	   
	   return result;
   }
   
   

   /*
   //셀렉트두개 테스트
   public List<GroupMemberDTO> testMem(int groupNum){
      List dto = sqlSession.selectList("userCmt.selectGroupMem",groupNum); 
      
      return dto;
   }
   */
   
  
   
   
   
   
   
   
   
   
   
   


}