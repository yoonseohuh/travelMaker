package travelMaker.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;

@Repository
public class GroupSpaceDAOImpl implements GroupSpaceDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	//개설글 작성
	@Override
	public void insertMaking(GroupSpaceDTO dto) throws Exception {
		sqlSession.insert("groupSpace.insertMaking",dto);
	}
	
	//모집 중인 게시글 개수 리턴
	@Override
	public int getArticleCount() throws Exception {
		return sqlSession.selectOne("groupSpace.getArticleCount");
	}
	
	//모집 중인 게시글 중 검색 결과에 부합하는 게시글 개수 리턴
	@Override
	public int getSearchArticleCount(String startD, String endD) throws Exception {
		Map map = new HashMap();
		map.put("startD",startD);
		map.put("endD",endD);
		return sqlSession.selectOne("groupSpace.getSearchArticleCount",map);
	}
	
	//모집중 게시글 보여주기
	@Override
	public List getArticles(int start, int end) throws Exception {
		Map map = new HashMap();
		map.put("start",start);
		map.put("end",end);
		List articleList = sqlSession.selectList("groupSpace.getArticles",map);
		return articleList;
	}
	
	//모집 중인 게시글 중 검색 결과에 부합하는 게시글 보여주기
	@Override
	public List getSearchArticles(int start, int end, String startD, String endD) throws Exception {
		Map map = new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("startD",startD);
		map.put("endD",endD);
		List articleList = sqlSession.selectList("groupSpace.getSearchArticles",map);
		return articleList;
	}
	
	//모집 중 게시글 내용 하나 가져오기
	@Override
	public GroupSpaceDTO getContent(int gNo) throws Exception {
		return sqlSession.selectOne("groupSpace.getContent",gNo);
	}
	
	//모집 게시글 삭제
	@Override
	public void deleteContent(int gNo) throws Exception {
		sqlSession.delete("groupSpace.deleteContent",gNo);
	}
	
	//참여 인원수 카운트 증감시키기
	@Override
	public void updateActNum(int gNo, int num) throws Exception {
		Map map = new HashMap();
		map.put("gNo",gNo);
		map.put("actualNum",num);
		sqlSession.update("groupSpace.updateActNum",map);
	}
	
	
	//jbr 그룹관리 : 전체 그룹목록 가져오기
	@Override
	public List<GroupSpaceDTO> groupAllList() {
		List groupAllList = sqlSession.selectList("groupSpace.groupAllList");
		
		return groupAllList;
	}
	
	
}
