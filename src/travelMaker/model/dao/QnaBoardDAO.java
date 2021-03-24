package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.List;

import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.model.dto.ReportDetailDTO;

public interface QnaBoardDAO {
	public void insertQna(QnaBoardDTO dto) throws SQLException;

	public int getArticleCount() throws SQLException;

	public List getArticles(int start, int end) throws SQLException;

	public QnaBoardDTO getContent(int gNo) throws SQLException;

	public void deleteContent(int gNo) throws SQLException;

	public String getRCont(QnaBoardDTO dto) throws SQLException;	
}
