package com.ljh.mvcboard.upload.service;

import java.util.List;

public interface ArticleFileService {
	// 파일 목록.
    public List<String> getArticleFiles(Integer articleNo) throws Exception;
    // 파일 삭제.
    public void deleteFile(String fileName, Integer articleNo) throws Exception;
}
