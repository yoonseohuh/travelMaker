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
import travelMaker.model.dao.GroupSpaceDAO;
import travelMaker.model.dao.TmUserDAO;
import travelMaker.model.dto.GroupSpaceDTO;

@Service
public class TravelServiceImpl implements TravelService{
	
	@Autowired
	private GroupSpaceDAO groupSpaceDAO = null;
	@Autowired
	private TmUserDAO tmUserDAO = null;
	@Autowired
	private GroupMemberDAO groupMemberDAO = null;
	
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
	
	
	
	
}
