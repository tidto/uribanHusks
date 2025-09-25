package com.yedam.uriban.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service
public class CommonFileUpload {
// static  배열 메소드 추가[] 따로 부를 건 path경로만
	 public Map<String, String> saveFile(MultipartFile uploadFile, String uploadPath) {
	        Map<String, String> fileResult = new HashMap<>();

	        if (uploadFile != null && uploadFile.getSize() > 0) {
	            String originalName = uploadFile.getOriginalFilename();
	            String fileName = originalName.substring(originalName.lastIndexOf("//") + 1);
	            String folderPath = makeFolder(uploadPath);
	            String uuid = UUID.randomUUID().toString();
	            String uploadFileName = folderPath + File.separator + uuid + "_" + fileName;
	            String saveName = uploadPath + File.separator + uploadFileName;
	            Path savePath = Paths.get(saveName);

	            try {
	                uploadFile.transferTo(savePath);
	                fileResult.put("OriginalfileName", originalName);
	                fileResult.put("SavefileName", setFilePath(uploadFileName));
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	        return fileResult;
	    }

	    // 업로드 폴더 생성 폴더 경로 리턴
	    private static String makeFolder(String uploadPath) {
	        String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
	        String folderPath = str.replace("/", File.separator);
	        File uploadPathFolder = new File(uploadPath, folderPath);
	        if (!uploadPathFolder.exists()) {
	            uploadPathFolder.mkdirs();
	        }
	        return folderPath;
	    }

	    // 파일 경로 구분(/)
	    private static String setFilePath(String uploadFileName) {
	        return uploadFileName.replace(File.separator, "/");
	    }
}
