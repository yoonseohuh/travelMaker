package travelMaker.model.dto;

import java.sql.Timestamp;

public class LandmarkBoardDTO {

	private Integer lNo;
	private String writer;
	private String lName;
	private String lType;
	private String addr;
	private String xLoc;
	private String yLoc;
	private String lCont;
	private Integer lOpen;
	private Integer likedCnt;
	private Timestamp reg;
	public Integer getlNo() {
		return lNo;
	}
	public void setlNo(Integer lNo) {
		this.lNo = lNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getlType() {
		return lType;
	}
	public void setlType(String lType) {
		this.lType = lType;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getxLoc() {
		return xLoc;
	}
	public void setxLoc(String xLoc) {
		this.xLoc = xLoc;
	}
	public String getyLoc() {
		return yLoc;
	}
	public void setyLoc(String yLoc) {
		this.yLoc = yLoc;
	}
	public String getlCont() {
		return lCont;
	}
	public void setlCont(String lCont) {
		this.lCont = lCont;
	}
	public Integer getlOpen() {
		return lOpen;
	}
	public void setlOpen(Integer lOpen) {
		this.lOpen = lOpen;
	}
	public Integer getLikedCnt() {
		return likedCnt;
	}
	public void setLikedCnt(Integer likedCnt) {
		this.likedCnt = likedCnt;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
		
}
