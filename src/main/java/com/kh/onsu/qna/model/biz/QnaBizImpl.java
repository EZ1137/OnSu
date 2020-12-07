package com.kh.onsu.qna.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsu.qna.model.dao.QnaDao;
import com.kh.onsu.qna.model.dto.QnaDto;

@Service
public class QnaBizImpl implements QnaBiz {

	@Autowired
	private QnaDao qnaDao;

	@Override
	public List<QnaDto> selectList() {
		return qnaDao.selectList();
	}

	@Override
	public QnaDto selectOne(int qnano) {
		return qnaDao.selectOne(qnano);
	}

	@Override
	public int insert(QnaDto qnaDto) {
		return qnaDao.insert(qnaDto);
	}

	@Override
	public int setsecret(QnaDto qnaDto) {
		return qnaDao.setsecret(qnaDto);
	}

	@Override
	public int update(QnaDto qnaDto) {
		return qnaDao.update(qnaDto);
	}

	@Override
	public int answer(QnaDto qnaDto) {
		return qnaDao.answer(qnaDto);
	}

	@Override
	public int delete(int qnano) {
		return qnaDao.delete(qnano);
	}

}
