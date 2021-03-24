package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.model.dto.ReportDetailDTO;

@Repository
public class ReportDetailDAOImpl implements ReportDetailDAO {
		
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	//신고유형 불러오기
	@Override
	public String getRCont(ReportDetailDTO dto) throws SQLException {
		String rCont = sqlSession.selectOne("reportDetail.selectRCont", dto);
		return rCont;
	}
	
	//신고게시글 등록
	@Override
	public void insertReport(ReportDetailDTO dto) throws SQLException {
		sqlSession.insert("reportDetail.insertReport", dto);
	}
	
	//신고게시글 개수 리턴
	@Override
	public int getArticleCount() throws SQLException {
		return sqlSession.selectOne("reportDetail.getArticleCount");
	}
	
	//신고게시글 보여주기
	@Override
	public List getArticles(int start, int end) throws SQLException {
		Map map = new HashMap();
		map.put("start",start);
		map.put("end",end);
		List qnaList = sqlSession.selectList("reportDetail.getArticles",map);
		return qnaList;
	}
	
	//신고게시글 내용 하나 가져오기
	@Override
	public ReportDetailDTO getContent(int reportNo) throws SQLException {
		return sqlSession.selectOne("reportDetail.getContent",reportNo);
	}
	
	//신고게시글 삭제
	@Override
	public void deleteContent(int reportNo) throws SQLException {
		sqlSession.delete("reportDetail.deleteReport",reportNo);
	}
}
