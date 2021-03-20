package travelMaker.service.bean;

import java.sql.SQLException;

import travelMaker.model.dto.ReportReasonDTO;

public interface QnaReportService {

	void addReason(ReportReasonDTO dto) throws SQLException;

}