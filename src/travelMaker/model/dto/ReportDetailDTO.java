package travelMaker.model.dto;

import java.sql.Timestamp;

public class ReportDetailDTO {
	private Integer gNo;
	private Integer num;
	private String id;
	private Integer rType;
	private Integer rCont;
	private Integer rNo;
	private Integer status;
	private String feedback;
	private Timestamp reg;
	public Integer getgNo() {
		return gNo;
	}
	public void setgNo(Integer gNo) {
		this.gNo = gNo;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
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
	public Integer getrCont() {
		return rCont;
	}
	public void setrCont(Integer rCont) {
		this.rCont = rCont;
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
}
