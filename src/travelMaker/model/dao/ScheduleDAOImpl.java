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
	public void insertSchedule(String gNo, String sDate, String sCont) throws Exception {
		Map map = new HashMap();
		map.put("gNo", gNo);
		map.put("sDate", sDate);
		map.put("sCont", sCont);
		sqlSession.insert("schedule.insertSchedule", map);
		
	}

	@Override
	public void updateSchedule(ScheduleDTO dto) throws Exception {
		sqlSession.update("schedule.updateSchedule", dto);
		System.out.println(dto.getsCont());
		System.out.println(dto.getsNo());
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
	public void deleteSchedule(ScheduleDTO dto) throws Exception{
		
	}



}
