package travelMaker.model.dao;

import java.util.List;

import travelMaker.model.dto.GalleryDTO;

public interface GalleryDAO {
	//갤러리 이미지 업로드
	public void uploadImage(GalleryDTO dto) throws Exception;
	//그룹 갤러리 이미지들 가져오기
	public List getGroupImgs(int gNo) throws Exception;
	//사진 좋아요 수 1 증감
	public void updateLikedCnt(int pNo, int yn) throws Exception;
}
