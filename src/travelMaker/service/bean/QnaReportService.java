package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.List;

import travelMaker.model.dto.ReportReasonDTO;

public interface QnaReportService {

	public void insertReason(ReportReasonDTO dto) throws SQLException;

	public List selectReason(int rType) throws SQLException;

	public List selectReasonAll() throws SQLException;

}