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
	public boolean acceptOrReject(String id, int gNo, int status) throws Exception;
	//갤러리 이미지 업로드
	public void uploadImage(GalleryDTO dto) throws Exception;
	//그룹 갤러리 이미지들 가져오기
	public List getGroupImgs(int gNo) throws Exception;
	//사진 좋아요
	public void imgLiked(String id, int gNo, int pNo) throws Exception;
	//회원이 특정 사진에 좋아요 했는지 여부 체크
	public int likedCount(String id, int pNo) throws Exception;
	//사진 좋아요 취소
	public void imgLikedCancel(String id, int gNo, int pNo) throws Exception;
	
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
	//jbr gNo에 해당하는 그룹스페이스 가져오기
	public GroupSpaceDTO getGroup(int gNo);
	
	//채팅 입력
	public void sendChat(int gNo, String writer, String cont) throws Exception;
	//채팅 리스트 출력
	public List getChats(int gNo) throws Exception;
	//마지막 채팅 메시지 출력
	public ChattingDTO getLastChat(int gNo) throws Exception;
	//그룹 여행 상태 변경
	public void changeGrpStatus(int gNo, int status) throws Exception;
	//모든 그룹 글 가져오기
	public List getAllGroups() throws Exception;
	
	//그룹삭제할때 그룹리퀘스트 삭제
	public void deleteGroupReq(int gNo);
	//그룹삭제할때 그룹멤버 삭제
	public void deleteGroupMem(int gNo);

	//개설자 총평작성
	public void genReview(String id, int gNo, String genReview);
	//그룹멤버 총평댓
	public void genReply(String id, int gNo, String genReply);
	//총평가져오기
	public List getReview(int gNo)throws Exception;
	// 본인이 총평 썼는지 확인
	public int chReview(int gNo, String id);
	//공개여부 업데이트
	public void updateShared(int gNo, int shared);
	
	//참여중인 멤버드르이 리퀘스트 가져옴
	public List memListFin(int gNo)throws Exception;
	//참여중인 멤버들 리퀘스트 가져옴
	
	//일정 개수 카운트
	public int scheCnt(int gNo);
	
}
