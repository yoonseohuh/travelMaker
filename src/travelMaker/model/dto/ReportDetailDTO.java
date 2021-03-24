package travelMaker.model.dto;

import java.sql.Timestamp;

public class ReportDetailDTO {
	private String id;
	private Integer rType;
	private Integer rNo;
	private Integer status;
	private Timestamp reg;
	private String rCont;
	private Integer lNo;
	private Integer mNo;
	private Integer cNo;
	private Integer chatNo;
	private Integer gNo;
	private String feedback;
	private Timestamp fbReg;
	private Integer reportNo;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getrType() {
		return rType;
	}
	public void setrType(Integer rType) {
		this.rType = rType;
	}
	public Integer getrNo() {
		return rNo;
	}
	public void setrNo(Integer rNo) {
		this.rNo = rNo;
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
	public String getrCont() {
		return rCont;
	}
	public void setrCont(String rCont) {
		this.rCont = rCont;
	}
	public Integer getlNo() {
		return lNo;
	}
	public void setlNo(Integer lNo) {
		this.lNo = lNo;
	}
	public Integer getmNo() {
		return mNo;
	}
	public void setmNo(Integer mNo) {
		this.mNo = mNo;
	}
	public Integer getcNo() {
		return cNo;
	}
	public void setcNo(Integer cNo) {
		this.cNo = cNo;
	}
	public Integer getChatNo() {
		return chatNo;
	}
	public void setChatNo(Integer chatNo) {
		this.chatNo = chatNo;
	}
	public Integer getgNo() {
		return gNo;
	}
	public void setgNo(Integer gNo) {
		this.gNo = gNo;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public Timestamp getFbReg() {
		return fbReg;
	}
	public void setFbReg(Timestamp fbReg) {
		this.fbReg = fbReg;
	}
	public Integer getReportNo() {
		return reportNo;
	}
	public void setReportNo(Integer reportNo) {
		this.reportNo = reportNo;
	}	
	
}
