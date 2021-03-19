package travelMaker.model.dto;

import java.sql.Timestamp;

public class ChattingDTO {

	private Integer gNo, chatNo;
	private String writer, cont;
	private Timestamp reg;
	
	public Integer getgNo() { return gNo; }
	public void setgNo(Integer gNo) { this.gNo = gNo; }
	
	public Integer getChatNo() { return chatNo; }
	public void setChatNo(Integer chatNo) { this.chatNo = chatNo; }
	
	public String getWriter() { return writer; }
	public void setWriter(String writer) { this.writer = writer; }
	
	public String getCont() { return cont; }
	public void setCont(String cont) { this.cont = cont; }
	
	public Timestamp getReg() { return reg; }
	public void setReg(Timestamp reg) { this.reg = reg; }
	
}
