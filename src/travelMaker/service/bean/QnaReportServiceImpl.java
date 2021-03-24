package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import travelMaker.model.dao.QnaBoardDAO;
import travelMaker.model.dao.ReportDetailDAO;
import travelMaker.model.dao.ReportReasonDAO;
import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.model.dto.ReportDetailDTO;
import travelMaker.model.dto.ReportReasonDTO;

@Service
public class QnaReportServiceImpl implements QnaReportService {
	
	@Autowired
	ReportReasonDAO reportReasonDAO = null;
	
	@Autowired
	QnaBoardDAO qnaBoardDAO = null;
	
	@Autowired
	ReportDetailDAO reportDetailDAO = null;
	
	//신고사유 및 문의유형
	@Override
	public void insertReason(ReportReasonDTO dto) throws SQLException {		
		reportReasonDAO.insertReason(dto);
	}
	
	@Override
	public List selectReason(int rType) throws SQLException {
		List res = reportReasonDAO.selectReason(rType);
		return res;
	}
	
	@Override
	public List selectReasonAll() throws SQLException {
		List res = reportReasonDAO.selectReasonAll();
		return res;
	}
	
	//문의작성
	@Override
	public String getRCont(QnaBoardDTO dto) throws SQLException {
		String rCont = qnaBoardDAO.getRCont(dto);
		return rCont;
	}
	
	@Override
	public void insertQna(QnaBoardDTO dto) throws SQLException {
		qnaBoardDAO.insertQna(dto);
	}
	
	//문의 게시글 가져오기
	@Override
	public Map getQnas(String pageNum) throws SQLException {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		int pageSize = 5;
		if(pageNum==null || pageNum.equals("")) { pageNum="1"; }
		int currPage = Integer.parseInt(pageNum);
		int start = (currPage-1)*pageSize+1;
		int end = currPage*pageSize;
		List qnaList = null;
		
		int count = qnaBoardDAO.getArticleCount();
		if(count>0) {
			qnaList = qnaBoardDAO.getArticles(start, end);			
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
		map.put("qnaList",qnaList);
		
		return map;
	}
	
	//신고작성
	@Override
	public String getRCont(ReportDetailDTO dto) throws SQLException {
		String rCont = reportDetailDAO.getRCont(dto);
		return rCont;
	}
	
	@Override
	public void insertReport(ReportDetailDTO dto) throws SQLException {
		reportDetailDAO.insertReport(dto);
	}
	
	//신고 게시글 가져오기
	@Override
	public Map getReports(String pageNum) throws SQLException {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		int pageSize = 5;
		if(pageNum==null || pageNum.equals("")) { pageNum="1"; }
		int currPage = Integer.parseInt(pageNum);
		int start = (currPage-1)*pageSize+1;
		int end = currPage*pageSize;
		List reportList = null;
		
		int count = qnaBoardDAO.getArticleCount();
		if(count>0) {
			reportList = qnaBoardDAO.getArticles(start, end);			
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
		map.put("reportList",reportList);
		
		return map;
	}
	
}