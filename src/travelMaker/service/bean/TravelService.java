package travelMaker.service.bean;

import java.util.List;
import java.util.Map;

import travelMaker.model.dto.ChattingDTO;
import travelMaker.model.dto.GalleryDTO;
import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.ScheduleDTO;
import travelMaker.model.dto.SmallPosDTO;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserRkDTO;

public interface TravelService {

	//개설글 작성
	public void insertMaking(GroupSpaceDTO dto) throws Exception;
	//개설글 전부 가져오기
	public Map getArticles(String pageNum) throws Exception;
	//모집글 날짜 검색
	public Map getSearchArticles(String pageNum, String startD, String endD) throws Exception;
	//개설글 하나 가져오기
	public GroupSpaceDTO getContent(int gNo) throws Exception;
	//id 주고 성별 가져오기
	public int getGender(String id) throws Exception;
	//모집 게시글 삭제
	public void deleteContent(int gNo) throws Exception;
	//해당 그룹 구성원의 상태 여부 (구성원 아니면 -1)
	public int getMemStatus(int gNo, String id) throws Exception;
	//회원의 포지션 가져오기
	public Map getUserPos(String id) throws Exception;
	//포지션 정보 가져오기
	public SmallPosDTO getPosInfo(int posNo) throws Exception;
	//그룹 참여 신청하기
	public void applyForGroup(GroupRequestDTO dto) throws Exception;
	//회원 랭크 정보 가져오기
	public UserRkDTO getMemRk(String id) throws Exception;
	//상태에 따른 여행 리스트 가져오기
	public List getMyGroups(String id, int status) throws Exception;
	//그룹의 멤버들 가져오기
	public List getMembers(int gNo) throws Exception;
	//그룹에 들어온 신청 목록들 가져오기
	public List getRequests(int gNo) throws Exception;
	//신청 수락 및 거절 처리
	public void acceptOrReject(String id, int gNo, int status) throws Exception;
	//갤러리 이미지 업로드
	public void uploadImage(GalleryDTO dto) throws Exception;
	//그룹 갤러리 이미지들 가져오기
	public List getGroupImgs(int gNo) throws Exception;
	//사진 좋아요
	public void imgLiked(String id, int gNo, int pNo) throws Exception;
	
	// jbr : 그룹리퀘스트 pos 신청자수 세기
	public int posCount(int gNo, int posNo);
	
	// cyh 일정 생성
	public void insertSchedule(int gNo, String sDate, String sCont) throws Exception;
	// cyh 일정 수정
	public void updateSchedule(ScheduleDTO dto) throws Exception;
	// cyh 일정 뿌려주기 
	public void selectSchedule(int gNo) throws Exception;
	// cyh 일정 리스트
	public List getSchedule(int gNo) throws Exception;
	// cyh 일정 삭제
	public void deleteSchedule(int sNo) throws Exception;
	
	//jbr 그룹관리 : 전체 그룹목록 가져오기
	public List<GroupSpaceDTO> groupAllList();
	// jbr 그룹관리 : 검색 결과 그룹목록 가져오기
	public List searchGroupList(String sel, String search);
	// jbr 그룹관리 : 그룹 개수 가져오기
	public int groupAllCnt();
	// jbr 그룹관리 : 검색 결과 개수
	public int searchGroupCtn(String sel, String search);
	
	//채팅 입력
	public void sendChat(int gNo, String writer, String cont) throws Exception;
	//채팅 리스트 출력
	public List getChats(int gNo) throws Exception;
	//마지막 채팅 메시지 출력
	public ChattingDTO getLastChat(int gNo) throws Exception;
	//그룹 여행 상태 변경
	public void changeGrpStatus(int gNo, int status) throws Exception;

	
}
