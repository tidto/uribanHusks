package com.yedam.uriban.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface NoticeFileUploadSerivce {
	public List<Map<String,Object>> uploadFile(MultipartFile[] uploadFiles);
}
