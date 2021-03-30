package travelMaker.model.dao;

import java.util.HashMap;
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
	public void updateSchedule() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void getSchedule(ScheduleDTO dto) throws Exception{
		
	}



}
