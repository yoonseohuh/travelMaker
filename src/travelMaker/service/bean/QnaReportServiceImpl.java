package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.QnaBoardDAO;
import travelMaker.model.dao.ReportReasonDAO;
import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.model.dto.ReportReasonDTO;

@Service
public class QnaReportServiceImpl implements QnaReportService {
	
	@Autowired
	ReportReasonDAO reportReasonDAO = null;
	
	@Autowired
	QnaBoardDAO qnaBoardDAO = null;
	
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
	
	@Override
	public void insertQna(QnaBoardDTO dto) throws SQLException {
		qnaBoardDAO.insertQna(dto);		
	}
	
}