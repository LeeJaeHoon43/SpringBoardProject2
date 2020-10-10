package com.ljh.mvcboard.commons.paging;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount; // 전체 게시글 갯수.
	private int startPage; // 시작 페이지 번호.
	private int endPage; // 끝 페이지 번호.
	private boolean prev; // 이전 링크.
	private boolean next; // 다음 링크.
	private int displayPageNum = 10;
	private Criteria criteria;
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public Criteria getCriteria() {
		return criteria;
	}
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", criteria=" + criteria + "]";
	}
	
	private void calcData() {
		// 끝 페이지 번호 = Math.ceil(현재 페이지 / 페이지 번호의 갯수) * 페이지 번호의 갯수.
		endPage = (int) (Math.ceil(criteria.getPage() / (double) displayPageNum) * displayPageNum);
		// 시작 페이지 번호 = (끝 페이지 번호 - 페이지 번호의 갯수) + 1
		startPage = (endPage - displayPageNum) + 1;
		// 끝 페이지 번호 = Math.ceil(전체 게시글 수 / 페이지 당 출력할 게시글의 갯수.)
		int tempEndPage = (int) (Math.ceil(totalCount / (double) criteria.getPerPageNum()));
		// 이전의 결과값과 보정된 결과 값을 비교 후, 보정한 결과 값을 페이지 끝 번호 변수에 저장.
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		// 이전 링크의 경우 시작 페이지 번호가 1인지 아닌지 3항 연산자를 통해 검사한다.
		prev = startPage == 1 ? false : true;
		
		// 다음 링크 = 끝 페이지 * 페이지 당 출력할 게시글의 갯수 >= 전체 게시글의 갯수 ? false : true
		next = endPage * criteria.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", criteria.getPerPageNum())
				.build();
		return uriComponents.toUriString();
	}
	
	// 클래스 URI 자동생성 메서드 추가.
	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", criteria.getPerPageNum())
				.queryParam("searchType", ((SearchCriteria) criteria).getSearchType())
				.queryParam("keyword", encoding(((SearchCriteria) criteria).getKeyword()))
				.build();
		return uriComponents.toUriString();
	}
	
	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
}
