package com.ljh.mvcboard.article.persistence;

import java.util.List;
import com.ljh.mvcboard.article.domain.ArticleVO;
import com.ljh.mvcboard.commons.paging.Criteria;
import com.ljh.mvcboard.commons.paging.SearchCriteria;

public interface ArticleDAO {
	public void create(ArticleVO articleVO) throws Exception;
	public ArticleVO read(Integer articleNo) throws Exception;
	public void update(ArticleVO articleVO) throws Exception;
	public void delete(Integer articleNo) throws Exception;
	public List<ArticleVO> listAll() throws Exception;
	public List<ArticleVO> listPaging(int page) throws Exception;
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
	public int countArticles(Criteria criteria) throws Exception; // 전체 게시글 갯수 구하기.
	public List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception; // 검색된 목록.
	public int countSearchedArticles(SearchCriteria searchCriteria) throws Exception; // 검색된 게시글의 갯수.
	public void updateReplyCnt(Integer articleNo, int amount) throws Exception; // 댓글 갯수 갱신.
	public void updateViewCnt(Integer articleNo) throws Exception; // 조회수 증가.
}
