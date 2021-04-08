package travelMaker.model.dao;

import java.util.List;

import travelMaker.model.dto.GroupMemberDTO;

public interface GroupMemberDAO {

	//해당 그룹 구성원의 상태 여부 (구성원 아니면 -1)
	public int getMemStatus(int gNo, String id) throws Exception;
	//그룹에 참여신청 처리
	public void insertMemToGroup(GroupMemberDTO applicant) throws Exception;
	//상태에 따른 그룹 리스트(대기중/참여중/거절됨/강퇴됨) 가져오기
	public List getMyGroups(String id, int status) throws Exception;
	//그룹 멤버들 가져오기
	public List getMembers(int gNo) throws Exception;
	//그룹 참여 수락 및 거절 처리
	public void changeMemStatus(String id, int gNo, int status) throws Exception;
	
	//그룹삭제할때 그룹멤버 삭제
	public void deleteGroupMem(int gNo);
	// 본인이 총평 썼는지 확인
	public GroupMemberDTO chReview(int gNo, String memId);
}
