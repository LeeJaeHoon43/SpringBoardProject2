package com.ljh.mvcboard.article;

import java.util.List;
import javax.inject.Inject;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.ljh.mvcboard.commons.paging.Criteria;
import com.ljh.mvcboard.reply.domain.ReplyVO;
import com.ljh.mvcboard.reply.persistence.ReplyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml"})
public class ReplyDAOTest {
	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOTest.class);
	
	@Inject
	private ReplyDAO replyDAO;
	
	@Test @Ignore
	public void testReplyCreate() throws Exception{
		for (int i = 1; i <= 100; i++) {
			ReplyVO replyVO = new ReplyVO();
			replyVO.setArticleNo(1000);
			replyVO.setReplyText(i + "번째 댓글입니다.");
			replyVO.setReplyWriter("user0" + (i % 10));
			replyDAO.create(replyVO);
		}
	}
	
	@Test @Ignore
	public void testReplyList() throws Exception{
		logger.info(replyDAO.list(1000).toString());
	}
	
	@Test @Ignore
	public void testReplyUpdate() throws Exception{
		ReplyVO replyVO = new ReplyVO();
		replyVO.setArticleNo(2);
		replyVO.setReplyText(2 + "번째 댓글 수정");
		replyDAO.update(replyVO);
	}
	
	@Test @Ignore
	public void testReplyDelete() throws Exception{
		replyDAO.delete(3);
	}
	
	@Test
	public void testReplyPaging() throws Exception{
		Criteria criteria = new Criteria();
		criteria.setPerPageNum(20);
		criteria.setPage(1);
		List<ReplyVO> replies = replyDAO.listPaging(1000, criteria);
		for (ReplyVO reply : replies) {
			logger.info(reply.getReplyNo() + " : " + reply.getReplyText());
		}
	}
}
