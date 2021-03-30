package travelMaker.service.bean;

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
	public void updateSchedule() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void getSchedule(ScheduleDTO dto) throws Exception{
		scheduleDAO.getSchedule(dto);
	}


}
