<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<aside class="main-sidebar">
	<section class="sidebar">
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${path}/dist/img/user2-160x160.jpg" class="img-circle"
					alt="User Image">
			</div>
			<div class="pull-left info">
				<p>Alexander Pierce</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>

		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..."> <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn"
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>

		<!-- Sidebar Menu -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">메뉴</li>
			<li class="active"><a href="${path}/article/write"><i class="fa fa-link"></i><span>게시글 작성</span></a></li>
			<li><a href="${path}/article/list"><i class="fa fa-link"></i><span>게시글 목록</span></a></li>
		</ul>
	</section>
</aside>