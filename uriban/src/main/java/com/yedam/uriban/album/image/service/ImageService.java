package com.yedam.uriban.album.image.service;

import java.util.List;
import java.util.Map;

public interface ImageService {

	public List<ImageVO> getImageList();
	
	public List<ImageVO> getImageListWithClass(int classId);

	public List<ImageVO> getImageAlbumList(int albumNo);

	public ImageVO getImageInfo(ImageVO imageVO);

	public Map<String,Object> insertImageInfo(List<ImageVO> list);

	public int deleteImageInfo(int albumNo);
	
}
