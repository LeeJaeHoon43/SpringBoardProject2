<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>게시판</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/skins/skin-blue.min.css">
<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<%@ include file="../../include/head.jsp"%>
<body class="hold-transition skin-blue sidebar-mini layout-boxed">
	<div class="wrapper">
		<%@ include file="../../include/main_header.jsp"%>
		<%@ include file="../../include/left_column.jsp"%>
		<!-- main content -->
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					게시판<small>조회페이지(페이징 + 검색)</small>
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-edit"></i> article</li>
					<li class="active">read</li>
				</ol>
			</section>
			<section class="content container-fluid">
				<div class="col-lg-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">글제목 : ${article.title}</h3>
						</div>
						<div class="box-body" style="height: 700px">${article.content}</div>
						<%--업로드 파일 정보 영역--%>
	                    <div class="box-footer uploadFiles">
	                        <ul class="mailbox-attachments clearfix uploadedFileList"></ul>
	                    </div>
						<div class="box-footer">
							<div class="user-block">
								<img class="img-circle img-bordered-sm" src="${path}/dist/img/user1-128x128.jpg" alt="user image"> 
									<span class="username"><a href="#">${article.writer}</a></span> 
									<span class="description">
										<fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${article.regDate}" />
									</span>
							</div>
						</div>
						<div class="box-footer">
							<form role="form" method="post">
								<input type="hidden" name="articleNo" value="${article.articleNo}">
	                            <input type="hidden" name="page" value="${searchCriteria.page}">
	                            <input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
	                            <input type="hidden" name="searchType" value="${searchCriteria.searchType}">
	                            <input type="hidden" name="keyword" value="${searchCriteria.keyword}">
							</form>
							<button type="submit" class="btn btn-primary listBtn">
								<i class="fa fa-list"></i> 목록
							</button>
							<div class="pull-right">
								<button type="submit" class="btn btn-warning modBtn">
									<i class="fa fa-edit"></i> 수정
								</button>
								<button type="submit" class="btn btn-danger delBtn">
									<i class="fa fa-trash"></i> 삭제
								</button>
							</div>
						</div>
					</div>
				
					<div class="box box-warning">
						<div class="box-header with-border">
							<a class="link-black text-lg"><i class="fa fa-pencil"></i> 댓글 작성</a>
						</div>
						<div class="box-body">
							<form class="form-horizontal">
								<div class="form-group margin">
									<div class="col-sm-10">
										<textarea class="form-control" id="newReplyText" rows="3"
											placeholder="댓글내용..." style="resize: none"></textarea>
									</div>
									<div class="col-sm-2">
										<input class="form-control" id="newReplyWriter" type="text" placeholder="댓글 작성자...">
									</div>
									<div class="col-sm-2">
										<button type="button" class="btn btn-primary btn-block replyAddBtn"><i class="fa fa-save"></i> 댓글 저장
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>

					<div class="box box-success collapsed-box">
						<%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
						<div class="box-header with-border">
							<a class="link-black text-lg"><i class="fa fa-comments-o margin-r-5 replyCount"></i></a>
							<div class="box-tools">
								<button type="button" class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-plus"></i>
								</button>
							</div>
						</div>
						<%--댓글 목록--%>
						<div class="box-body repliesDiv">
						</div>
						<%--댓글 페이징--%>
						<div class="box-footer">
							<div class="text-center">
								<ul class="pagination pagination-sm no-margin">
	
								</ul>
							</div>
						</div>
					</div>

					<%--댓글 수정 modal 영역--%>
					<div class="modal fade" id="modModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title">댓글수정</h4>
								</div>
								<div class="modal-body" data-rno>
									<input type="hidden" class="replyNo" />
									<%--<input type="text" id="replytext" class="form-control"/>--%>
									<textarea class="form-control" id="replyText" rows="3" style="resize: none"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary modalModBtn">수정</button>
								</div>
							</div>
						</div>
					</div>

					<%--댓글 삭제 modal 영역--%>
					<div class="modal fade" id="delModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title">댓글 삭제</h4>
									<input type="hidden" class="rno" />
								</div>
								<div class="modal-body" data-rno>
									<p>댓글을 삭제하시겠습니까?</p>
									<input type="hidden" class="rno" />
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default pull-left" data-dismiss="modal">아니요.</button>
									<button type="button" class="btn btn-primary modalDelBtn">네. 삭제합니다.</button>
								</div>
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
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>
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
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
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
	<%@ include file="../../include/plugin_js.jsp"%>	
    	<script id="replyTemplate" type="text/x-handlebars-template">
    		{{#each.}}
    		<div class="post replyDiv" data-replyNo={{replyNo}}>
        		<div class="user-block">
            	<%--댓글 작성자 프로필사진--%>
            	<img class="img-circle img-bordered-sm" src="/dist/img/user1-128x128.jpg" alt="user image">
            	<%--댓글 작성자--%>
            	<span class="username">
                	<%--작성자 이름--%>
                	<a href="#">{{replyWriter}}</a>
                	<%--댓글 삭제 버튼--%>
                	<a href="#" class="pull-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal">
                    	<i class="fa fa-times"> 삭제</i>
                	</a>
                	<%--댓글 수정 버튼--%>
                	<a href="#" class="pull-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal">
                    	<i class="fa fa-edit"> 수정</i>
                	</a>
                	{{/eqReplyWriter}}
            	</span>
            	<%--댓글 작성일자--%>
            	<span class="description">{{prettifyDate regDate}}</span>
        	</div>
        	<%--댓글 내용--%>
        	<div class="oldReplyText">{{{escape replyText}}}</div>
        	<br/>
    	</div>
    	{{/each}}
	</script>
	<script id="fileTemplate" type="text/x-handlebars-template">
    	<li data-src="{{fullName}}">
        	<span class="mailbox-attachment-icon has-img">
            	<img src="{{imgSrc}}" alt="Attachment">
        	</span>
        	<div class="mailbox-attachment-info">
            	<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
                	<i class="fa fa-paperclip"></i> {{originalFileName}}
            	</a>
        	</div>
    	</li>
	</script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/article_file_upload.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/reply.js"></script>
	<script type="text/javascript">		
		$(document).ready(function(){
			
			var articleNo = "${article.articleNo}";  // 현재 게시글 번호.
	        var replyPageNum = 1; // 댓글 페이지 번호 초기화.
	        
	     	// 첨부파일 목록.
	        getFiles(articleNo);
	        
	     	// 댓글 목록 함수 호출.
	        getReplies("/replies/" + articleNo + "/" + replyPageNum);
	        
	     	// 댓글 내용 : 줄바꿈, 공백처리.
	        Handlebars.registerHelper("escape", function(replyText) {
				var text = Handlebars.Utils.escapeExpression(replyText);
				text = text.replace(/(\r\n|\n|\r)/gm, "<br/>");
				text = text.replace(/( )/gm, "&nbsp;");
				return new Handlebars.SafeString(text);
			});
			
			// 댓글 등록일자 : 날짜 / 시간 2자리로 맞추기.
			Handlebars.registerHelper("prettifyDate", function(timeValue) {
				var dateObj = new Date(timeValue);
				var year = dateObj.getFullYear();
				var month = dateObj.getMonth() + 1;
				var date = dateObj.getDate();
				var hours = dateObj.getHours();
				var minutes = dateObj.getMinutes();
				// 2자리 숫자로 변환.
				month < 10 ? month = '0' + month : month;
				date < 10 ? date = '0' + date : date;
				hours < 10 ? hours = '0' + hours : hours;
				minutes < 10 ? minutes = '0' + minutes : minutes;
				return year + "-" + month + "-" + date + " " + hours + ":" + minutes;
			});
	        
	        // 댓글 목록 함수.
	        function getReplies(repliesUri) {
				$.getJSON(repliesUri, function(data) {
					printReplyCount(data.pageMaker.totalCount);
					printReplies(data.replies, $(".repliesDiv"), $("#replyTemplate"));
					printReplyPaging(data.pageMaker, $(".pagination"));
				});
			}
	        
	        // 댓글 갯수 출력 함수.
	        function printReplyCount(totalCount) {
				var replyCount = $(".replyCount");
				var collapsedBox = $(".collapsed-box");
				
				// 댓글이 없을 경우.
				if (totalCount === 0) {
					replyCount.html("댓글이 없습니다. 의견을 남겨주세요.");
					collapsedBox.find(".btn-box-tool").remove();
					return;
				}
				
				// 댓글이 존재할 경우.
				replyCount.html(" 댓글 목록 (" + totalCount + ")");
				collapsedBox.find(".box-tools").html(
					"<button type='button' class='btn btn-box-tool' data-widget='collapse'>"
					+ "<i class='fa fa-plus'></i>"
					+ "</button>"
				);
			}
	        
	        // 댓글 목록 출력 함수.
	        function printReplies(replyArr, targetArea, templateObj) {
				var replyTemplate = Handlebars.compile(templateObj.html());
				var html = replyTemplate(replyArr);
				$(".replyDiv").remove();
				targetArea.html(html);
			}
	        
	        // 댓글 페이징 출력 함수.
	        function printReplyPaging(pageMaker, targetArea) {
				var str = "";
				if (pageMaker.prev) {	
					str += "<li><a href='" + (pageMaker.startPage - 1) + "'>이전</a></li>";
				}
				for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
					var strClass = pageMaker.criteria.page == i ? "class=active" : '';
					str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
				}
				if (pageMaker.next) {
					str += "<li><a href='" + (pageMaker.endPage + 1) + "'>다음</a></li>";
				}
				targetArea.html(str);
			}
			   
	        // 댓글 페이지 번호 클릭 이벤트
	        $(".pagination").on("click", "li a", function (event) {
	            event.preventDefault();
	            replyPageNum = $(this).attr("href");
	            getReplies("/replies/" + articleNo + "/" + replyPageNum);
	        });

	        // 댓글 저장 버튼 클릭 이벤트.
	        $(".replyAddBtn").on("click", function () {

	            // 입력 form 선택자.
	            var replyWriterObj = $("#newReplyWriter");
	            var replyTextObj = $("#newReplyText");
	            var replyWriter = replyWriterObj.val();
	            var replyText = replyTextObj.val();

	            // 댓글 입력처리 수행.
	            $.ajax({
	                type: "post",
	                url: "/replies/",
	                headers: {
	                    "Content-Type": "application/json",
	                    "X-HTTP-Method-Override": "POST"
	                },
	                dataType: "text",
	                data: JSON.stringify({
	                    articleNo: articleNo,
	                    replyWriter: replyWriter,
	                    replyText: replyText
	                }),
	                success: function (result) {
	                    console.log("result : " + result);
	                    if (result === "regSuccess") {
	                        alert("댓글이 등록되었습니다.");
	                        replyPageNum = 1;  // 페이지 1로 초기화.
	                        getReplies("/replies/" + articleNo + "/" + replyPageNum); // 댓글 목록 호출.
	                        replyTextObj.val("");   // 댓글 입력창 공백처리.
	                        replyWriterObj.val("");   // 댓글 입력창 공백처리.
	                    }
	                }
	            });
	        });

	        // 댓글 수정을 위해 modal창에 선택한 댓글의 값들을 세팅.
	        $(".repliesDiv").on("click", ".replyDiv", function (event) {
	            var reply = $(this);
	            $(".replyNo").val(reply.attr("data-replyNo"));
	            $("#replyText").val(reply.find(".oldReplyText").text());
	        });

	        // modal 창의 댓글 수정버튼 클릭 이벤트.
	        $(".modalModBtn").on("click", function () {
	            var replyNo = $(".replyNo").val();
	            var replyText = $("#replyText").val();
	            $.ajax({
	                type: "put",
	                url: "/replies/" + replyNo,
	                headers: {
	                    "Content-Type": "application/json",
	                    "X-HTTP-Method-Override": "PUT"
	                },
	                dataType: "text",
	                data: JSON.stringify({
	                    replyText: replyText
	                }),
	                success: function (result) {
	                    console.log("result : " + result);
	                    if (result === "modSuccess") {
	                        alert("댓글이 수정되었습니다.");
	                        getReplies("/replies/" + articleNo + "/" + replyPageNum); // 댓글 목록 호출.
	                        $("#modModal").modal("hide"); // modal 창 닫기.
	                    }
	                }
	            })
	        });

	        // modal 창의 댓글 삭제버튼 클릭 이벤트.
	        $(".modalDelBtn").on("click", function () {
	            var replyNo = $(".replyNo").val();
	            $.ajax({
	                type: "delete",
	                url: "/replies/" + replyNo,
	                headers: {
	                    "Content-Type": "application/json",
	                    "X-HTTP-Method-Override": "DELETE"
	                },
	                dataType: "text",
	                success: function (result) {
	                    console.log("result : " + result);
	                    if (result === "delSuccess") {
	                        alert("댓글이 삭제되었습니다.");
	                        getReplies("/replies/" + articleNo + "/" + replyPageNum); // 댓글 목록 호출.
	                        $("#delModal").modal("hide"); // modal 창 닫기.
	                    }
	                }
	            });
	        });
			
	        var formObj = $("form[role='form']");
	        console.log(formObj);

	        $(".modBtn").on("click", function () {
	            formObj.attr("action", "/article/paging/search/modify");
	            formObj.attr("method", "get");
	            formObj.submit();
	        });

	        
	        // 게시글 삭제 클릭 이벤트.
	        $(".delBtn").on("click", function () {
	            var replyCnt = $(".replyDiv").length;
	            if (replyCnt > 0) {
	                alert("댓글이 달린 게시글은 삭제할수 없습니다.");
	                return;
	            }
	            // 첨부 파일 명들을 배열에 저장.
	            var arr = [];
	            $(".uploadedFileList li").each(function () {
	                arr.push($(this).attr("data-src"));
	            });
	            
	            // 첨부 파일 삭제 요청.
	            if (arr.length > 0) {
	                $.post("/article/file/deleteAll", {files: arr}, function () {

	                });
	            }
	            
	            // 삭제 처리.
	            formObj.attr("action", "/article/paging/search/remove");
	            formObj.submit();
	        });

	        $(".listBtn").on("click", function () {
	           formObj.attr("action", "/article/paging/search/list");
	           formObj.attr("method", "get");
	           formObj.submit();
	        });
	    });
	</script>
</body>
</html>
