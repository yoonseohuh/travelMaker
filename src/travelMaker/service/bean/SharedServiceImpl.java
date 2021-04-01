package travelMaker.service.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.SharedDAO;

@Service
public class SharedServiceImpl implements SharedService {

	@Autowired
	private SharedDAO sharedDAO = null;

	@Override
	public Map getArtilces(String pageNum) throws Exception {
		int pageSize=8;
		if(pageNum==null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currPage = Integer.parseInt(pageNum);
		int startRow = (currPage - 1) * pageSize + 1;
		int endRow = currPage * pageSize;
		
		List articleList = null;
		
		int count = sharedDAO.getArticleCount();
		if(count > 0) {
			articleList = sharedDAO.getArticles(startRow, endRow);
		}
		int number = count - (currPage -1) * pageSize;
		Map result = new HashMap();
		
		result.put("pageSize", pageSize);
		result.put("currPage", currPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("number", number);
		result.put("count", count);
		result.put("articleList", articleList);
		result.put("pageNum", pageNum);
		
		return result;
	}
	
	

}
