package com.yedam.uriban.notice.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.uriban.notice.service.NoticeFileService;
import com.yedam.uriban.notice.service.NoticeFileVO;

/*
 * 구현: 서민호
 * 구현일자: 2023-10-
 * 
 * */

@Controller
public class NoticeDownloadController {
	
	@Value("#{prop['file.noticefile.upload.path']}")
	private String downloadPath;
	
	@Autowired
	NoticeFileService noticeFileService;
	
	@GetMapping("/filedownload")
	public void download(HttpServletResponse response, int fileNo) throws UnsupportedEncodingException{
		
		NoticeFileVO vo = new NoticeFileVO();
		vo.setFileNo(fileNo);
		NoticeFileVO file = noticeFileService.getNoticeFileInfo(vo);
		
		// 직접 파일 정보를 변수에 저장해 놨지만, 이 부분이 db에서 읽어왔다고 가정한다
		String fileName = file.getOriginalfileName();
		String saveFileName = downloadPath + "/" + file.getSavefileName();
		String contentType = "application/octet-stream"; // 문서구별없이 포괄적으로 받아주는 타입
		File route = new File(saveFileName);
		long routLength =route.length();
    	fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1"); // 자바 다운로드 인코딩으로 한글문서 인식
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Length", "" + routLength);
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
