package travelMaker.model.dto;

import java.sql.Timestamp;

public class UserCmtDTO {
	private Integer gNo,cNO;
	private String receiver, sender, cCont;
	private Integer status;
	private Timestamp reg;
	public Integer getgNo() {
		return gNo;
	}
	public void setgNo(Integer gNo) {
		this.gNo = gNo;
	}
	public Integer getcNO() {
		return cNO;
	}
	public void setcNO(Integer cNO) {
		this.cNO = cNO;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getcCont() {
		return cCont;
	}
	public void setcCont(String cCont) {
		this.cCont = cCont;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	
	

}
