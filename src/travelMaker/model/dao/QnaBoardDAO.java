package travelMaker.model.dao;

import java.sql.SQLException;

import travelMaker.model.dto.QnaBoardDTO;

public interface QnaBoardDAO {
	public void insertQna(QnaBoardDTO dto) throws SQLException;
}
