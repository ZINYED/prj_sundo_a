<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		header {
			height: 55px;
		}
	</style>
	<script>

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

	</script>
</head>
<body>

	<header id="header"></header>


	<div class="container">
		<div class="row">
			<div id="center">
				<div style="margin: 30px">
					<h2>관측소 수정 ${observation.observe_code}</h2>
					<form action="ob_edit" method="post">
						<input type="hidden" name="observe_code" value="${observation.observe_code}">

						<div align="right">
							<button type="button" onclick="location.href='/observation_find'">목록으로</button>
						</div>
						<hr>
						<table class="table table-hover">
							<tr>
								<th>관측소명</th>
								<td colspan='3'><input type="text" name="observe_post" value="${observation.observe_post}"></td>
							</tr>
							<tr>
								<th>관측유형</th>
								<td><select name="observe_type">
									<c:forEach var="code" items="${CodeObserveType}">
										<c:if test="${observation.observe_method == code.cate_code}">
											<option value="${code.cate_code}" selected>${code.cate_name}</option>
										</c:if>
										<c:if test="${observation.observe_method != code.cate_code}">
											<option value="${code.cate_code}">${code.cate_name}</option>
										</c:if>
									</c:forEach>
								</select></td>
								<th>표준코드</th>
								<td><select name="river_code">
									<c:forEach var="river" items="${categoryList}">
										<c:if test="${observation.river_code == river.river_code}">
											<option value="${river.river_code}" selected>${river.river_code}</option>
										</c:if>
										<c:if test="${observation.river_code != river.river_code}">
											<option value="${river.river_code}">${river.river_code}</option>
										</c:if>
									</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th>위도</th>
								<td><input type="text" name="latitude" value="${observation.latitude}"></td>
								<th>경도</th>
								<td><input type="text" name="longitude" value="${observation.longitude}"></td>
							</tr>
							<tr>
								<th>관측방식</th>
								<td><select name="observe_method">
									<c:forEach var="code" items="${CodeObserveMethod}">
										<c:if test="${observation.observe_method == code.cate_code}">
											<option value="${code.cate_code}" selected>${code.cate_name}</option>
										</c:if>
										<c:if test="${observation.observe_method != code.cate_code}">
											<option value="${code.cate_code}">${code.cate_name}</option>
										</c:if>
									</c:forEach>
								</select></td>

								<th>운영기관</th>
								<td><select name="org_code">
									<c:forEach var="org" items="${OrgList}">
										<c:if test="${observation.org_code == org.org_code}">
											<option value="${org.org_code}" selected>${org.org_name}</option>
										</c:if>
										<c:if test="${observation.org_code != org.org_code}">
											<option value="${org.org_code}">${org.org_name}</option>
										</c:if>
										<input type="hidden" name="org_area" value="${org.org_area}">
									</c:forEach>
								</select></td>
							</tr>
						</table>
						<div align="center">
							<button type="submit">수정완료</button>
						</div>
					</form>
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