package com.ljh.mvcboard.upload.persistence;

import java.util.List;

public interface ArticleFileDAO {
	// 파일 추가.
	public void addFile(String fileName) throws Exception;
	// 파일 목록.
    public List<String> getArticleFiles(Integer articleNo) throws Exception;
    // 파일 삭제.
    public void deleteFile(String fileName) throws Exception;
    // 파일 전체 삭제.
    public void deleteFiles(Integer articleNo) throws Exception;
    // 파일 수정.
    public void replaceFile(String fileName, Integer articleNo) throws Exception;
    // 파일 갯수 갱신.
    public void updateFileCnt(Integer articleNo) throws Exception;
}
