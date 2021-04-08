package travelMaker.model.dao;

import java.util.ArrayList;
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

	// jbr 그룹관리 : 그룹 개수 가져오기
	@Override
	public int groupAllCnt() {
		int groupAllCnt = sqlSession.selectOne("groupSpace.groupAllCnt");
		
		return groupAllCnt;
	}

	// jbr 검색결과 개수
	@Override
	public int searchGroupCtn(String sel, String search) {
		Map map = new HashMap();
		map.put("sel", sel);
		map.put("search", search);
		int searchGroupCtn = sqlSession.selectOne("groupSpace.searchGroupCtn", map);
		
		return searchGroupCtn;
	}
	
	//jbr 검색결과 리스트 가져오기
	public List searchGroupList(String sel, String search) {
		System.out.println("그룹스페이스dao탄다" + sel + "/" + search);
		Map map = new HashMap();
		map.put("sel", sel);
		map.put("search", search);
	
		List searchGroupList = sqlSession.selectList("groupSpace.searchGroupList", map);
		System.out.println("검색결과리스트:" + searchGroupList);
		return searchGroupList;
	}
	
	//jbr gNo에 해당하는 그룹스페이스 가져오기
	public GroupSpaceDTO getGroup(int gNo) {
		GroupSpaceDTO getGroup = sqlSession.selectOne("groupSpace.getGroup", gNo);
		return getGroup;
	}
	
	

	//그룹 상태 변경
	@Override
	public void changeGrpStatus(int gNo, int status) throws Exception {
		Map map = new HashMap();
		map.put("gNo",gNo);
		map.put("status",status);
		sqlSession.update("groupSpace.changeGrpStatus",map);
	}
	
	//모든 그룹 글 가져오기
	@Override
	public List getAllGroups() throws Exception {
		List list = sqlSession.selectList("groupSpace.getAllGroups");
		return list;
	}

	//개설자 총평작성
	@Override
	public void genReview(String id, int gNo, String genReview) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("gNo", gNo);
		map.put("genReview", genReview);
		
		sqlSession.update("groupSpace.genReview", map);
	}

	
	//그룹멤버 총평댓글
	@Override
	public void genReply(String id, int gNo, String genReply) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("gNo", gNo);
		map.put("genReply", genReply);
		
		sqlSession.update("groupMember.genReply", map);
	}
	
	//공개여부 업데이트
	@Override
	public void updateShared(int gNo, int shared) {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("shared", shared);
		System.out.println("DAO 들어감");
		sqlSession.update("groupSpace.updateShared", map);
		System.out.println("DAO 나옴");
	}

	
}
