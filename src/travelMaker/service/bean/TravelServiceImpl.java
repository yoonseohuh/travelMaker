package travelMaker.service.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import travelMaker.model.dao.ChattingDAO;
import travelMaker.model.dao.GalleryDAO;
import travelMaker.model.dao.GalleryLikedDAO;
import travelMaker.model.dao.GroupMemberDAO;
import travelMaker.model.dao.GroupRequestDAO;
import travelMaker.model.dao.GroupSpaceDAO;
import travelMaker.model.dao.ScheduleDAO;
import travelMaker.model.dao.SmallPosDAO;
import travelMaker.model.dao.TmUserDAO;
import travelMaker.model.dao.UserRkDAO;
import travelMaker.model.dto.ChattingDTO;
import travelMaker.model.dto.GalleryDTO;
import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.ScheduleDTO;
import travelMaker.model.dto.SmallPosDTO;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserRkDTO;

@Service
public class TravelServiceImpl implements TravelService{
	
	@Autowired
	private GroupSpaceDAO groupSpaceDAO = null;
	@Autowired
	private TmUserDAO tmUserDAO = null;
	@Autowired
	private GroupMemberDAO groupMemberDAO = null;
	@Autowired
	private SmallPosDAO smallPosDAO = null;
	@Autowired
	private GroupRequestDAO groupRequestDAO = null;
	@Autowired
	private UserRkDAO userRkDAO = null;
	@Autowired
	private GalleryDAO galleryDAO = null;
	@Autowired
	private GalleryLikedDAO galleryLikedDAO = null;
	@Autowired
	private ScheduleDAO scheduleDAO = null;
	@Autowired
	private ChattingDAO chattingDAO = null;
	
	//개설글 작성
	@Override
	public void insertMaking(GroupSpaceDTO dto) throws Exception {
		//개설글 작성
		if(dto.getDongsung()==null) { dto.setDongsung(0); }
		if(dto.getPo1()==null) { dto.setPo1(-1); }
		if(dto.getPo2()==null) { dto.setPo2(-1); }
		if(dto.getPo3()==null) { dto.setPo3(-1); }
		dto.setActualNum(0);
		dto.setStatus(0);
		dto.setLikedCnt(0);
		dto.setReadCnt(0);
		dto.setShared(0);
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		dto.setId(id);
		groupSpaceDAO.insertMaking(dto);
		//개설자를 groupMember 테이블에도 멤버로서 인서트 시켜야 함
		GroupMemberDTO applicant = new GroupMemberDTO();
		applicant.setgNo(dto.getgNo());
		applicant.setId(id);
		TmUserDTO leaderInfo = tmUserDAO.getMember(id);
		applicant.setNickname(leaderInfo.getNickname());
		applicant.setStatus(1);
		//개설자 포함 인원수이므로 actualNum에 1추가
		groupSpaceDAO.updateActNum(dto.getgNo(), 1);
		groupMemberDAO.insertMemToGroup(applicant);
	}
	
	//모집 중인 개설글들 가져오기
	@Override
	public Map getArticles(String pageNum) throws Exception {
		int pageSize = 8;
		if(pageNum==null || pageNum.equals("")) { pageNum="1"; }
		int currPage = Integer.parseInt(pageNum);
		int start = (currPage-1)*pageSize+1;
		int end = currPage*pageSize;
		List articleList = null;
		
	//	검색을 위해
		ServletRequestAttributes sra = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		String startD = request.getParameter("startD");
		String endD = request.getParameter("endD");
		
		int count = 0;
		
		if(startD!=null && endD!=null) {
			count = groupSpaceDAO.getSearchArticleCount(startD, endD);
			if(count>0) {
				articleList = groupSpaceDAO.getSearchArticles(start, end, startD, endD);
			}
		}else {
			count = groupSpaceDAO.getArticleCount();
			if(count>0) {
				articleList = groupSpaceDAO.getArticles(start, end);			
			}			
		}
		int number = count-(currPage-1)*pageSize;
		
		Map map = new HashMap();
		map.put("pageNum",pageNum);
		map.put("pageSize",pageSize);
		map.put("currPage",currPage);
		map.put("start",start);
		map.put("end",end);
		map.put("count",count);
		map.put("number",number);
		map.put("articleList",articleList);
		map.put("startD",startD);
		map.put("endD",endD);
		
		return map;
	}
	
	//모집글 날짜 검색
	@Override
	public Map getSearchArticles(String pageNum, String startD, String endD) throws Exception {
		int pageSize = 8;
		if(pageNum==null || pageNum.equals("")) { pageNum="1"; }
		int currPage = Integer.parseInt(pageNum);
		int start = (currPage-1)*pageSize+1;
		int end = currPage*pageSize;
		List articleList = null;
		
		int count = groupSpaceDAO.getSearchArticleCount(startD, endD);
		if(count>0) {
			articleList = groupSpaceDAO.getSearchArticles(start, end, startD, endD);
		}
		int number = count-(currPage-1)*pageSize;
		
		Map map = new HashMap();
		map.put("pageNum",pageNum);
		map.put("pageSize",pageSize);
		map.put("currPage",currPage);
		map.put("start",start);
		map.put("end",end);
		map.put("count",count);
		map.put("number",number);
		map.put("articleList",articleList);
		return map;
	}
	
	//모집글 하나 가져오기
	@Override
	public GroupSpaceDTO getContent(int gNo) throws Exception {
		GroupSpaceDTO content = groupSpaceDAO.getContent(gNo);
		
		String cpt = content.getConcept();
		if(cpt.equals("gourmet")) { content.setConcept("맛집"); }
		else if(cpt.equals("healing")) { content.setConcept("힐링"); }
		else if(cpt.equals("adventure")) { content.setConcept("모험"); }
		else if(cpt.equals("tour")) { content.setConcept("관광"); }
		else if(cpt.equals("camping")) { content.setConcept("캠핑"); }
		
		String loc = content.getLoc();
		if(loc.equals("seoul")) { content.setLoc("서울"); }
		else if(loc.equals("incheon")) { content.setLoc("인천"); }
		else if(loc.equals("gyunggi")) { content.setLoc("경기"); }
		else if(loc.equals("gangwon")) { content.setLoc("강원"); }
		else if(loc.equals("sejong")) { content.setLoc("세종"); }
		else if(loc.equals("daejeon")) { content.setLoc("대전"); }
		else if(loc.equals("chungnam")) { content.setLoc("충청남도"); }
		else if(loc.equals("chungbuk")) { content.setLoc("충청북도"); }
		else if(loc.equals("gwangju")) { content.setLoc("광주"); }
		else if(loc.equals("jeonnam")) { content.setLoc("전라남도"); }
		else if(loc.equals("jeonbuk")) { content.setLoc("전라북도"); }
		else if(loc.equals("busan")) { content.setLoc("부산"); }
		else if(loc.equals("ulsan")) { content.setLoc("울산"); }
		else if(loc.equals("daegu")) { content.setLoc("대구"); }
		else if(loc.equals("gyungnam")) { content.setLoc("경상남도"); }
		else if(loc.equals("gyungbuk")) { content.setLoc("경상북도"); }
		else if(loc.equals("jeju")) { content.setLoc("제주도"); }

		return content;
	}
	
	//id 주고 성별 가져오기
	@Override
	public int getGender(String id) throws Exception {
		return tmUserDAO.getGender(id);
	}
	
	//모집 게시글 삭제
	@Override
	public void deleteContent(int gNo) throws Exception {
		groupSpaceDAO.deleteContent(gNo);
	}
	
	//해당 그룹 구성원의 상태 여부 (구성원 아니면 -1)
	@Override
	public int getMemStatus(int gNo, String id) throws Exception {
		int status = -1;
		if(id!=null) {
			status = groupMemberDAO.getMemStatus(gNo, id);
		}
		return status;
	}
	
	//회원 포지션 가져오기
	@Override
	public Map getUserPos(String id) throws Exception {
		TmUserDTO dto = tmUserDAO.getMember(id);
		int pos1 = dto.getPosition1();
		int pos2 = dto.getPosition2();
		System.out.println("pos1 "+pos1);
		System.out.println("pos2 "+pos2);
		Map map = new HashMap();
		map.put("pos1",dto.getPosition1());
		map.put("pos2",dto.getPosition2());
		return map;
	}
	
	//포지션 정보 가져오기
	@Override
	public SmallPosDTO getPosInfo(int posNo) throws Exception {
		SmallPosDTO dto = smallPosDAO.getPosInfo(posNo);
		return dto;
	}
	
	//그룹 참여신청하기
	@Override
	public void applyForGroup(GroupRequestDTO dto) throws Exception {
		//닉네임 가져와야 함
		TmUserDTO userInfo = tmUserDAO.getMember(dto.getId());
		String nickname = userInfo.getNickname();
		
		//GroupRequestDTO에 담아 가져온 정보들 중 GroupMember테이블에 넣어야 할 정보를 뽑아 또 다른 DTO에 담은 후 insert
		GroupMemberDTO applicant = new GroupMemberDTO();
		applicant.setId(dto.getId());
		applicant.setgNo(dto.getgNo());
		applicant.setNickname(nickname);
		applicant.setStatus(0);
		//groupRequest테이블에 insert
		if(dto.getReqType()==0) {
			dto.setPosNo(-1);
		}
		groupRequestDAO.applyForGroup(dto);
		//groupMember테이블에 insert
		groupMemberDAO.insertMemToGroup(applicant);
	}
	
	//회원 랭크 가져오기
	@Override
	public UserRkDTO getMemRk(String id) throws Exception {
		TmUserDTO dto = tmUserDAO.getMember(id);
		UserRkDTO rkInfo = userRkDAO.getRkInfo(dto.getRk());
		return rkInfo;
	}
	
	//상태에 따른 모든 여행 리스트의 그룹번호 가져온 다음 해당 groupSpace들을 리턴
	@Override
	public List getMyGroups(String id, int status) throws Exception {

		List list = new ArrayList();		//GroupMemberDTO가 담기는 리스트
		List gNoList = new ArrayList();		//gNo만 담을 리스트
		list = groupMemberDAO.getMyGroups(id,status);
		for(int i=0 ; i<list.size() ; i++) {
			GroupMemberDTO dto = (GroupMemberDTO)list.get(i);
			gNoList.add(dto.getgNo());
		}
		GroupSpaceDTO article = new GroupSpaceDTO();
		List articleList = new ArrayList();		//실제 그룹방들을 담을 리스트
		for(int i=0 ; i<gNoList.size(); i++) {
			article = groupSpaceDAO.getContent((Integer)gNoList.get(i));
			articleList.add(article);
		}
		
		return articleList;
	}
	
	//그룹의 멤버들 가져오기
	@Override
	public List getMembers(int gNo) throws Exception {
		List memList = new ArrayList<GroupMemberDTO>();
		memList = groupMemberDAO.getMembers(gNo);
		return memList;
	}
	
	
	//참여중인 멤버들 리퀘스트 목록에 담음
	@Override
	public List memListFin(int gNo)throws Exception {
		List list = getMembers(gNo);
		List listTwo = new ArrayList<GroupMemberDTO>();
		List memListFin = new ArrayList<GroupRequestDTO>();
		for(int i = 0; i < list.size(); i++) {
			if(((GroupMemberDTO)list.get(i)).getStatus() == 1) {
				listTwo.add(list.get(i));
			}
		}
		//참여중인멤버들
		
		GroupSpaceDTO dto = groupSpaceDAO.getContent(gNo);
		for(int i =0; i <listTwo.size(); i++) {
			if(!((GroupMemberDTO)listTwo.get(i)).getId().equals(dto.getId())) {   //아이디가 개설자랑 같으면 목록에 안넣을꺼임 )
				System.out.println(" 담긴다 그룹번호 : " + ((GroupMemberDTO)listTwo.get(i)).getgNo() + "아뒤 출력" +  ((GroupMemberDTO)listTwo.get(i)).getId());
				memListFin.add(groupRequestDAO.getMemRequests(((GroupMemberDTO)listTwo.get(i)).getgNo(), ((GroupMemberDTO)listTwo.get(i)).getId()));
			}
		}
		
		return memListFin;
	}
	
	
	//그룹에 들어온 신청 목록들 가져오기
	@Override
	public List getRequests(int gNo) throws Exception {
		List reqList = new ArrayList();
		reqList = groupRequestDAO.getRequests(gNo);
		return reqList;
	}
	
	
	
	
	
	//신청 수락 및 거절 처리
	@Override
	public boolean acceptOrReject(String id, int gNo, int status) throws Exception {
		boolean result = false;
		//1(수락)이 넘어오면 groupSpace의 actualNum +1 / 2(거절)가 넘어오면 변화 없음 / 3(강퇴)이 넘어오면  actualNum -1
		if(status==1) {
			GroupSpaceDTO article = groupSpaceDAO.getContent(gNo);
			if(article.getActualNum()<article.getMaxNum()) {
				groupSpaceDAO.updateActNum(gNo,1);
				groupMemberDAO.changeMemStatus(id,gNo,status);
				result = true;
			}else {
				result = false;
			}
		}else if(status==3) {
			groupSpaceDAO.updateActNum(gNo,-1);
			groupMemberDAO.changeMemStatus(id,gNo,status);
			result = true;
		}else if(status==2) {			
			groupMemberDAO.changeMemStatus(id,gNo,status);
			result = true;
		}
		System.out.println(id);
		System.out.println(gNo);
		System.out.println(status);
		return result;
	}
	
	//갤러리 이미지 업로드
	@Override
	public void uploadImage(GalleryDTO dto) throws Exception {
		galleryDAO.uploadImage(dto);
	}
	
	//그룹 갤러리 이미지들 가져오기
	@Override
	public List getGroupImgs(int gNo) throws Exception {
		List list = new ArrayList();
		list = galleryDAO.getGroupImgs(gNo);
		return list;
	}
	
	//사진 좋아요
	@Override
	public void imgLiked(String id, int gNo, int pNo) throws Exception {
		//Gallery 테이블에 해당 사진 likedCnt 1 추가
		galleryDAO.updateLikedCnt(pNo,1);
		//GallertLiked 테이블에 레코드 추가
		galleryLikedDAO.imgLiked(id, gNo, pNo);
	}
	
	//사진 좋아요 취소
	@Override
	public void imgLikedCancel(String id, int gNo, int pNo) throws Exception {
		galleryDAO.updateLikedCnt(pNo, -1);
		galleryLikedDAO.imgLikedCancel(id, gNo, pNo);
	}
	
	//회원이 특정 사진에 좋아요 했는지 여부 체크
	@Override
	public int likedCount(String id, int pNo) throws Exception {
		int count = galleryLikedDAO.likedCount(id, pNo);
		return count;
	}
	
	
	// jbr : 그룹리퀘스트 pos 신청자수 세기
	@Override
	public int posCount(int gNo, int posNo) {
		int posCnt = groupRequestDAO.posCount(gNo,posNo);
		return posCnt;
	}
	
	//cyh
	@Override
	public void insertSchedule(int gNo, String sDate, String sCont) throws Exception {
		scheduleDAO.insertSchedule(gNo, sDate, sCont);		
	}

	//cyh
	@Override
	public void updateSchedule(ScheduleDTO dto) throws Exception {
		scheduleDAO.updateSchedule(dto);
	}
	
	//cyh
	@Override
	public List getSchedule(int gNo) throws Exception{
		List scheList = scheduleDAO.getSchedule(gNo);
		return scheList;
	}
	
	//cyh
	@Override
	public void selectSchedule(int gNo) throws Exception{
		scheduleDAO.selectSchedule(gNo);
	}
	
	//cyh
	@Override
	public void deleteSchedule(int sNo) throws Exception{
		scheduleDAO.deleteSchedule(sNo);
		System.out.println("sNo 서비스"+ sNo);
	}
	
	//jbr 그룹관리 : 전체 그룹목록 가져오기
	@Override
	public List<GroupSpaceDTO> groupAllList() {
		
		List groupAllList = groupSpaceDAO.groupAllList();
		
		return groupAllList;
	}
	
	
	// jbr 그룹관리 : 전체그룹 개수 가져오기
	@Override
	public int groupAllCnt() {
		int groupAllCnt = groupSpaceDAO.groupAllCnt();
		return groupAllCnt;
	}
	
	
	// jbr 그룹관리 : 검색 결과 그룹목록 가져오기
	public List searchGroupList(String sel, String search) {
		List searchGroupList = groupSpaceDAO.searchGroupList(sel, search);
		
		
		return searchGroupList;
	}
	
	
	// jbr 그룹관리 : 검색 결과 개수
	public int searchGroupCtn(String sel, String search) {
		int searchGroupCtn = groupSpaceDAO.searchGroupCtn(sel, search);
		
		return searchGroupCtn;
	}
	
	
	//jbr gNo에 해당하는 그룹스페이스 가져오기
	public GroupSpaceDTO getGroup(int gNo) {
		GroupSpaceDTO getGroup = groupSpaceDAO.getGroup(gNo);
		
		return getGroup;
	}
	
	
	//채팅 입력
	@Override
	public void sendChat(int gNo, String writer, String cont) throws Exception {
		chattingDAO.sendChat(gNo, writer, cont);
	}
		

	//채팅 리스트 출력
	@Override
	public List getChats(int gNo) throws Exception {
		List chatList = chattingDAO.getChats(gNo);
		return chatList;
	}
	
	//마지막 채팅 메시지 출력
	@Override
	public ChattingDTO getLastChat(int gNo) throws Exception {
		ChattingDTO last = chattingDAO.getLastChat(gNo);
		return last;
	}
	
	//그룹 여행 상태 변경
	@Override
	public void changeGrpStatus(int gNo, int status) throws Exception {
		groupSpaceDAO.changeGrpStatus(gNo, status);
	}
	
	//모든 그룹 글 가져오기
	@Override
	public List getAllGroups() throws Exception {
		List list = groupSpaceDAO.getAllGroups();
		return list;
	}
	
	//그룹삭제할때 그룹리퀘스트 삭제
	@Override
	public void deleteGroupReq(int gNo) {
		System.out.println("그룹리퀘삭제1");
		groupRequestDAO.deleteGroupReq(gNo);
		System.out.println("그룹리퀘삭제2");
	}
	
	//그룹삭제할때 그룹멤버 삭제
	@Override
	public void deleteGroupMem(int gNo) {
		System.out.println("그룹멤삭제1");
		groupMemberDAO.deleteGroupMem(gNo);
		System.out.println("그룹멤삭제2");
	}
	
	//개설자 총평작성
	@Override
	public void genReview(String id, int gNo, String genReview) {
		groupSpaceDAO.genReview(id,gNo,genReview);
	}
	
	//그룹멤버 총평댓
	@Override
	public void genReply(String id, int gNo, String genReply) {
		
		groupSpaceDAO.genReply(id,gNo,genReply);
	}
	//총평가져오기
	@Override
	public List getReview(int gNo)throws Exception {
		List reviewList = new ArrayList();
		List<GroupMemberDTO> review = groupMemberDAO.getMembers(gNo);
		for(int i=0; i<review.size(); i++) {
			if(review.get(i).getGenReply() != null) {
				reviewList.add(review.get(i));
			}
			
		}
		System.out.println("리뷰리스트" + reviewList);
		
		return reviewList;
	}
	
	// 본인이 총평 썼는지 확인
	@Override
	public int chReview(int gNo, String id) {
		int result = 0;
		GroupMemberDTO dto = new GroupMemberDTO();
		if(id==null) {
		//	id가 null이어서 발생하는 nullPointerException 방지
			id = "";
			dto.setId("");
			result = 0;
		}else {
		//	id가 해당 그룹의 멤버가 아니어서 발생하는 nullPointerException 방지
			dto = groupMemberDAO.chReview(gNo, id);
			if(dto==null) {
				result = 0;				
			}else {
				if(dto.getGenReply() == null) {
					result = 1;
				}				
			}
		}
		
		return result;
	}
	
	//공개여부 업데이트
	@Override
	public void updateShared(int gNo, int shared) {
		System.out.println("서비스 들어감 ");
		groupSpaceDAO.updateShared(gNo,shared);
		System.out.println("서비스 나옴 ");
	}
	
	//일정 개수 카운트
	@Override
	public int scheCnt(int gNo) {
		int scheCnt = scheduleDAO.scheCnt(gNo);
		return scheCnt;
	}

}
