package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupSpaceDTO;

public interface UserCmtDAO {
	
	
	//사용자가 참여중인 그룹넘버 가져오기
	public List myGroup(String id) throws SQLException;
	
	//그룹고유번호 보내서 그룹정보 가져오기
	public GroupSpaceDTO getGroupInfo(int num) throws SQLException;


	//그룹고유번호로 참여중인 멤버 가져오기
	public List getMem(int gNo) ;


	// 코멘트 남겼는지 확인
	public int chComment(String id, String recId, int gNo );

	// 코멘트 insert
	public void insertCom(String id, int gNo, String groupMem, String comment);
	
	// 사용자 여행그룹 갯수 가져오기
		public int countGroup(String id);
	
	//받는 사람이 사용자인 코멘트DTO가져오기
	public List comRecUser(String id);
	
	//보낸사람이 사용자인 코멘트DTO 가져오기
	public List comSenUser(String id);
	
	//그룹인원확인
   public int groupMemCnt(int gNo);
   
   //그룹방에 내가 작성한 코멘트 갯수 확인
   public int cntCmt(int gNo, String id);
   
   //그룹방별로 받는사람이 사용자인거 카운트
   public int comRecUserCnt(String id, int gNo);
   
   // 그룹방별로 보낸사람이 사용자인거 카운트
   public int comSenUserCnt(String id, int gNo)throws SQLException;
	

		

}

