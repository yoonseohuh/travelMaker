package travelMaker.model.dto;

import java.sql.Timestamp;

public class MessageDTO {
	private Integer mNo;
	private String receiver, sender, mCont;
	private Integer mStatus;
	private Timestamp reg;
	public Integer getmNo() {
		return mNo;
	}
	public void setmNo(Integer mNo) {
		this.mNo = mNo;
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
	public String getmCont() {
		return mCont;
	}
	public void setmCont(String mCont) {
		this.mCont = mCont;
	}
	public Integer getmStatus() {
		return mStatus;
	}
	public void setmStatus(Integer mStatus) {
		this.mStatus = mStatus;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	
	
	
}
