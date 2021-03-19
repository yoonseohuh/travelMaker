package travelMaker.model.dto;

import java.sql.Timestamp;

public class GalleryDTO {

	private Integer gNo, pNo;
	private String writer, pRoot;
	private Integer likedCnt;
	private Timestamp reg;
	
	public Integer getgNo() { return gNo; }
	public void setgNo(Integer gNo) { this.gNo = gNo; }
	
	public Integer getpNo() { return pNo; }
	public void setpNo(Integer pNo) { this.pNo = pNo; }
	
	public String getWriter() { return writer; }
	public void setWriter(String writer) { this.writer = writer; }
	
	public String getpRoot() { return pRoot; }
	public void setpRoot(String pRoot) { this.pRoot = pRoot; }
	
	public Integer getLikedCnt() { return likedCnt; }
	public void setLikedCnt(Integer likedCnt) { this.likedCnt = likedCnt; }
	
	public Timestamp getReg() { return reg; }
	public void setReg(Timestamp reg) { this.reg = reg; }
	
}
