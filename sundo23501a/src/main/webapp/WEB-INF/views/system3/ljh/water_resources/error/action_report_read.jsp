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
	
	table {
		width: 100%;
		border-top: solid gray 2px;
		border-bottom: solid gray 2px;
	}
	
	tr {
		border-bottom: solid lightgray 1px;
		border-top: solid lightgray 1px;
	}
	
	.btns {
		text-align: right;
		margin-top: 20px;
	}
	
	th {
		background: #EAEAEA;
		padding: 5px 10px;
		width: 200px;
	}
	
	td {
		padding: 5px 10px;
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
<script type="text/javascript">
	function delActionRpt() {
		var answer = confirm('보고서를 삭제하시겠습니까?')
		
		if (answer) {
			var doc_no = '${actionRpt.doc_no}';
			var sendurl = "/action_report_delete?doc_no=" + doc_no;
			
			$.ajax({
				url		: sendurl,
				dataType: 'json',
				success : function(data) {
					console.log(data);
					
					alert("삭제되었습니다");
					location.href="/action_report_list";
				}
			});
		
		} else {
			return false;
		}
	};

</script>
</head>
<body>


	<header id="header"></header>




	<div class="container" style="margin-top: 3%">
		<div class="row">
			<div id="center">

				<p class="title">조치 결과 보고서 상세 페이지</p>
				<div>
					<table>
						<thead>
						<tr>
							<th>시설물 종류</th><td>${actionRpt.facility_category }</td>
							<th>시설물 코드</th><td>${actionRpt.facility_code }</td>
							<th>작성자</th><td>${actionRpt.user_id }</td>	<!-- 로그인한 사용자 이름 자동 표출 필요 -->
						</tr>

						<tr>
							<th>점검대상</th><td>${actionRpt.check_target }</td>
							<th>중분류</th><td>${actionRpt.m_category }</td>
							<th>소분류</th><td>${actionRpt.s_category }</td>
						</tr>
						</thead>
						<tbody>
						<tr>
							<th>고장/발생 일자</th><td colspan="2">${actionRpt.break_date }</td>
							<th>조치/복구 일자</th><td colspan="2">${actionRpt.action_date }</td>
						</tr>
						<tr><th>고장내역</th><td colspan="5">${actionRpt.break_content }</td></tr>
						<tr><th>조치내역</th><td colspan="5">${actionRpt.action_content }</td></tr>
						<tr><th>특이사항</th><td colspan="5">${actionRpt.spec_memo }</td></tr>
						<tr><th>향후계획</th><td colspan="5">${actionRpt.future_plan }</td></tr>
						<tr><th>파일</th><td colspan="5"></td></tr>
						</tbody>
					</table>
					<div class="btns">
						<button class="btn btn-dark btn-sm" onclick="location.href='/action_report_list'">목록</button>
						<button class="btn btn-dark btn-sm" onclick="location.href='/action_report_update_form?doc_no=${actionRpt.doc_no}'">수정</button>
						<button class="btn btn-dark btn-sm" onclick="delActionRpt()">삭제</button>
					</div>
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