package com.yedam.uriban.album.album.service;

import java.util.List;

public interface AlbumService {

	public List<AlbumVO> getAlbumList(AlbumVO vo);

	public List<AlbumVO> getAlbumLike(AlbumVO vo);

	public List<AlbumVO> getAlbumMonth(AlbumVO vo);

	public List<AlbumVO> getAlbumTag(AlbumVO vo);

	public AlbumVO getAlbumInfo(AlbumVO vo);

	public int insertAlbumInfo(AlbumVO albumVO) throws Exception;

	public int updateAlbumInfo(AlbumVO albumVO) throws Exception;

	public int deleteAlbumInfo(int albumNo);

	public int getNextAlbumNo();
	
	public int addLikeCnt(int albumNo);
	
	public int minusLikeCnt(int albumNo);
}
