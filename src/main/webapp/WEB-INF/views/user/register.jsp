<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<%@ include file="../include/head.jsp" %>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="${path}/">
            <b>DoubleS</b>&nbsp MVC-BOARD
        </a>
    </div>
    <div class="register-box-body">
        <p class="login-box-msg">회원가입 페이지</p>

        <form action="${path}/user/register" method="post">
            <div class="form-group has-feedback">
                <input type="text" name="userId" id="userId" class="form-control" placeholder="아아디">
                <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" name="userName" id="userName" class="form-control" placeholder="이름">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="email" name="userEmail" id="userEmail" class="form-control" placeholder="이메일">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="userPw" id="userPw" class="form-control" placeholder="비밀번호">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" id="userPwConfirm" placeholder="비밀번호 확인">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> 약관에 <a href="#">동의</a>
                        </label>
                    </div>
                </div>
                <div class="col-xs-4">
                    <button type="submit" id="submit" class="btn btn-primary btn-block btn-flat">가입</button>
                </div>
            </div>
        </form>
        <div class="social-auth-links text-center">
            <p>- 또는 -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat">
                <i class="fa fa-facebook"></i> 페이스북으로 가입
            </a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat">
                <i class="fa fa-google-plus"></i> 구글 계정으로 가입
            </a>
        </div>
        <a href="${path}/user/login" class="text-center" id="login">로그인</a>
    </div>
</div>
<%@ include file="../include/plugin_js.jsp" %>
<script>
$(document).ready(function() {	
	$("#submit").on("click", function() {
		if ($("#userId").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return false;
		}
		if ($("#userName").val() == "") {
			alert("성명을 입력해주세요.");
			$("#userName").focus();
			return false;
		}
		if ($("#userEmail").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#userEmail").focus();
			return false;
		}
		if ($("#userPw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#userPass").focus();
			return false;
		}
		if ($("#userPwConfirm").val() == "") {
			alert("비밀번호를 확인하세요.");
			$("#userPwConfirm").focus();
			return false;
		}
		if ($("#userPw").val() != $("#userPwConfirm").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#userPw").focus();
			return false;
		}
	});
	var msg = "${msg}";
	if (msg === "REGISTERED") {
	    alert("회원가입이 완료되었습니다. 로그인해주세요~");
	} else if (msg == "FAILURE") {
	    alert("아이디와 비밀번호를 확인해주세요.");
	}
	
	$(function () {
	    $('input').iCheck({
	        checkboxClass: 'icheckbox_square-blue',
	        radioClass: 'iradio_square-blue',
	        increaseArea: '20%' // optional
	    });
	});
})
</script>
</body>
</html>