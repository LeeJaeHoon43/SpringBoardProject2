package com.ljh.mvcboard.article.service;

import java.util.List;
import com.ljh.mvcboard.article.domain.ArticleVO;

public interface ArticleService {
	public void create(ArticleVO articleVO) throws Exception;
	public ArticleVO read(Integer articleNo) throws Exception;
	public void update(ArticleVO articleVO) throws Exception;
	public void delete(Integer articleNo) throws Exception;
	public List<ArticleVO> listAll() throws Exception;
}