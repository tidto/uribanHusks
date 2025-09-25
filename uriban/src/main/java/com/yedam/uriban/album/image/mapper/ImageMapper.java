package com.yedam.uriban.album.image.mapper;

import java.util.List;

import com.yedam.uriban.album.image.service.ImageVO;

public interface ImageMapper {

	//전체조회
	public List<ImageVO> selectImageList();
	
	public List<ImageVO> selectImageListWithClass(int classId);
	
	//앨범별 조회
	public List<ImageVO> selectImageAlbumList(int albumNo);
	
	//단건조회
	public ImageVO selectImageInfo(ImageVO vo);
	
	//등록
	public int insertImage(ImageVO vo);
	
	//수정
	
	//삭제
	public int deleteImage(int albumNo);
}
