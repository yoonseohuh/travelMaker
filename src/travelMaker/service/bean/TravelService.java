package travelMaker.service.bean;

import java.util.List;
import java.util.Map;

import travelMaker.model.dto.GalleryDTO;
import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;
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
	
}
