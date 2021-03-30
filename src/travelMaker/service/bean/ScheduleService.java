package travelMaker.service.bean;

import java.util.List;

import travelMaker.model.dto.ScheduleDTO;

public interface ScheduleService {

	// 일정 생성
	public void insertSchedule(String gNo, String sDate, String sCont) throws Exception;
	// 일정 수정
	public void updateSchedule(ScheduleDTO dto) throws Exception;
	// 일정 뿌려주기 
	public void selectSchedule(int gNo) throws Exception;
	// 일정 리스트
	public List getSchedule(int gNo) throws Exception;
	// 일정 삭제
	public void deleteSchedule(ScheduleDTO dto) throws Exception;
	




	
}
