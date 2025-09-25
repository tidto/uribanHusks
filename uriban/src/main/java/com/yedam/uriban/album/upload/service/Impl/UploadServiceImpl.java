package com.yedam.uriban.album.upload.service.Impl;

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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.uriban.album.upload.service.UploadService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UploadServiceImpl implements UploadService {
	@Value("#{prop['file.album.upload.path']}")
	
	private String uploadPath;
	
	@GetMapping("uploadForm")
	public void getUploadForm() {
		log.info(uploadPath);
	}
		
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Map<String, Object>> uploadImage(MultipartFile[] uploadImages) throws Exception {
		List<Map<String,Object>> imageList = new ArrayList<>();
		
	    for(MultipartFile uploadFile : uploadImages){
	    	if(uploadFile == null || uploadFile.getSize() == 0) {
	    		continue;
	    	}
	    	Map<String,Object> map = new HashMap<String,Object>();
	    	
	    	if(uploadFile.getContentType().startsWith("image") == false){
	    		System.err.println("this file is not image type");
	    		return null;
	        }
	  
	        String originalName = uploadFile.getOriginalFilename();
	        String fileName = originalName.substring(originalName.lastIndexOf("//")+1);
	        
	        System.out.println("fileName : " + fileName);

	        String folderPath = makeFolder();

	        String uuid = UUID.randomUUID().toString();
	        
	        String uploadFileName = folderPath +File.separator + uuid + "_" + fileName;

	        String saveName = uploadPath + File.separator + uploadFileName;
	        
	        map.put("origin", originalName);
	        map.put("rename", setImagePath(uploadFileName));
	        
	        Path savePath = Paths.get(saveName);

	        System.out.println("path : " + saveName);
	        try{
	        	uploadFile.transferTo(savePath);

	        } catch (IOException e) {
	             e.printStackTrace();	             
	        }

	        imageList.add(map);
	     }
	    
	    return imageList;
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
	
	private String setImagePath(String uploadFileName) {
		return uploadFileName.replace(File.separator, "/");
	}
	
}
