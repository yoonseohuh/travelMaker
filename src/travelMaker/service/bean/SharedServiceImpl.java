package travelMaker.service.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.GroupSpaceDAO;
import travelMaker.model.dao.SharedDAO;
import travelMaker.model.dto.GroupSpaceDTO;

@Service
public class SharedServiceImpl implements SharedService {

	@Autowired
	private SharedDAO sharedDAO = null;
	
	@Autowired
	private GroupSpaceDAO groupSpaceDAO = null;

	@Override
	public Map getArtilces(String pageNum) throws Exception {
		int pageSize= 8;
		if(pageNum==null || pageNum.equals("")) {
			pageNum="1";
		}
		int currPage = Integer.parseInt(pageNum);
		int startRow = (currPage-1)*pageSize+1;
		int endRow = currPage*pageSize;
		List sharedList = null;
		int count = sharedDAO.getArticleCount();
		//System.out.println(count);
		if(count>0) {
			sharedList = sharedDAO.getArticles(startRow, endRow);
		}
		
		for(int i=0 ; i<sharedList.size() ; i++) {
			GroupSpaceDTO dto = (GroupSpaceDTO)sharedList.get(i);
			//System.out.print(dto.getSubject()+"/");
		}
		
		
		int number = count - (currPage -1) * pageSize;
		
		Map result = new HashMap();
		result.put("pageSize", pageSize);
		result.put("currPage", currPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("number", number);
		result.put("count", count);
		result.put("sharedList", sharedList);
		result.put("pageNum", pageNum);
		//System.out.println("dao 왔는데 서비스는 어딨니");
		
		
		return result;
	}
	
	@Override
	public GroupSpaceDTO getArticle(int gNo) throws Exception {
		GroupSpaceDTO article = sharedDAO.getArticle(gNo);
		//System.out.println("서비스"+gNo);
		//System.out.println("서비스"+ article);
		//System.out.println("dao 왔으니까 서비스는 왔니?");
		
		return article;
	}
	
	
	
	

}
