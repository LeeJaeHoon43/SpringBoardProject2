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
            	<h1>게시판<small>목록페이지</small></h1>
	            <ol class="breadcrumb">
	                <li><i class="fa fa-edit"></i> article</li>
	                <li class="active"><a href="${path}/article/list"> list</a></li>
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
	                                <th style="width: 30px">#</th>
	                                <th>제목</th>
	                                <th style="width: 100px">작성자</th>
	                                <th style="width: 150px">작성시간</th>
	                                <th style="width: 60px">조회</th>
	                            </tr>
	                            <c:forEach items="${articles}" var="article">
	                            <tr>
	                                <td>${article.articleNo}</td>
	                                <td><a href="${path}/article/read?articleNo=${article.articleNo}">${article.title}</a></td>
	                                <td>${article.writer}</td>
	                                <td><fmt:formatDate value="${article.regDate}" type="date" pattern="yyyy-MM-dd a HH:mm"/></td>
	                                <td><span class="badge bg-red">${article.viewCnt}</span></td>
	                            </tr>
	                            </c:forEach>
	                            </tbody>
	                        </table>
	                    </div>
	                    <div class="box-footer">
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
	</div>
	<%@ include file="../../include/plugin_js.jsp"%>writeBtn
	<script type="text/javascript">
	 	var result = "${msg}";
	    if (result == "regSuccess") {
	        alert("게시글 등록이 완료되었습니다.");
	    } else if (result == "modSuccess"){
	        alert("게시글 수정이 완료되었습니다.");
	    } else if (result == "delSuccess"){
	        alert("게시글 삭제가 완료되었습니다.");
	    }
	    
	    $(document).ready(function () {
	        $("#writeBtn").on("click", function () {
	           self.location = "/article/write";
	        });
	    });
	</script>
</body>
</html>
