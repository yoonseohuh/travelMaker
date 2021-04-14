package travelMaker.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import travelMaker.model.dto.ScheduleDTO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	

	@Override
	public void insertSchedule(int gNo, String sDate, String sCont) throws Exception {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("sDate", sDate);
		map.put("sCont", sCont);
		sqlSession.insert("schedule.insertSchedule", map);
		
	}

	@Override
	public void updateSchedule(ScheduleDTO dto) throws Exception {
		System.out.println("DAO왔니 "+dto.getsCont());		
		sqlSession.update("schedule.updateSchedule", dto);
	}
	
	@Override
	public void selectSchedule(int gNo) throws Exception{
		sqlSession.selectList("schedule.selectSchedule", gNo);
	}

	@Override
	public List getSchedule(int gNo) throws Exception{
		List scheList = sqlSession.selectList("schedule.selectSchedule", gNo);
		return scheList;
	}
	
	@Override
	public void deleteSchedule(int sNo) throws Exception{
		sqlSession.delete("schedule.deleteSchedule", sNo);
	}

	//일정 개수 카운트
	@Override
	public int scheCnt(int gNo) {
		int scheCnt = sqlSession.selectOne("schedule.scheCnt", gNo);
		return scheCnt;
	}

}
