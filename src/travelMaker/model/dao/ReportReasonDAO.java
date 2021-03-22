package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.List;

import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.model.dto.ReportReasonDTO;

public interface ReportReasonDAO {
	public void insertReason(ReportReasonDTO dto) throws SQLException;

	public List selectReason(int rType) throws SQLException;

	public List selectReasonAll() throws SQLException;	
}
