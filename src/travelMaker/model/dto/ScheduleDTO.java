package travelMaker.model.dto;

import java.sql.Timestamp;

public class ScheduleDTO {
	
	private Integer gNo, sNo;
	private Timestamp sDate;
	private String sCont;
	
	public Integer getgNo() { return gNo; }
	public void setgNo(Integer gNo) { this.gNo = gNo; }
	
	public Integer getsNo() { return sNo; }
	public void setsNo(Integer sNo) { this.sNo = sNo; }
	
	public Timestamp getsDate() { return sDate; }
	public void setsDate(Timestamp sDate) { this.sDate = sDate; }
	
	public String getsCont() { return sCont; }
	public void setsCont(String sCont) { this.sCont = sCont; }
	
}
