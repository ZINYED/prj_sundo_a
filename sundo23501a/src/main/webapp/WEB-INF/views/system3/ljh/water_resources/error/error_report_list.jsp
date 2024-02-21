<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.title {
		text-align: center;
		font-size: 25pt;
	}

	.tapBtn {
		display: flex;
    	padding: 20px 100px;
	}
	
	.insertBtn {
		text-align: right;
		margin: 20px 0px;
	}
	
	.listTable {
		width: 100%;
		text-align: center;
	}
	
	.tableCate {
		border-top: solid gray 2px;
		background: #EAEAEA;
		height: 40px;
	}
	
	.tableCate th {
		border-left: solid white 1px;
		border-right: solid white 1px;
	}
	
	.tableRow {
		border-bottom: solid lightgray 1px;
		height: 40px;
	}

	header {
		height: 55px;
	}

</style>
	<script>

		$(function() {

			$.ajax({
				url			: '/main_header_3',
				dataType 	: 'html',
				success		: function(data) {
					$('#header').html(data);
				}
			});

			$.ajax({
				url			: '/main_footer',
				dataType 	: 'html',
				success		: function(data) {
					$('#footer').html(data);
				}
			});
		});
	</script>
</head>
<body>

		<header id="header" style="margin-top: 3%"></header>



		<div class="container">
			<div class="row">
				<div id="center">
					<div>
						<p class="title">고장/조치 결과 보고 목록</p>
						<div class="btn-group tapBtn">
							<button type="button" id="errorBtn" class="btn btn-outline-dark" onclick="location.href='/error_report_list'">고장 보고서</button>
							<button type="button" id="actionBtn" class="btn btn-outline-dark" onclick="location.href='/action_report_list'">조치 결과 보고서</button>
						</div>
						<div class="insertBtn">
							<button type="button" class="btn btn-dark btn-sm" onclick="location.href='/error_report_write_form'">고장 보고서 작성 &gt;</button>
						</div>

						<table class="listTable">
							<tr class="tableCate"><th>연번</th><th>등록 일자</th><th>시설물 종류</th><th>제목</th><th>작성자</th><th>고장 보고서</th></tr>
							<c:forEach var="brList" items="${breakReportList }">
								<tr class="tableRow">
									<td>${brList.rn }</td><td>${brList.create_datetime }</td><td>${brList.facility_category }</td>
									<td>${brList.subject }</td><td>${brList.user_name }</td>
									<td><input type="button" class="btn btn-outline-dark btn-sm" value="열기" onclick="location.href='/error_report_read?doc_no=${brList.doc_no }'"></td>
								</tr>
							</c:forEach>
						</table>

						<ul class="pagination justify-content-center">
							<c:if test="${page.startPage > page.pageBlock}">
								<a href="error_report_list?currentPage=${page.startPage - page.pageBlock}">[이전]</a>
							</c:if>

							<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
								<a href="error_report_list?currentPage=${i}">[${i}]</a>
							</c:forEach>

							<c:if test="${page.endPage < page.totalPage}">
								<a href="error_report_list?currentPage=${page.startPage + page.pageBlock}">[다음]</a>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<footer class="footer py-2">
			<div id="footer" class="container">
			</div>
		</footer>



</body>
</html>