package com.yedam.uriban.album.album.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.uriban.album.album.service.AlbumService;
import com.yedam.uriban.album.album.service.AlbumVO;
import com.yedam.uriban.album.comment.service.AlbumCommentService;
import com.yedam.uriban.album.hashtag.service.HashTagService;
import com.yedam.uriban.album.hashtag.service.HashTagVO;
import com.yedam.uriban.album.image.service.ImageService;
import com.yedam.uriban.album.image.service.ImageVO;
import com.yedam.uriban.album.like.service.LikeService;
import com.yedam.uriban.album.like.service.LikeVO;
import com.yedam.uriban.album.upload.service.UploadService;
import com.yedam.uriban.member.service.MemberVO;
import com.yedam.uriban.myclass.service.MyClassVO;

/*
 * 구현: 장근렬
 * 구현일자: 2023-10-
 * 앨범 CRUD
 * */

@Controller
public class AlbumController {
	@Autowired
	AlbumService albumService;
	@Autowired
	HashTagService hashTagService;
	@Autowired
	ImageService imageService;
	@Autowired
	UploadService uploadService;
	@Autowired
	LikeService likeService;
	@Autowired
	AlbumCommentService albumCommentService;
	
	@GetMapping("album/albumList")
	public String albumList(Model model, 
							@AuthenticationPrincipal MemberVO member,
							@RequestParam(required = true, defaultValue = "list")String albumType,
							@RequestParam(required = false, defaultValue = "list")String albumValue,
							HttpServletRequest request) {
			
		HttpSession session = request.getSession();
		MyClassVO classVO = (MyClassVO)session.getAttribute("myClass");
		session.setMaxInactiveInterval(1800);
		
		List<AlbumVO> albumlist = new ArrayList<AlbumVO>();
				
		List<List<HashTagVO>> taglist = new ArrayList<List<HashTagVO>>();
		List<List<ImageVO>> imglist = new ArrayList<List<ImageVO>>();
		List<LikeVO> likelist = new ArrayList<LikeVO>();
		
		AlbumVO albumVO = new AlbumVO();
		albumVO.setClassId(classVO.getClassId());
		
		String memberId = member.getMemberId();
		
		if(albumType.equals("list")) {
			albumlist = albumService.getAlbumList(albumVO);
		}else if(albumType.equals("like")) {
			albumVO.setMemberId(memberId);
			albumlist = albumService.getAlbumLike(albumVO);
		}else if(albumType.equals("tag")) {
			albumVO.setTag(albumValue);
			albumlist = albumService.getAlbumTag(albumVO);
		}else if(albumType.equals("month")) {
			albumVO.setMonth(Integer.parseInt(albumValue));
			albumlist = albumService.getAlbumMonth(albumVO);
		}
		
		likelist = likeService.getLikeList(memberId);
				
		for(AlbumVO vo : albumlist){
			int albumNo = vo.getAlbumNo();
			List<HashTagVO> tag = hashTagService.getHashTagAlbumList(albumNo);
			taglist.add(tag);
			List<ImageVO> img = imageService.getImageAlbumList(albumNo);
			imglist.add(img);
		}
		
		model.addAttribute("albumList",albumlist);
		model.addAttribute("tagList",taglist);
		model.addAttribute("imgList",imglist);
		model.addAttribute("likeList",likelist);
		
		return "album/albumList";
	}
	
	
	@PostMapping("album/albumMonth")
	@ResponseBody
	public Map<String, Object> albumMonth(@RequestBody int month,
										  HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MyClassVO classVO = (MyClassVO)session.getAttribute("myClass");
		session.setMaxInactiveInterval(1800);
		
		AlbumVO albumVO = new AlbumVO();
		albumVO.setClassId(classVO.getClassId());
		albumVO.setMonth(month);
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<AlbumVO> list = albumService.getAlbumMonth(albumVO);
		
		map.put("result", list);
		
		return map;
	}
	
	@GetMapping("album/albumInsert")
	public String albumInsertForm(Model model) {
		model.addAttribute("albumNo",albumService.getNextAlbumNo());
		return "album/albumInsert";
	}
	
	@PostMapping("album/albumInsert")
	public String albumInsert(AlbumVO albumVO,  Model model) {
		try {
			albumService.insertAlbumInfo(albumVO);
		} catch (Exception e) {
			model.addAttribute("msg","이미지파일 이외의 파일은 입력 할 수 없습니다.");
			model.addAttribute("url","../album/albumList");

			e.printStackTrace();

			return "album/albumAlert";		
		}
		return "redirect:albumList";
	}
	
	@GetMapping("album/albumUpdate")
	public String albumUpdateForm(@RequestParam int albumNo, Model model, HttpServletRequest request) {	
			
		HttpSession session = request.getSession();
		MyClassVO classVO = (MyClassVO)session.getAttribute("myClass");
		session.setMaxInactiveInterval(1800);
		
		AlbumVO albumVO = new AlbumVO();
		albumVO.setClassId(classVO.getClassId());
		albumVO.setAlbumNo(albumNo);
		
		AlbumVO albumInfo = albumService.getAlbumInfo(albumVO);
		List<HashTagVO> tags = hashTagService.getHashTagAlbumList(albumNo);
		List<ImageVO> imgs = imageService.getImageAlbumList(albumNo);
		
		String fullTag = "";
		
		for(HashTagVO tag : tags) {
			fullTag += "#" + tag.getTag();
		}
		
		model.addAttribute("albumInfo",albumInfo);
		model.addAttribute("tags",fullTag);
		model.addAttribute("imgs",imgs);
		
		return "album/albumUpdate";
	}
	
	@PostMapping("album/albumUpdate")
	public String albumUpdate(AlbumVO albumVO, Model model) {
		try {
			albumService.updateAlbumInfo(albumVO);
		} catch (Exception e) {

			model.addAttribute("msg","이미지파일 이외의 파일은 입력 할 수 없습니다.");
			model.addAttribute("url","../album/albumList");

			e.printStackTrace();

			return "album/albumAlert";	
		}
		return "redirect:albumList";
	}
	
	@GetMapping("album/albumDelete")
	public String albumDelete(@RequestParam int albumNo) {
		albumService.deleteAlbumInfo(albumNo);	
		return "redirect:albumList";
	}
	
	@GetMapping("album/albumAddLikeCnt")
	@ResponseBody
	public Map<String,Object> albumAddLikeCnt(@RequestParam int albumNo) {
		Map<String,Object> map = new HashMap<String,Object>();
		int result = albumService.addLikeCnt(albumNo);
		map.put("result", result);
		
		return map;
	}
	
	@GetMapping("album/albumMinusLikeCnt")
	@ResponseBody
	public Map<String,Object> albumMinusLikeCnt(@RequestParam int albumNo) {
		Map<String,Object> map = new HashMap<String,Object>();
		int result = albumService.minusLikeCnt(albumNo);
		map.put("result", result);
		
		return map;
	}
}
