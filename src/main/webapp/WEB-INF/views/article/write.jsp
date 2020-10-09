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
<%@ include file="../include/head.jsp"%>
<body class="hold-transition skin-blue sidebar-mini layout-boxed">
	<div class="wrapper">
		<%@ include file="../include/main_header.jsp"%>
		<%@ include file="../include/left_column.jsp"%>
		<!-- main content -->
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					Page Header<small>Optional description</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
			</section>
			<section class="content container-fluid">
				<div class="col-lg-12">
	                <form role="form" id="writeForm" method="post" action="${path}/article/write">
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
	                                <input class="form-control" id="writer" name="writer">
	                            </div>
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
		<%@ include file="../include/main_footer.jsp"%>
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
	<%@ include file="../include/plugin_js.jsp"%>
	<script type="text/javascript">
	$(document).ready(function () {
        $(".listBtn").on("click", function () {
           self.location = "/article/list";
        });
    });
	</script>
</body>
</html>
