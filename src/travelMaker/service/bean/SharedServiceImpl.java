package travelMaker.service.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.GroupSpaceDAO;
import travelMaker.model.dao.SharedDAO;
import travelMaker.model.dao.sharedLikedDAO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.SharedLikedDTO;

@Service
public class SharedServiceImpl implements SharedService {

	@Autowired
	private SharedDAO sharedDAO = null;
	
	@Autowired
	private sharedLikedDAO sharedLikedDAO = null;
	
	@Autowired
	private GroupSpaceDAO groupSpaceDAO = null;

	@Override
	public Map getArtilces(String pageNum) throws Exception {
		int pageSize= 8;
		if(pageNum==null || pageNum.equals("")) {
			pageNum="1";
		}
		int currPage = Integer.parseInt(pageNum);
		int start = (currPage-1)*pageSize+1;
		int end = currPage*pageSize;
		List sharedList = null;
		int count = sharedDAO.getArticleCount();
		//System.out.println(count);
		if(count>0) {
			sharedList = sharedDAO.getArticles(start, end);
		}
		
		for(int i=0 ; i<sharedList.size() ; i++) {
			GroupSpaceDTO dto = (GroupSpaceDTO)sharedList.get(i);
			//System.out.print(dto.getSubject()+"/");
		}
		
		
		int number = count - (currPage -1) * pageSize;
		
		Map result = new HashMap();
		result.put("pageSize", pageSize);
		result.put("currPage", currPage);
		result.put("start", start);
		result.put("end", end);
		result.put("number", number);
		result.put("count", count);
		result.put("sharedList", sharedList);
		result.put("pageNum", pageNum);
		//System.out.println("dao 왔는데 서비스는 어딨니");
		
		
		return result;
	}
	
	@Override
	public GroupSpaceDTO getArticle(int gNo) throws Exception {
		// readCnt 추가
		sharedDAO.updateReadCnt(gNo);
		
		//System.out.println("조회수 서비스도 왔니?");
		GroupSpaceDTO article = sharedDAO.getArticle(gNo);
		//System.out.println("서비스"+gNo);
		//System.out.println("서비스"+ article);
		//System.out.println("dao 왔으니까 서비스는 왔니?");
		
		
		return article;
	}

	// 좋아요
	@Override
	public void sharedLiked(int gNo, String id) throws Exception {
		sharedDAO.sharedLikedCnt(gNo, 1);
		sharedLikedDAO.sharedLiked(gNo, id);
		
		
	}
	// 좋아요를 했는지 안했는지
	@Override
	public int likedCheck(int gNo, String id) throws Exception {
		int check = sharedLikedDAO.likedCheck(gNo, id);
		//System.out.println("오냐?");
		return check;
	}


	@Override
	public List getSharedLiked(String id) throws Exception {
		List lsharedList = sharedLikedDAO.getSharedLiked(id);
		List<GroupSpaceDTO> list = new ArrayList();
		for(int i=0;i<lsharedList.size();i++) {
			SharedLikedDTO dto = (SharedLikedDTO)lsharedList.get(i);
			list.add(groupSpaceDAO.getContent(dto.getgNo()));
		}
		//System.out.println("sharedLikedlist 서비스 오니?");
		return list;
	}

	@Override
	public void sharedLikedCancel(int gNo, String id) throws Exception {
		//sharedLiked테이블에서 해당 레코드 delete
		sharedLikedDAO.sharedLikedCancel(gNo, id);
		//gNo 주고 groupSpace테이블의 likedCnt 하나빼기
		sharedDAO.sharedLikedCnt(gNo, -1);
	}

	

	

	
	
	

}
