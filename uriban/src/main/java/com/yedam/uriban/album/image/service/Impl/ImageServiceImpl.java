package com.yedam.uriban.album.image.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.album.image.mapper.ImageMapper;
import com.yedam.uriban.album.image.service.ImageService;
import com.yedam.uriban.album.image.service.ImageVO;

@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	ImageMapper imageMapper;
	
	@Override
	public List<ImageVO> getImageList() {
		return imageMapper.selectImageList();
	}

	@Override
	public List<ImageVO> getImageAlbumList(int albumNo) {
		return imageMapper.selectImageAlbumList(albumNo);
	}

	@Override
	public ImageVO getImageInfo(ImageVO imageVO) {
		return imageMapper.selectImageInfo(imageVO);
	}

	@Override
	public Map<String,Object> insertImageInfo(List<ImageVO> list) {
		boolean isSuccessed = false;
		int cnt = 0;
		
		for(ImageVO vo : list) {
			int result = imageMapper.insertImage(vo);
			
			if(result == 1) {
				cnt += 1;
			}
		}
		
		if(cnt > 0)
			isSuccessed = true;
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", isSuccessed);
		
		return map;
	}

	@Override
	public int deleteImageInfo(int albumNo) {
		int result = imageMapper.deleteImage(albumNo);
		
		if(result == 1) {
			return albumNo;
		}else {
			return -1;
		}
	}

	@Override
	public List<ImageVO> getImageListWithClass(int classId) {
		return imageMapper.selectImageListWithClass(classId);
	}

}
