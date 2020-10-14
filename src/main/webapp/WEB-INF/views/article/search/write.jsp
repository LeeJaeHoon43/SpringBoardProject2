<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style>
    .fileDrop {
        width: 100%;
        height: 200px;
        border: 2px dotted #0b58a2;
    }
</style>
</head>
<%@ include file="../../include/head.jsp"%>
<body class="hold-transition skin-blue sidebar-mini layout-boxed">
	<div class="wrapper">
		<%@ include file="../../include/main_header.jsp"%>
		<%@ include file="../../include/left_column.jsp"%>
		<!-- main content -->
		<div class="content-wrapper">
			<section class="content-header">
	            <h1>게시판<small>입력페이지(페이징 + 검색)</small></h1>
	            <ol class="breadcrumb">
	                <li><i class="fa fa-edit"></i> article</li>
	                <li class="active"><a href="${path}/article/paging/write"> write</a></li>
	            </ol>
	        </section>
			<section class="content container-fluid">
				<div class="col-lg-12">
	                <form role="form" id="writeForm" method="post" action="${path}/article/paging/search/write">
	                    <div class="box box-primary">
	                        <div class="box-header with-border">
	                            <h3 class="box-title">게시글 작성</h3>
	                        </div>
	                        <div class="box-body">
	                            <div class="form-group">
	                                <label for="title">제목</label>
	                                <input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
	                            </div>
	                            <div class="form-group">
	                                <label for="content">내용</label>
	                                <textarea class="form-control" id="content" name="content" rows="30"
	                                          placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
	                            </div>
	                            <div class="form-group">
	                                <label for="writer">작성자</label>
	                                <input class="form-control" id="writer" name="writer" value="${login.userId}" readonly>
	                            </div>
	                            <div class="form-group">
	                                <div class="fileDrop">
	                                    <br/>
	                                    <br/>	
	                                    <br/>
	                                    <br/>
	                                    <p class="text-center"><i class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.</p>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="box-footer">
                            	<ul class="mailbox-attachments clearfix uploadedFileList"></ul>
                        	</div>
	                        <div class="box-footer">
	                            <button type="button" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
	                            <div class="pull-right">
	                                <button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
	                                <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 저장</button>
	                            </div>
	                        </div>
	                    </div>
	                </form>
	            </div>
			</section>
		</div>
		<%@ include file="../../include/main_footer.jsp"%>
	</div>
	<%@ include file="../../include/plugin_js.jsp"%>
	<script id="fileTemplate" type="text/x-handlebars-template">
    <li>
        <span class="mailbox-attachment-icon has-img">
            <img src="{{imgSrc}}" alt="Attachment">
        </span>
        <div class="mailbox-attachment-info">
            <a href="{{originalFileUrl}}" class="mailbox-attachment-name">
                <i class="fa fa-paperclip"></i> {{originalFileName}}
            </a>
            <a href="{{fileName}}" class="btn btn-default btn-xs pull-right delBtn">
                <i class="fa fa-fw fa-remove"></i>
            </a>
        </div>
    </li>
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/article_file_upload.js"></script>
	<script type="text/javascript">		
		$(document).ready(function () {
			
			// 게시글 저장 버튼 이벤트 처리.
	        $("#writeForm").submit(function (event) {
	            event.preventDefault();
	            var that = $(this);
	            filesSubmit(that);
	        });
			
	     	// 파일 삭제 버튼 클릭 이벤트.
	        $(document).on("click", ".delBtn", function (event) {
	            event.preventDefault();
	            var that = $(this);
	            deleteFileWrtPage(that);
	        });

	        // 목록 버튼 클릭 이벤트 처리.
	        $(".listBtn").on("click", function () {
	            self.location = "/article/paging/search/list?page=${searchCriteria.page}"
	                + "&perPageNum=${searchCriteria.perPageNum}"
	                + "&searchType=${searchCriteria.searchType}"
	                + "&keyword=${searchCriteria.keyword}";
	        });
	    });
	</script>
</body>
</html>
