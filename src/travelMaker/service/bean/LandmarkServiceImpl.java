package travelMaker.service.bean;

		
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
	public void insertLand(LandmarkBoardDTO dto) throws Exception {
		// 오토와이어드 해놓은 landmarkBoardDAO를 불러서 고놈이 가지고 있는 insertLand를 한다.
		landmarkBoardDAO.insertLand(dto);
	}
	
	@Override	
	public List getLands() throws Exception{
		List land = landmarkBoardDAO.getLands();
		return land;
	}
	
	@Override
	public List myLand(String id) throws Exception{
		
		List myLand = landmarkBoardDAO.myLand(id);
		return myLand;
	}

	@Override
	public LandmarkBoardDTO getLand(int lNo) throws Exception {
		LandmarkBoardDTO land =  landmarkBoardDAO.getLand(lNo);
		return land;
	}

	@Override
	public void getLandOpen() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void deleteMyLand(String id) throws Exception{
		landmarkBoardDAO.deletemyLand(id);
	}

	@Override
	public void landmarkLiked(String id, int lNo) throws Exception {
		// 좋아요 누를떄 +1 카운트
		landmarkBoardDAO.landmarkLikedCnt(lNo, 1);
		landmarkLikedDAO.landmarkLiked(id, lNo);
		
	}

	@Override
	public int likedCheck(String id, int lNo) throws Exception {
		int count = landmarkLikedDAO.likedCheck(id, lNo);
		return count;
	}
	
	@Override
	public void landmarkLikedCancel(String id, int lNo) throws Exception {
		// 취소할때는 -1 
		landmarkBoardDAO.landmarkLikedCnt(lNo, -1);
		landmarkLikedDAO.landmarkLikedCancel(id, lNo);
		
	}

	@Override
	public List myLandLiked(String id, int lNo) throws Exception {
		List myLandLiked = landmarkLikedDAO.myLandLiked(id, lNo);
		return myLandLiked;
	}

}
