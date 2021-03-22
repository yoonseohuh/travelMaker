package travelMaker.model.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.model.dto.ReportReasonDTO;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public void insertQna(QnaBoardDTO dto) throws SQLException {
		sqlSession.insert("qnaBoard.insertQna", dto);
	}
	
}
