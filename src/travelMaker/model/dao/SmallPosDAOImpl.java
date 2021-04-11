package travelMaker.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import travelMaker.model.dto.SmallPosDTO;

@Repository
public class SmallPosDAOImpl implements SmallPosDAO {

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	//포지션 정보 가져오기
	@Override
	public SmallPosDTO getPosInfo(int posNo) throws Exception {
		SmallPosDTO dto = sqlSession.selectOne("smallPos.getPosInfo",posNo);
		return dto;
	}
	
	//모든 포지션 정보 가져오기
	@Override
	public List<SmallPosDTO> getPositions() throws Exception {
		List list = sqlSession.selectList("smallPos.getPositions");
		return list;
	}
	
	
	
}
