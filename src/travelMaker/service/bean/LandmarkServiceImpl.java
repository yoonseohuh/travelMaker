package travelMaker.service.bean;

import java.sql.SQLException;	
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import travelMaker.model.dao.LandmarkBoardDAO;
import travelMaker.model.dao.LandmarkLikedDAO;
import travelMaker.model.dto.LandmarkBoardDTO;

@Service
public class LandmarkServiceImpl implements LandmarkService{
	
	
	@Autowired
	private LandmarkBoardDAO landmarkBoardDAO = null;
	
	@Autowired
	private LandmarkLikedDAO landmarkLikedDAO = null;

	
	@Override
	public void insertLand(LandmarkBoardDTO dto) throws SQLException {
		// 오토와이어드 해놓은 landmarkBoardDAO를 불러서 고놈이 가지고 있는 insertLand를 한다.
		landmarkBoardDAO.insertLand(dto);
	}
	
	@Override	
	public List getLands() throws SQLException{
		List land = landmarkBoardDAO.getLands();
		return land;
	}

	@Override
	public void addLikedCnt(String id) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List myLand(String id) throws SQLException{
		
		List myLand = landmarkBoardDAO.myLand(id);
		return myLand;
	}
	
	@Override
	public void myLandLiked(String id) throws SQLException{
		
	}

	@Override
	public LandmarkBoardDTO getLand(int lNo) throws SQLException {
		LandmarkBoardDTO land =  landmarkBoardDAO.getLand(lNo);
		return land;
	}

	@Override
	public void getLandOpen() throws SQLException {
		// TODO Auto-generated method stub
		
	}

	


	
}
