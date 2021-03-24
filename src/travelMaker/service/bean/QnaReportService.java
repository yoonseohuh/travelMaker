package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.model.dto.ReportDetailDTO;
import travelMaker.model.dto.ReportReasonDTO;

public interface QnaReportService {

	public void insertReason(ReportReasonDTO dto) throws SQLException;

	public List selectReason(int rType) throws SQLException;

	public List selectReasonAll() throws SQLException;

	public void insertQna(QnaBoardDTO dto) throws SQLException;
	public Map getQnas(String pageNum) throws SQLException;
	public String getRCont(QnaBoardDTO dto) throws SQLException;

	public void insertReport(ReportDetailDTO dto) throws SQLException;
	public Map getReports(String pageNum) throws SQLException;
	public String getRCont(ReportDetailDTO dto) throws SQLException;

}