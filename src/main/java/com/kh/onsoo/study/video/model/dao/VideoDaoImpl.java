package com.kh.onsoo.study.video.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.study.video.model.dto.VideoDto;

@Repository
public class VideoDaoImpl implements VideoDao {

	private Logger logger = LoggerFactory.getLogger(VideoDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<VideoDto> videoList(int class_no) {
		
		List<VideoDto> list = new ArrayList<VideoDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", class_no);
		} catch (Exception e) {
			logger.info("[ERROR video selectList]");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public VideoDto videoOne(int video_no) {
		
		VideoDto videoDto = null;
		
		try {
			videoDto = sqlSession.selectOne(NAMESPACE + "selectOne", video_no);
		} catch (Exception e) {
			logger.info("[ERROR video selectOne]");
			e.printStackTrace();
		}
		return videoDto;
	}

	@Override
	public int insert(VideoDto videoDto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", videoDto);
		} catch (Exception e) {
			logger.info("[ERROR video insert]");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(VideoDto videoDto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "update", videoDto);
		} catch (Exception e) {
			logger.info("[ERROR video update]");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int video_no) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "delete", video_no);
		} catch (Exception e) {
			logger.info("[ERROR video delete]");
			e.printStackTrace();
		}
		
		return res;
	}

}
