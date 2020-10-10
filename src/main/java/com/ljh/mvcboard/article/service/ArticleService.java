package com.ljh.mvcboard.article.service;

import java.util.List;
import com.ljh.mvcboard.article.domain.ArticleVO;
import com.ljh.mvcboard.commons.paging.Criteria;
import com.ljh.mvcboard.commons.paging.SearchCriteria;

public interface ArticleService {
	public void create(ArticleVO articleVO) throws Exception;
	public ArticleVO read(Integer articleNo) throws Exception;
	public void update(ArticleVO articleVO) throws Exception;
	public void delete(Integer articleNo) throws Exception;
	public List<ArticleVO> listAll() throws Exception;
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
	public int countArticles(Criteria criteria) throws Exception; // 전체 게시글 갯수 구하기.
	public List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception; // 검색된 목록.
	public int countSearchedArticles(SearchCriteria searchCriteria) throws Exception; // 검색된 게시글의 갯수.
}
