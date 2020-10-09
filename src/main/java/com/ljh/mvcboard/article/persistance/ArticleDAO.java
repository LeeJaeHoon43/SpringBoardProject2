package com.ljh.mvcboard.article.persistance;

import java.util.List;
import com.ljh.mvcboard.article.domain.ArticleVO;

public interface ArticleDAO {
	public void create(ArticleVO articleVO) throws Exception;
	public ArticleVO read(Integer articleNo) throws Exception;
	public void update(ArticleVO articleVO) throws Exception;
	public void delete(Integer articleNo) throws Exception;
	public List<ArticleVO> listAll() throws Exception;
}
