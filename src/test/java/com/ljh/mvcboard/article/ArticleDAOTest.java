package com.ljh.mvcboard.article;

import javax.inject.Inject;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.ljh.mvcboard.article.domain.ArticleVO;
import com.ljh.mvcboard.article.persistance.ArticleDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml"})
public class ArticleDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(ArticleDAOTest.class);
	
	@Inject
	private ArticleDAO articleDAO;
	
	@Test @Ignore
	public void testCreate() throws Exception{
		ArticleVO article = new ArticleVO();
		article.setTitle("새로운 글 작성 테스트 제목");
		article.setContent("새로운 글 작성 테스트 내용");
		article.setWriter("새로운 글 작성자");
		articleDAO.create(article);
	}
	
	@Test @Ignore
	public void testRead() throws Exception{
		logger.info(articleDAO.read(1).toString());
	}
	
	@Test @Ignore
	public void testUpdate() throws Exception{
		ArticleVO article = new ArticleVO();
		article.setArticleNo(1);
		article.setTitle("글 수정 테스트 제목");
		article.setContent("글 수정 테스트 내용");
		articleDAO.update(article);
	}
	
	@Test
	public void testDelete() throws Exception{
		articleDAO.delete(1);
	}
}
