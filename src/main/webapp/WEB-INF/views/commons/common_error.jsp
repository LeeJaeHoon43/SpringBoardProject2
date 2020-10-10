<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error page</title>
</head>
<body class="hold-transition skin-blue sidebar-mini layout-boxed">
<div class="wrapper">
    <!-- Main Header -->
    <%@ include file="../include/main_header.jsp"%>
    <!-- Left side column -->
    <%@ include file="../include/left_column.jsp"%>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                	에러, 예외 페이지
            </h1>
            <ol class="breadcrumb">
                <li><i class="fa fa-edit"></i> common_error</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content container-fluid">
            <h3><i class="fa fa-warning text-red"></i> ${exception.getMessage()}</h3>
            <ul>
                <c:forEach items="${exception.getStackTrace()}" var="stack">
                    <li>${stack.toString()}</li>
                </c:forEach>
            </ul>
        </section>
    </div>
    <!-- Main Footer -->
    <%@ include file="../include/main_footer.jsp"%>
</div>
<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>