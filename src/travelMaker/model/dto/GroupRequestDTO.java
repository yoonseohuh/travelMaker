package travelMaker.model.dto;

import java.sql.Timestamp;

public class GroupRequestDTO {
	
	private Integer gNo;
	private String id;
	private Integer reqType, posNo;
	private String reqTxt;
	private Timestamp reg;
	
	public Integer getgNo() { return gNo; }
	public void setgNo(Integer gNo) { this.gNo = gNo; }
	
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	
	public Integer getReqType() { return reqType; }
	public void setReqType(Integer reqType) { this.reqType = reqType; }
	
	public Integer getPosNo() { return posNo; }
	public void setPosNo(Integer posNo) { this.posNo = posNo; }
	
	public String getReqTxt() { return reqTxt; }
	public void setReqTxt(String reqTxt) { this.reqTxt = reqTxt; }
	
	public Timestamp getReg() { return reg; }
	public void setReg(Timestamp reg) { this.reg = reg; }
	
}
