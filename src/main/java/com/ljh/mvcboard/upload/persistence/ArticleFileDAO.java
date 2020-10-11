package com.ljh.mvcboard.upload.persistence;

public interface ArticleFileDAO {
	// 파일 추가.
	public void addFile(String fullName) throws Exception;
}
