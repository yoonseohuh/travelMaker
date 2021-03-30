package travelMaker.service.bean;

import travelMaker.model.dto.ScheduleDTO;

public interface ScheduleService {

	// 일정 생성
	public void insertSchedule(String gNo, String sDate, String sCont) throws Exception;

	// 일정 수정
	public void updateSchedule() throws Exception;
	
	// 일정 뿌려주기 
	public void getSchedule(ScheduleDTO dto) throws Exception;


	
}
