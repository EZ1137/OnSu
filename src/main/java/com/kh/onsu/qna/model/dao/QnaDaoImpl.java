package com.kh.onsu.qna.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsu.qna.model.dto.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao {

	private Logger logger = LoggerFactory.getLogger(QnaDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QnaDto> selectList() {
		List<QnaDto> list = new ArrayList<QnaDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
			
		} catch (Exception e) {
			logger.info("[ERROR] SelectList in QNA");
			e.printStackTrace();
			
		} 
		return list;
	}

	@Override
	public QnaDto selectOne(int qnano) {
		QnaDto qnaOne = null;
		
		try {
			qnaOne = sqlSession.selectOne(NAMESPACE + "selectOne", qnano);
			
		} catch (Exception e) {
			logger.info("[ERROR] SelectOne in QNA");
			e.printStackTrace();
			
		}
		return qnaOne;
	}

	@Override
	public int insert(QnaDto qnaDto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", qnaDto);
			
		} catch (Exception e) {
			logger.info("[ERROR] Insert in QNA");
			e.printStackTrace();
			
		}
		return res;
	}

	@Override
	public int setsecret(QnaDto qnaDto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "setsecret", qnaDto);
			
		} catch (Exception e) {
			logger.info("[ERROR] Set Secret in QNA");
			e.printStackTrace();
			
		}
		return res;
	}

	@Override
	public int update(QnaDto qnaDto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", qnaDto);
			
		} catch (Exception e) {
			logger.info("[ERROR] Update in QNA");
			e.printStackTrace();
			
		}
		return res;
	}

	@Override
	public int answer(QnaDto qnaDto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "answer", qnaDto);
			
		} catch (Exception e) {
			logger.info("[ERROR] Answer in QNA");
			e.printStackTrace();
			
		}
		return res;
	}

	@Override
	public int delete(int qnano) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", qnano);
			
			if (res > 0) {
				sqlSession.commit();
			}
		} catch (Exception e) {
			logger.info("[ERROR] Delete in QNA");
			e.printStackTrace();
			
		}
		return res;
	}

}
