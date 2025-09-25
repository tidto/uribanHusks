package com.yedam.uriban.album.comment.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.album.comment.service.AlbumCommentService;
import com.yedam.uriban.album.comment.service.AlbumCommentVO;
import com.yedam.uriban.member.service.MemberVO;

/*
 * 구현: 장근렬
 * 구현일자: 2023-10-
 * 
 * */

@Controller
public class CommentController {

	@Autowired
	AlbumCommentService albumCommentService;
	
	@PostMapping("cmt/cmtList")
	@ResponseBody
	public List<AlbumCommentVO> cmtList(@RequestParam(required = true)int albumNo,
										@RequestParam(required = false, defaultValue = "0")int cmtParent){
		
		List<AlbumCommentVO> list = null;
		
		//부모댓글이 없으면 일반 댓글, 있으면 상세댓글 가져옴
		if(cmtParent == 0) {
			list = albumCommentService.getCommentAlbumList(albumNo);
		}else {
			AlbumCommentVO vo = new AlbumCommentVO();
			vo.setAlbumNo(albumNo);
			vo.setParentReplyNo(cmtParent);
			list = albumCommentService.getCommentDetailList(vo);
		}
		return list;
	}
	
	
	@PostMapping("cmt/cmtInsert")
	@ResponseBody
	public Map<String,Object> CmtInsert(@RequestBody AlbumCommentVO cmtVO){
		Map<String,Object> map = new HashMap<String,Object>();
		int result = albumCommentService.insertComment(cmtVO);
		AlbumCommentVO cmt = albumCommentService.getCommentInfo(result);
		map.put("result", cmt);
		
		return map;
	}
	
	@PostMapping("cmt/cmtUpdate")
	@ResponseBody Map<String,Object> cmtUpdate(@RequestBody AlbumCommentVO cmtVO){
		Map<String,Object> map = new HashMap<String,Object>();
		int result = albumCommentService.updateComment(cmtVO);
		AlbumCommentVO cmt = albumCommentService.getCommentInfo(result);
		map.put("result", cmt);
		
		return map;
	}
	
	@GetMapping("cmt/cmtDelete")
	@ResponseBody
	public Map<String,Object> CmtDelete(@RequestParam int replyNo, @AuthenticationPrincipal MemberVO member) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		List<AlbumCommentVO> detailList = null;
		
		AlbumCommentVO vo = new AlbumCommentVO();
		vo.setParentReplyNo(replyNo);
		vo.setAlbumNo(0);
		
		detailList = albumCommentService.getCommentDetailList(vo);
		
		AlbumCommentVO rcmtVO = albumCommentService.getCommentInfo(replyNo);
		
		if(detailList.size() > 0) {
			if(rcmtVO.getReplyState() != "B203") {
				AlbumCommentVO state = new AlbumCommentVO();
				state.setReplyState("B202");
				state.setReplyNo(replyNo);
				albumCommentService.updateComment(state);
				AlbumCommentVO cmtVO = albumCommentService.getCommentInfo(replyNo);
				map.put("type", "update");
				map.put("content", cmtVO.getContent());
			}
		}else {
			albumCommentService.deleteComment(replyNo);
			map.put("type", "delete");
		}	
	
		return map;
	}
}
