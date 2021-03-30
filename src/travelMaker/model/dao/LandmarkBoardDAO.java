package travelMaker.model.dao;

import java.sql.SQLException;
import java.util.List;

import travelMaker.model.dto.LandmarkBoardDTO;

public interface LandmarkBoardDAO {

	// 랜드마크 생성 setlikedCnt 0 으로 맞추고 
	public void insertLand(LandmarkBoardDTO dto) throws SQLException; 
	// 랜드마크들 가져오기
	public List getLands() throws SQLException;
	// 랜드마크 공개범위 전체공개 0, 회원공개 1
	public void getLandOpen(int lOpen) throws SQLException;
	// 내가 작성한 랜드마크
	public List myLand(String id) throws SQLException;
	// 랜드마크 가져오기
	public LandmarkBoardDTO getLand(int lNo) throws SQLException;
	// 내가 작성한 랜드마크 삭제
	public void deletemyLand(String id) throws SQLException;


}
