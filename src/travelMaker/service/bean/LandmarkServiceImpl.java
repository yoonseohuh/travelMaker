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
		landmarkBoardDAO.insertLand(dto);
	}
	
	@Override	
	public List getLands() throws Exception{
		List landList = landmarkBoardDAO.getLands();
		return landList;
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

	// 랜드마크 삭제
	@Override
	public void deleteMyLand(int lNo) throws Exception{
		//landmarkBoard 테이블에서 해당 레코드 하나 삭제 후
		landmarkBoardDAO.deletemyLand(lNo);
		//해당 랜마에 좋아요 눌렀던 레코드도 모두 삭제
		landmarkLikedDAO.deleteLand(lNo);
	}

	@Override
	public void landmarkLiked(String id, int lNo) throws Exception {
		// 좋아요 누를 때 +1 카운트
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
	public List myLandLiked(String id) throws Exception {
		List myLandLiked = landmarkLikedDAO.myLandLiked(id);
		return myLandLiked;
	}

}
