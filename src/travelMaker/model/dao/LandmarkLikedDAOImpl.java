package travelMaker.model.dao;

import java.sql.SQLException;	
import org.springframework.stereotype.Repository;
import travelMaker.model.dto.LandmarkBoardDTO;

@Repository
public class LandmarkLikedDAOImpl implements LandmarkLikedDAO {

	@Override
	public LandmarkBoardDTO getLand(int lNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertLandLiked(int lNo, String id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addLikedCnt(int lNo, String id) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
