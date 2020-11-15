package com.kh.onsoo.notice.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.notice.model.dao.NoticeDao;
import com.kh.onsoo.notice.model.dto.NoticeDto;

@Service
public class NoticeBizImpl implements NoticeBiz {

	@Autowired
	private NoticeDao noticeDao;
	
	
	@Override
	public List<NoticeDto> selectList() {
		return noticeDao.selectList();
	}

	@Override
	public NoticeDto selectOne(int notice_no) {
		return noticeDao.selectOne(notice_no);
	}

	@Override
	public int insert(NoticeDto dto) {
		return noticeDao.insert(dto);
	}

	@Override
	public int update(NoticeDto dto) {
		return noticeDao.update(dto);
	}

	@Override
	public int delete(int notice_no) {
		return noticeDao.delete(notice_no);
	}
	
	@Override
	public List<NoticeDto> Nsearch(String search){
		return noticeDao.Nsearch(search);
	}

}
