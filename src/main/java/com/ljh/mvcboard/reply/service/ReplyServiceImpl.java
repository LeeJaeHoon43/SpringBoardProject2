package com.ljh.mvcboard.reply.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.ljh.mvcboard.commons.paging.Criteria;
import com.ljh.mvcboard.reply.domain.ReplyVO;
import com.ljh.mvcboard.reply.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	private final ReplyDAO replyDAO;

	@Inject
	public ReplyServiceImpl(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public List<ReplyVO> list(Integer articleNo) throws Exception {
		return replyDAO.list(articleNo);
	}

	@Override
	public void create(ReplyVO replyVO) throws Exception {
		replyDAO.create(replyVO);
	}

	@Override
	public void update(ReplyVO replyVO) throws Exception {
		replyDAO.update(replyVO);
	}

	@Override
	public void delete(Integer replyNo) throws Exception {
		replyDAO.delete(replyNo);
	}

	@Override
	public List<ReplyVO> getRepliesPaging(Integer articleNo, Criteria criteria) throws Exception {
		return replyDAO.listPaging(articleNo, criteria);
	}

	@Override
	public int countReplies(Integer articleNo) throws Exception {
		return replyDAO.countReplies(articleNo);
	}
}
