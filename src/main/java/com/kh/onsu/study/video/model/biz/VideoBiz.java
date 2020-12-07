package com.kh.onsu.study.video.model.biz;

import java.util.List;

import com.kh.onsu.study.video.model.dto.VideoDto;

public interface VideoBiz {

	public List<VideoDto> videoList(int class_no);
	public VideoDto videoOne(int video_no);
	public int insert(VideoDto videoDto);
	public int update(VideoDto videoDto);
	public int delete(int video_no);
}
