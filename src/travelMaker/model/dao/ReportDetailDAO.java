package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.List;

import travelMaker.model.dto.ReportDetailDTO;

public interface ReportDetailDAO {
	public void insertReport(ReportDetailDTO dto) throws SQLException;

	public int getArticleCount() throws SQLException;

	public List getArticles(int start, int end) throws SQLException;

	public ReportDetailDTO getContent(int reportNo) throws SQLException;

	public void deleteContent(int reportNo) throws SQLException;
	
	public String getRCont(ReportDetailDTO dto) throws SQLException;	
}
