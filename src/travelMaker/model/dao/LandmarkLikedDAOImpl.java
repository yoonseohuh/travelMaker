package travelMaker.model.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class LandmarkLikedDAOImpl implements LandmarkLikedDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;

	@Override
	public void insertLandLiked() throws Exception {
		sqlSession.insert("landmarkLiked");
		
	}
	@Override
	public void myLandLiked(String id) throws SQLException{
		sqlSession.selectList("landmarkLiked", id);
	}
	
	@Override
	public void addLikedCnt() throws SQLException {
		// TODO Auto-generated method stub
		
	}



}
