package com.kh.onsoo.study.video.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.study.video.model.dao.VideoDao;
import com.kh.onsoo.study.video.model.dto.VideoDto;

@Service
public class VideoBizImpl implements VideoBiz {

	@Autowired
	private VideoDao videoDao;
	
	@Override
	public List<VideoDto> videoList(int class_no) {
		return videoDao.videoList(class_no);
	}

	@Override
	public VideoDto videoOne(int video_no) {
		return videoDao.videoOne(video_no);
	}

	@Override
	public int insert(VideoDto videoDto) {
		return videoDao.insert(videoDto);
	}

	@Override
	public int update(VideoDto videoDto) {
		return videoDao.update(videoDto);
	}

	@Override
	public int delete(int video_no) {
		return videoDao.delete(video_no);
	}

}
