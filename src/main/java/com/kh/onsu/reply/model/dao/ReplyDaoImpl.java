package com.kh.onsu.reply.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.kh.onsu.reply.model.dto.ReplyDto;


@Repository
public class ReplyDaoImpl implements ReplyDao {
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    private Logger logger = LoggerFactory.getLogger(ReplyDaoImpl.class);

    @Override
    public List<ReplyDto> replyList(int reply_boardno) {
        List<ReplyDto> list = new ArrayList<ReplyDto>();
        try {
            list = sqlSession.selectList(NAMESPACE + "replyList", reply_boardno );

            
        } catch (DataAccessException e) {
            logger.info("[ERROR] reply select list");
            e.printStackTrace();
        }
        return list;
        
    }

    @Override
    public int replyInsert(ReplyDto replydto) {
        int res = 0;
        try {
            res = sqlSession.insert(NAMESPACE + "replyInsert", replydto);
        } catch (DataAccessException e) {
            logger.info("[ERROR] replyInsert");
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public int replyUpdate(ReplyDto replydto) {
        int res = 0;
        try {
            res = sqlSession.update(NAMESPACE + "replyUpdate", replydto);
        } catch (DataAccessException e) {
            logger.info("[ERROR] replyUpdate - " + replydto.getReply_boardno());
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public int replyDelete(int reply_no) {
        int res = 0;
        try {
            res = sqlSession.delete(NAMESPACE + "replyDelete", reply_no);
        } catch (DataAccessException e) {
            logger.info("[ERROR]  replyDelete - " + reply_no);
            e.printStackTrace();
        }
        return res;
    }


}