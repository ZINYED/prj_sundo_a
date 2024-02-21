<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		$.ajax({
			url			: '/main_header_21',
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

	function ob_del(){
		var answer = confirm('관측소를 삭제하시겠습니까?')
		
		if(answer){
			var observe_code =${observation.observe_code};
			
			$.ajax({
				url : "/ob_delete?observe_code="+observe_code,
				dataType : 'json',
				success : function(data){
					alert("삭제되었습니다.");
					location.href="/observation_find";
				}
			});
		} else{
			return false;
		}		
	};



</script>
<style>


	header {
		height: 55px;
	}
</style>
</head>
<body>


	<header id="header"></header>
	<div class="container">
		<div class="row">
			<div id="center">
				<div>
					<div style="margin: 30px">
						<input type="hidden" name="observe_code" value="${observation.observe_code}">
						<h2>관측소 정보</h2>
						<div align="right">
							<button onclick="location.href='observation_find'">목록으로</button>
						</div>
						<hr>
						<table class="table table-hover">
							<tr>
								<th>관측소명</th>
								<td colspan='3'>${observation.observe_post}</td>
							</tr>
							<tr>
								<th>관측유형</th>
								<td>${observation.observe_type_name}</td>
								<th>표준코드</th>
								<td>${observation.river_code}</td>
							</tr>
							<tr>
								<th>위도</th>
								<td>${observation.latitude}</td>
								<th>경도</th>
								<td>${observation.longitude}</td>
							</tr>
							<tr>
								<th>관측방식</th>
								<td>${observation.observe_method_name}</td>
								<th>운영기관</th>
								<td>${observation.org_name}</td>
							</tr>
						</table>
						<div align="center">
							<button onclick="location.href='observation_edit?observe_code=${observation.observe_code}'">수정</button>
							<button onclick="ob_del()">삭제</button>
						</div>
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