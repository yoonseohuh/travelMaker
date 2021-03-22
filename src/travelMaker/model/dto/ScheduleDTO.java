package travelMaker.model.dto;

public class ScheduleDTO {
	
	private Integer gNo, sNo;
	private String sDate;
	private String sCont;
	
	public Integer getgNo() { return gNo; }
	public void setgNo(Integer gNo) { this.gNo = gNo; }
	
	public Integer getsNo() { return sNo; }
	public void setsNo(Integer sNo) { this.sNo = sNo; }
	
	public String getsDate() { return sDate; }
	public void setsDate(String sDate) { this.sDate = sDate; }
	
	public String getsCont() { return sCont; }
	public void setsCont(String sCont) { this.sCont = sCont; }
	
}
