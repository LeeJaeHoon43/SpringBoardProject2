<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Intercepot Test</title>
</head>
<body class="hold-transition skin-blue sidebar-mini layout-boxed">
<div class="wrapper">
    <%@ include file="../include/main_header.jsp"%>
    <%@ include file="../include/left_column.jsp"%>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                Interceptor 테스트 페이지
            </h1>
            <ol class="breadcrumb">
                <li><i class="fa fa-edit"></i> interceptor test</li>
            </ol>
        </section>
        <section class="content container-fluid">
            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">인터셉터 결과 데이터</h3>
                    </div>
                    <div class="box-body">
                        <a href="${path}/interceptor/doB">doB 페이지로 이동</a>
                    </div>
                    <div class="box-footer">
                        <p>결과데이터 : ${result}</p>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <%@ include file="../include/main_footer.jsp"%>
</div>
<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>