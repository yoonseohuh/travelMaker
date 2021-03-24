package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.QnaBoardDTO;
import travelMaker.model.dto.ReportReasonDTO;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	//문의유형 불러오기
	@Override
	public String getRCont(QnaBoardDTO dto) throws SQLException {
		String rCont = sqlSession.selectOne("qnaBoard.selectRCont", dto);
		return rCont;
	}
	
	//문의게시글 등록
	@Override
	public void insertQna(QnaBoardDTO dto) throws SQLException {
		sqlSession.insert("qnaBoard.insertQna", dto);
	}
	
	//문의게시글 개수 리턴
	@Override
	public int getArticleCount() throws SQLException {
		return sqlSession.selectOne("qnaBoard.getArticleCount");
	}
	
	//문의게시글 보여주기
	@Override
	public List getArticles(int start, int end) throws SQLException {
		Map map = new HashMap();
		map.put("start",start);
		map.put("end",end);
		List qnaList = sqlSession.selectList("qnaBoard.getArticles",map);
		return qnaList;
	}

	//문의게시글 내용 하나 가져오기
	@Override
	public QnaBoardDTO getContent(int qNo) throws SQLException {
		return sqlSession.selectOne("qnaBoard.getContent",qNo);
	}
	
	//문의게시글 삭제
	@Override
	public void deleteContent(int qNo) throws SQLException {
		sqlSession.delete("qnaBoard.deleteQna",qNo);
	}	
}
