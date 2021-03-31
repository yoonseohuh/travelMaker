package travelMaker.service.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.SharedDAO;

@Service
public class SharedServiceImpl implements SharedService {

	@Autowired
	private SharedDAO sharedDAO = null;
	
	@Override
	public int getshared(int gNo) throws Exception {
		sharedDAO.getshared(gNo);
		return 0;
	}

}
