package com.yedam.uriban.album.upload.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {
	public List<Map<String,Object>> uploadImage(MultipartFile[] uploadImages) throws Exception;
}
