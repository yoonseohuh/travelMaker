package travelMaker.model.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.ReportReasonDTO;

@Repository
public class ReportReasonDAOImpl implements ReportReasonDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public void addReason(ReportReasonDTO dto) throws SQLException {
		System.out.println("dao!!!!");
		System.out.println(dto.getrCont());
		sqlSession.insert("reportReason.addReason", dto);
	}
	
}