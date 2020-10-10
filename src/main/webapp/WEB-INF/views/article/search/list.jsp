<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>게시판</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/skin-blue.min.css">
<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<%@ include file="../../include/head.jsp"%>
<body class="hold-transition skin-blue sidebar-mini layout-boxed">
	<div class="wrapper">
		<%@ include file="../../include/main_header.jsp"%>
		<%@ include file="../../include/left_column.jsp"%>
		<!-- main content -->
		<div class="content-wrapper">
			<section class="content-header">
            	<h1>게시판<small>목록페이지(페이징 + 검색)</small></h1>
	            <ol class="breadcrumb">
	                <li><i class="fa fa-edit"></i> article</li>
	                <li class="active">list</li>
	            </ol>
	        </section>
			<section class="content container-fluid">
				<div class="col-lg-12">
	                <div class="box box-primary">
	                    <div class="box-header with-border">
	                        <h3 class="box-title">게시글 목록</h3>
	                    </div>
	                    <div class="box-body">
	                        <table class="table table-bordered">
	                            <tbody>
	                            <tr>
		                            <th class="col-xs-1">번호</th>
	                                <th>제목</th>
	                                <th class="col-xs-2">작성자</th>
	                                <th class="col-xs-2">작성일자</th>
	                                <th class="col-xs-1">조회</th>
	                            </tr>
	                            <c:forEach items="${articles}" var="article">
	                            <tr>
	                                <td>${article.articleNo}</td>
	                                <td><a href="${path}/article/paging/search/read${pageMaker.makeSearch(pageMaker.criteria.page)}&articleNo=${article.articleNo}">
                                            ${article.title}</a></td>
	                                <td>${article.writer}</td>
	                                <td><fmt:formatDate value="${article.regDate}" type="date" pattern="yyyy-MM-dd a HH:mm"/></td>
	                                <td><span class="badge bg-red">${article.viewCnt}</span></td>
	                            </tr>
	                            </c:forEach>
	                            </tbody>
	                        </table>
	                    </div>
	                    <div class="box-footer">
                        <div class="text-center">
	                            <ul class="pagination">
	                                <c:if test="${pageMaker.prev}">
	                                     <li><a href="${path}/article/paging/search/list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
	                                </c:if>
	                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	                                    <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
                                        	<a href="${path}/article/paging/search/list${pageMaker.makeSearch(idx)}">${idx}</a>
                                    	</li>
	                                </c:forEach>
	                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	                                    <li><a href="${path}/article/paging/search/list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
	                                </c:if>
	                            </ul>
	                        </div>
	                    </div>
	                    <div class="box-footer">
	                    	<div class="form-group col-sm-2">
	                            <select class="form-control" name="searchType" id="searchType">
	                                <option value="n" <c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>:::::: 선택 ::::::</option>
	                                <option value="t" <c:out value="${searchCriteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
	                                <option value="c" <c:out value="${searchCriteria.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
	                                <option value="w" <c:out value="${searchCriteria.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
	                                <option value="tc" <c:out value="${searchCriteria.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
	                                <option value="cw" <c:out value="${searchCriteria.searchType eq 'cw' ? 'selected' : ''}"/>>내용+작성자</option>
	                                <option value="tcw" <c:out value="${searchCriteria.searchType eq 'tcw' ? 'selected' : ''}"/>>제목+내용+작성자</option>
	                            </select>
	                        </div>
	                        <div class="form-group col-sm-10">
	                            <div class="input-group">
	                                <input type="text" class="form-control" name="keyword" id="keywordInput" value="${searchCriteria.keyword}" placeholder="검색어">
	                                <span class="input-group-btn">
	                                    <button type="button" class="btn btn-primary btn-flat" id="searchBtn">
	                                        <i class="fa fa-search"></i>검색
	                                    </button>
	                                </span>
	                            </div>
	                        </div>
	                        <div class="pull-right">
	                            <button type="button" class="btn btn-success btn-flat" id="writeBtn">
	                                <i class="fa fa-pencil"></i>글쓰기
	                            </button>
	                        </div>
	                    </div>
	                </div>
	            </div>
			</section>
		</div>
		<%@ include file="../../include/main_footer.jsp"%>
		<!-- control sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active"><a href="#control-sidebar-home-tab"
					data-toggle="tab"><i class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;"> <i class="menu-icon fa fa-birthday-cake bg-red"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
					</ul>
					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span class="pull-right-container">
										<span class="label label-danger pull-right">70%</span>
									</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
								</div>
						</a></li>
					</ul>
				</div>
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>
						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>
							<p>Some information about this general settings option</p>
						</div>
					</form>
				</div>
			</div>
		</aside>
		<div class="control-sidebar-bg"></div>
	</div>
	<%@ include file="../../include/plugin_js.jsp"%>writeBtn
	<script type="text/javascript">
	    $(document).ready(function () {
	    	var result = "${msg}";
		    if (result == "regSuccess") {
		        alert("게시글 등록이 완료되었습니다.");
		    } else if (result == "modSuccess"){
		        alert("게시글 수정이 완료되었습니다.");
		    } else if (result == "delSuccess"){
		        alert("게시글 삭제가 완료되었습니다.");
		    }
	        
	        $("#searchBtn").on("click", function (event) {
	            self.location =
	                "/article/paging/search/list${pageMaker.makeQuery(1)}"
	                + "&searchType=" + $("select option:selected").val()
	                + "&keyword=" + encodeURIComponent($("#keywordInput").val());
	        });

	        $("#writeBtn").on("click", function (event) {
	            self.location = "/article/paging/search/write";
	        });
	    });
	</script>
</body>
</html>
