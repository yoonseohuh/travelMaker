package travelMaker.service.bean;

import java.sql.SQLException;
import java.util.List;

import travelMaker.model.dto.LandmarkBoardDTO;


public interface LandmarkService {
	
	// 랜드마크 생성 setlikedCnt 0 으로 맞추고 
	public void insertLand(LandmarkBoardDTO dto) throws SQLException;
	// 랜드마크 가져오기  (고유번호, 작성자, 장소명, 유형, 주소, 소개, 공개범위, x,y값을 받아야 할텐데) 
	public List getLand() throws SQLException;
	// 랜드마크 좋아요 수 올려주기
	public void addLikedCnt(int lNo, String id) throws SQLException;
	// 랜드마크 공개범위 전체공개 0, 회원공개 1
	public void getLandOpen(int lOpen) throws SQLException;
	// 내가 작성한 랜드마크
	public void myLand(int lNo, String id) throws SQLException;
	// 내가 좋아요 한 랜드마크
	public void myLandLiked(int lNo, String id) throws SQLException;
	
	
	
}
