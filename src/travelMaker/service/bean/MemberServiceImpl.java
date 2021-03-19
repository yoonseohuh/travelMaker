package travelMaker.service.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import travelMaker.model.dao.TmUserDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private TmUserDAO tmuserDAO = null;
}
