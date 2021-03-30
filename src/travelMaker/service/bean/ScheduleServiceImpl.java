package travelMaker.service.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.ScheduleDAO;
import travelMaker.model.dto.ScheduleDTO;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleDAO scheduleDAO = null;

	@Override
	public void insertSchedule(String gNo, String sDate, String sCont) throws Exception {
		scheduleDAO.insertSchedule(gNo, sDate, sCont);
		
	}

	@Override
	public void updateSchedule(ScheduleDTO dto) throws Exception {
		scheduleDAO.updateSchedule(dto);
		
	}
	
	@Override
	public List getSchedule(int gNo) throws Exception{
		List scheList = scheduleDAO.getSchedule(gNo);
		return scheList;
	}
	
	@Override
	public void selectSchedule(int gNo) throws Exception{
		scheduleDAO.selectSchedule(gNo);
	}
	
	@Override
	public void deleteSchedule(ScheduleDTO dto) throws Exception{
		
	}
	



}
