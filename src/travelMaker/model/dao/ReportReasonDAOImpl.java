package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.model.dto.ReportReasonDTO;

@Repository
public class ReportReasonDAOImpl implements ReportReasonDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public void insertReason(ReportReasonDTO dto) throws SQLException {
		sqlSession.insert("reportReason.insertReason", dto);
	}
	
	@Override
	public List selectReason(int rType) throws SQLException {		
		List res = sqlSession.selectList("reportReason.selectReason", rType);		
		return res;
	}
	
	@Override
	public List selectReasonAll() throws SQLException {		
		List res = sqlSession.selectList("reportReason.selectReasonAll");		
		return res;
	}
	
}