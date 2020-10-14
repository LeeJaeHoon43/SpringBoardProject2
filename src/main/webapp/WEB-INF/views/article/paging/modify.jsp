<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>게시판</title>
<!-- Tell the browser to be responsive to screen width -->
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
            	<h1>게시판<small>수정페이지(페이징)</small></h1>
		            <ol class="breadcrumb">
		                <li><i class="fa fa-edit"></i> article</li>
		                <li class="active"><a href="${path}/article/paging/modify"> modify</a></li>
		            </ol>
		    </section>
			<section class="content container-fluid">
				<div class="col-lg-12">
	                <form role="form" id="writeForm" method="post" action="${path}/article/paging/modify">
	                    <div class="box box-primary">
	                        <div class="box-header with-border">
	                            <h3 class="box-title">게시글 수정</h3>
	                        </div>
	                        <div class="box-body">
	                            <input type="hidden" name="articleNo" value="${article.articleNo}">
	                            <input type="hidden" name="page" value="${criteria.page}">
	                            <input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
	                            <div class="form-group">
	                                <label for="title">제목</label>
	                                <input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" value="${article.title}">
	                            </div>
	                            <div class="form-group">
	                                <label for="content">내용</label>
	                                <textarea class="form-control" id="content" name="content" rows="30"
	                                          placeholder="내용을 입력해주세요" style="resize: none;">${article.content}</textarea>
	                            </div>
	                            <div class="form-group">
	                                <label for="writer">작성자</label>
	                                <input class="form-control" id="writer" name="writer" value="${article.writer}" readonly>
	                            </div>
	                        </div>
	                        <div class="box-footer">
	                            <button type="button" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
	                            <div class="pull-right">
	                                <button type="button" class="btn btn-warning cancelBtn"><i class="fa fa-trash"></i> 취소</button>
	                                <button type="submit" class="btn btn-success modBtn"><i class="fa fa-save"></i> 수정 저장</button>
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
	<script type="text/javascript">
	$(document).ready(function () {
        var formObj = $("form[role='form']");
        console.log(formObj);

        $(".modBtn").on("click", function () {
            formObj.submit();
        });

        $(".cancelBtn").on("click", function () {
            history.go(-1);
        });

        $(".listBtn").on("click", function () {
            self.location = "/article/paging/list?page=${criteria.page}&perPageNum=${criteria.perPageNum}";
        });
    });
	</script>
</body>
</html>
