package com.yedam.uriban.notice.service.impl;

import java.io.File;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.uriban.notice.service.NoticeFileUploadSerivce;

import lombok.extern.slf4j.Slf4j;

/*
 * 구현: 서민호
 * 구현일자: 2023-10-
 * 
 * */

@Slf4j
@Service
public class NoticeFileUploadServiceImpl implements NoticeFileUploadSerivce{
	
	@Value("#{prop['file.noticefile.upload.path']}")
	private String uploadPath;
	
	@GetMapping
	public void getUploadForm() {
		log.info(uploadPath);
	}
	
	@Override
	public List<Map<String, Object>> uploadFile(MultipartFile[] uploadFiles) {
		List<Map<String, Object>> fileList = new ArrayList<>();
		
		for(MultipartFile uploadFile : uploadFiles) {
			
			if(uploadFile == null || uploadFile.getSize() == 0) {
				continue;

			}	

			
			Map<String, Object> map = new HashMap<String, Object>();
		
		
			String originalName = uploadFile.getOriginalFilename();
			String fileName = originalName.substring(originalName.lastIndexOf("//") + 1);
			
	        System.out.println("fileName : " + fileName);
	
			String folderPath = makeFolder();
			
			String uuid = UUID.randomUUID().toString();
			
	        String uploadFileName = folderPath +File.separator + uuid + "_" + fileName;
			
			String saveName = uploadPath + File.separator + uploadFileName;
			
			map.put("origin", originalName);
			map.put("save", setFilePath(uploadFileName));
			
			Path savePath = Paths.get(saveName);
		
			System.out.println("path : " + saveName);
	        try{
	        	uploadFile.transferTo(savePath);

	        } catch (IOException e) {
	             e.printStackTrace();	             
	        }

	        fileList.add(map);
		}
		return fileList;
	}
	
	private String makeFolder() {
		String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));

		String folderPath = str.replace("/", File.separator);
		File uploadPathFoler = new File(uploadPath, folderPath);

		if (uploadPathFoler.exists() == false) {
			uploadPathFoler.mkdirs();
		}
		return folderPath;
	}
	
	private String setFilePath(String uploadFileName) {
		return uploadFileName.replace(File.separator, "/");
	}
	
}
