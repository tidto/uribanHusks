package com.yedam.uriban.album.album.mapper;

import java.util.List;

import com.yedam.uriban.album.album.service.AlbumVO;

public interface AlbumMapper {

	public List<AlbumVO> selectAlbumList(AlbumVO vo);

	public List<AlbumVO> selectAlbumLike(AlbumVO vo);

	public List<AlbumVO> selectAlbumMonth(AlbumVO vo);

	public List<AlbumVO> selectAlbumTag(AlbumVO vo);

	public AlbumVO selectAlbumInfo(AlbumVO vo);

	public int insertAlbum(AlbumVO vo);

	public int updateAlbum(AlbumVO vo);

	public int deleteAlbum(int albumNo);

	public int getNextAlbumNo();
	
	public int addLikeCnt(int albumNo);
	
	public int minusLikeCnt(int albumNo);
}
