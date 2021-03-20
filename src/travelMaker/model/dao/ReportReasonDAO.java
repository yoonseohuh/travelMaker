package travelMaker.model.dao;

import java.sql.SQLException;

import travelMaker.model.dto.ReportReasonDTO;

public interface ReportReasonDAO {
	public void addReason(ReportReasonDTO dto) throws SQLException;
}
