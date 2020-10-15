<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<%@ include file="../include/head.jsp" %>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="${path}/">
            <b>DoubleS</b>&nbsp MVC-BOARD
        </a>
    </div>

    <div class="login-box-body">
        <p class="login-box-msg">로그인 페이지</p>
        <form action="${path}/user/loginPost" method="post">
            <div class="form-group has-feedback">
                <input type="text" name="userId" id="userId" class="form-control" placeholder="아아디">
                <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="userPw" id="userPw" class="form-control" placeholder="비밀번호">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" name="useCookie">로그인 유지
                        </label>
                    </div>
                </div>
                <div class="col-xs-4">
                    <button type="submit" id="submit" class="btn btn-primary btn-block btn-flat">
                        <i class="fa fa-sign-in"></i> 로그인
                    </button>
                </div>
            </div>
        </form>
        <div class="social-auth-links text-center">
            <p>- 또는 -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat">
                <i class="fa fa-facebook"></i> 페이스북으로 로그인
            </a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat">
                <i class="fa fa-google-plus"></i> 구글 계정으로 로그인
            </a>
        </div>	
        <a href="${path}/user/register" class="text-center">회원가입</a>
    </div>
</div>
<%@ include file="../include/plugin_js.jsp" %>
<script type="text/javascript">
$(document).ready(function() {	
	$("#submit").on("click", function() {
		if ($("#userId").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return false;
		}
		if ($("#userPw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#userPw").focus();
			return false;
		}
	});
	
	$(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional.
        });
    });
})
</script>
</body>
</html>