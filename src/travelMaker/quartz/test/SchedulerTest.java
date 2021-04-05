package travelMaker.quartz.test;

import java.util.Date;

import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import travelMaker.service.bean.TravelService;



@DisallowConcurrentExecution
public class SchedulerTest implements Job {
	
	@Autowired
	private TravelService travelService = null;
	
	public void execute(JobExecutionContext context) throws JobExecutionException {
		System.out.println("스케줄러 동작 테스트: 현재 시각["+new Date(System.currentTimeMillis())+"]");
		try {
			int gender = travelService.getGender("yoon2");
			System.out.println(gender);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
