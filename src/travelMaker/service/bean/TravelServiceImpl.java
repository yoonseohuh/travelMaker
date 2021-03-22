package travelMaker.service.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import travelMaker.model.dao.GroupSpaceDAO;
import travelMaker.model.dto.GroupSpaceDTO;

@Service
public class TravelServiceImpl implements TravelService{
	
	@Autowired
	private GroupSpaceDAO groupSpaceDAO = null;

	@Override
	public void insertMaking(GroupSpaceDTO dto) throws Exception {
		if(dto.getDongsung()==null) { dto.setDongsung(0); }
		if(dto.getPo1()==null) { dto.setPo1(-1); }
		if(dto.getPo2()==null) { dto.setPo2(-1); }
		if(dto.getPo3()==null) { dto.setPo3(-1); }
		dto.setActualNum(0);
		dto.setStatus(0);
		dto.setLikedCnt(0);
		dto.setReadCnt(0);
		dto.setShared(0);
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		if(id!=null) {			
			dto.setId(id);
		}else {
			dto.setId("imsiId");
		}
		groupSpaceDAO.insertMaking(dto);
	}
	
	
	
	
	
}
