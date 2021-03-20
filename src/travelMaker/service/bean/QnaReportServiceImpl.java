package travelMaker.service.bean;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.ReportReasonDAO;
import travelMaker.model.dto.ReportReasonDTO;

@Service
public class QnaReportServiceImpl implements QnaReportService {
	
	@Autowired
	ReportReasonDAO reportReasonDAO = null;
	
	@Override
	public void addReason(ReportReasonDTO dto) throws SQLException {
		System.out.println("service!!!!");
		reportReasonDAO.addReason(dto);
	}
	
}