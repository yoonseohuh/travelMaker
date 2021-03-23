package travelMaker.model.dao;

public interface GroupMemberDAO {

	//해당 그룹 구성원의 상태 여부 (구성원 아니면 -1)
	public int getMemStatus(int gNo, String id) throws Exception;
	
	
}
