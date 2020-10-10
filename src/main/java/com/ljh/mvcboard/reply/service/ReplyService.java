package com.ljh.mvcboard.reply.service;

import java.util.List;

import com.ljh.mvcboard.commons.paging.Criteria;
import com.ljh.mvcboard.reply.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> list(Integer articleNo) throws Exception;
    public void create(ReplyVO replyVO) throws Exception;
    public void update(ReplyVO replyVO) throws Exception;
    public void delete(Integer replyNo) throws Exception;
    public List<ReplyVO> getRepliesPaging(Integer articleNo, Criteria criteria) throws Exception;
    public int countReplies(Integer articleNo) throws Exception;
}
