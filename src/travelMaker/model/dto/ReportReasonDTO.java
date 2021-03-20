package travelMaker.model.dto;

public class ReportReasonDTO {
	private Integer rNo;
	private Integer rType;
	private String rCont;
	public Integer getrNo() {
		return rNo;
	}
	public void setrNo(Integer rNo) {
		this.rNo = rNo;
	}
	public Integer getrType() {
		return rType;
	}
	public void setrType(Integer rType) {
		this.rType = rType;
	}
	public String getrCont() {
		return rCont;
	}
	public void setrCont(String rCont) {
		this.rCont = rCont;
	}
}
