package com.kh.onsoo.study.video.model.dao;

import java.util.List;

import com.kh.onsoo.study.video.model.dto.VideoDto;

public interface VideoDao {

	String NAMESPACE = "com.kh.onsoo.study.video.";
	
	public List<VideoDto> videoList(int class_no);
	public VideoDto videoOne(int video_no);
	public int insert(VideoDto videoDto);
	public int update(VideoDto videoDto);
	public int delete(int video_no);
}
