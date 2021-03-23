package travelMaker.service.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import travelMaker.model.dao.GroupMemberDAO;
import travelMaker.model.dao.GroupRequestDAO;
import travelMaker.model.dao.GroupSpaceDAO;
import travelMaker.model.dao.SmallPosDAO;
import travelMaker.model.dao.TmUserDAO;
import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.SmallPosDTO;
import travelMaker.model.dto.TmUserDTO;

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
	
	//개설글 작성
	@Override
	public void insertMaking(GroupSpaceDTO dto) throws Exception {
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
	}
	
	//모집 중인 개설글들 가져오기
	@Override
	public Map getArticles(String pageNum) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		int pageSize = 5;
		if(pageNum==null || pageNum.equals("")) { pageNum="1"; }
		int currPage = Integer.parseInt(pageNum);
		int start = (currPage-1)*pageSize+1;
		int end = currPage*pageSize;
		List articleList = null;
		
		int count = groupSpaceDAO.getArticleCount();
		if(count>0) {
			articleList = groupSpaceDAO.getArticles(start, end);			
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
		
		//groupRequest테이블에 insert
		if(dto.getReqType()==0) {
			dto.setPosNo(-1);
		}
		groupRequestDAO.applyForGroup(dto);
		//groupMember테이블에 insert
		groupMemberDAO.insertMemToGroup(applicant);
	}
	
	
	
	
	
}
