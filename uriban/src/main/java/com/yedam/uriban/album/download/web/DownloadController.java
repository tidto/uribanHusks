package com.yedam.uriban.album.download.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.album.image.service.ImageService;
import com.yedam.uriban.album.image.service.ImageVO;

/*
 * 구현: 장근렬
 * 구현일자: 2023-10-
 * 이미지 다운로드 기능
 * */

@Controller
public class DownloadController {
	
	@Value("#{prop['file.album.upload.path']}")
	private String downloadPath;
	
	@Autowired
	ImageService imageService;
	
	@GetMapping("/download")
	@ResponseBody
	public void download(HttpServletResponse response, int imgNo) throws UnsupportedEncodingException {

		ImageVO vo = new ImageVO();
		vo.setImgNo(imgNo);
		ImageVO img = imageService.getImageInfo(vo);	

		
		String fileName = img.getOriginalFilename();
		String saveFileName = downloadPath+"/"+img.getRenameFilename(); 
		String contentType = "image/png";
		File file = new File(saveFileName);
		long fileLength = file.length();
		fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");

		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Length", "" + fileLength);
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		try (FileInputStream fis = new FileInputStream(saveFileName); OutputStream out = response.getOutputStream();) {
			int readCount = 0;
			byte[] buffer = new byte[1024];
			while ((readCount = fis.read(buffer)) != -1) {
				out.write(buffer, 0, readCount);
			}
		} catch (Exception ex) {
			throw new RuntimeException("file Save Error");
		}
	}
	
}
