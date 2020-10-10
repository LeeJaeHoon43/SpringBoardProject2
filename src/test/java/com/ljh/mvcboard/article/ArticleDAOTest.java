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
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.ljh.mvcboard.article.domain.ArticleVO;
import com.ljh.mvcboard.article.persistence.ArticleDAO;
import com.ljh.mvcboard.commons.paging.Criteria;
import com.ljh.mvcboard.commons.paging.SearchCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml"})
public class ArticleDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(ArticleDAOTest.class);
	
	@Inject
	private ArticleDAO articleDAO;
	
	@Test @Ignore
	public void testCreate() throws Exception{
		for (int i = 1; i <= 1000 ; i++) {
			ArticleVO article = new ArticleVO();
			article.setTitle(i + "번째 글 제목입니다.");
			article.setContent(i + "번째 글 내용입니다.");
			article.setWriter("user0" + (i % 10));
			articleDAO.create(article);
		}
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
	
	@Test @Ignore
	public void testDelete() throws Exception{
		articleDAO.delete(1);
	}
	
	@Test @Ignore
	public void testListPaging() throws Exception{
		int page = 3;
		List<ArticleVO> articles = articleDAO.listPaging(page);
		
		for (ArticleVO article : articles) {
			logger.info(article.getArticleNo() + " : " + article.getTitle());
		}
	}
	
	@Test @Ignore
	public void testListCriteria() throws Exception{
		Criteria criteria = new Criteria();
		criteria.setPage(3);
		criteria.setPerPageNum(20);
		List<ArticleVO> articles = articleDAO.listCriteria(criteria);
		for (ArticleVO article : articles) {
			logger.info(article.getArticleNo() + " : " + article.getTitle());
		}
	}
	
	@Test @Ignore
	public void testURI() throws Exception{
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/article/read")
				.queryParam("articleNo", 12)
				.queryParam("perPageNum", 20)
				.build();
		logger.info("/article/read?articleNo=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}
	
	@Test @Ignore
	public void testURI2() throws Exception{
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/{module}/{page}")
				.queryParam("articleNo", 12)
				.queryParam("perPageNum", 20)
				.build()
				.expand("article","read")
				.encode();
		logger.info("/article/read?articleNo=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}
	
	@Test
	public void testDynamic1() throws Exception{
		SearchCriteria searchCriteria = new SearchCriteria();
		searchCriteria.setPage(1);
		searchCriteria.setKeyword("999");
		searchCriteria.setSearchType("t");
		logger.info("======================");
		List<ArticleVO> articles = articleDAO.listSearch(searchCriteria);
		for (ArticleVO article : articles) {
			logger.info(article.getArticleNo() + " : " + article.getTitle());
		}
		logger.info("======================");
		logger.info("검색된 게시물 수 : " + articleDAO.countSearchedArticles(searchCriteria));
	}
}
