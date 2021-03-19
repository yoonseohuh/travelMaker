package travelMaker.service.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.GroupSpaceDAO;
import travelMaker.model.dto.GroupSpaceDTO;

@Service
public class TravelServiceImpl implements TravelService{
	
	@Autowired
	private GroupSpaceDAO groupSpaceDAO = null;

	@Override
	public void insertMaking(GroupSpaceDTO dto) throws Exception {
	
	}
	
	
	
	
	
}
