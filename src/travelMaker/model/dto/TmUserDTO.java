package travelMaker.model.dto;

import java.sql.Timestamp;

public class TmUserDTO {
	
	private String id; 
	private String pw; 
	private String name; 
	private String nickname; 
	private String birth; 
	private String email; 
	private Integer gender;
	private Integer rk;
	private Integer position1;
	private Integer position2;
	private Integer travelCnt;
	private Integer posModi;
	private Integer status;
	private Timestamp reg;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Integer getRk() {
		return rk;
	}
	public void setRk(Integer rk) {
		this.rk = rk;
	}
	public Integer getPosition1() {
		return position1;
	}
	public void setPosition1(Integer position1) {
		this.position1 = position1;
	}
	public Integer getPosition2() {
		return position2;
	}
	public void setPosition2(Integer position2) {
		this.position2 = position2;
	}
	public Integer getTravelCnt() {
		return travelCnt;
	}
	public void setTravelCnt(Integer travelCnt) {
		this.travelCnt = travelCnt;
	}
	public Integer getPosModi() {
		return posModi;
	}
	public void setPosModi(Integer posModi) {
		this.posModi = posModi;
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
