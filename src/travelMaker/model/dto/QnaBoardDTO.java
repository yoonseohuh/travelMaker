package travelMaker.model.dto;

import java.sql.Timestamp;

public class QnaBoardDTO {
	private Integer qNo;
	private String id;
	private Integer rType;
	private Integer rNo;
	private String rCont;
	private Integer status;
	private String content;
	private String feedback;
	private Timestamp reg;
	private Timestamp fbReg;
	public Integer getqNo() {
		return qNo;
	}
	public void setqNo(Integer qNo) {
		this.qNo = qNo;
	}
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
	
	public String getrCont() {
		return rCont;
	}
	public void setrCont(String rCont) {
		this.rCont = rCont;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public Timestamp getFbReg() {
		return fbReg;
	}
	public void setFbReg(Timestamp fbReg) {
		this.fbReg = fbReg;
	}
}
