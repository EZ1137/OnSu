package com.kh.onsu.study.video.model.dao;

import java.util.List;

import com.kh.onsu.study.video.model.dto.VideoDto;

public interface VideoDao {

	String NAMESPACE = "StudyVideo.";
	
	public List<VideoDto> videoList(int class_no);
	public VideoDto videoOne(int video_no);
	public int insert(VideoDto videoDto);
	public int update(VideoDto videoDto);
	public int delete(int video_no);
}
