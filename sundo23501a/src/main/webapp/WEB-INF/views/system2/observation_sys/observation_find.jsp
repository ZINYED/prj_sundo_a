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
			<form action="/observation_create" method="get">
				<input type="hidden" name="observe_code" value="${observation.observe_code}">
				<input type="hidden" name="river_code" value="${observation.river_code}">

				<div style="margin: 30px">
					<h2>관측소 목록</h2>
				</div>
				<div>
			<span class="border border-secondary border-2" style="padding:20px; margin:30px" >
				<th>관측방식</th>
				<td><select id="observe_method" >
					<option value="all" selected>전체</option>
						<c:forEach var="code" items="${CodeObserveMethod}">
							<option value="${code.cate_code}">${code.cate_name}</option>
						</c:forEach>
					</select></td>
				<th>운영기관</th>
				<td><select id="org_name">
					<option value="all" selected>전체</option>
						<c:forEach var="org" items="${OrgList}">
							<option value="${org.org_code}">${org.org_name}</option>
						</c:forEach>
					</select></td>
				<th>행정구역</th>
				<td><select id="org_area">
					<option value="all" selected>전체</option>
						<c:forEach var="org" items="${categoryList}">
							<option value="${org.org_area}">${org.org_area}</option>
						</c:forEach>
					</select></td>

				<th>관측소명</th><input type="text">
				<button onclick="ob_search()">검색</button>
			</span>
				</div>
				<div align="right" style="margin-top: 20px; margin:30px">
					<button type="submit">등록</button>
					<button onclick="ob_save()">저장</button>
				</div>
				<div style="margin:30px">
					<hr>
					<table  class="table table-hover">
						<colgroup>
							<col width="5%"></col>
							<col width="20%"></col>
							<col width="10%"></col>
							<col width="10%"></col>
							<col width="10%"></col>
							<col width="10%"></col>
							<col width="10%"></col>
							<col width="10%"></col>
						</colgroup>
						<tr>
							<th>연번</th>
							<th>관측소명</th>
							<th>표준코드</th>
							<th>위도(dd)</th>
							<th>경도(dd)</th>
							<th>관측방식</th>
							<th>운영기관</th>
							<th>조회</th>
						</tr>
						<c:forEach var="Observation" items="${observationList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td onclick="location.href='/observation_detail?observe_code=${Observation.observe_code}'">${Observation.observe_post}</td>
								<td>${Observation.river_code} </td>
								<td>${Observation.latitude}</td>
								<td>${Observation.longitude}</td>
								<td>${Observation.observe_method_name}</td>
								<td>${Observation.org_name}</td>
								<td onclick="location.href='/time_find?river_code=${Observation.river_code}'"><img src="/images/egovframework/cmmn/search.svg"></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</form>


			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">

					<c:if test="${page.startPage > page.pageBlock }">
						<li class="page-item"><a class="page-link" href="observation_find?currentPage=${page.startPage - page.pageBlock }" tabindex="-1" aria-disabled="true">이전</a></li>
					</c:if>

					<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
						<c:choose>
							<c:when test="${page.currentPage==i}"><li class="page-item active"></c:when>
							<c:otherwise><li class="page-item"></c:otherwise>
						</c:choose>
						<a class="page-link" href="observation_find?currentPage=${i}">${i}</a></li>
					</c:forEach>

					<c:if test="${page.endPage < page.totalPage }">
						<li class="page-item"><a class="page-link" href="observation_find?currentPage=${page.startPage + page.pageBlock }')">다음</a></li>
					</c:if>
				</ul>
			</nav>

		</div>
	</div>
</div>
<footer class="footer py-2">
	<div id="footer" class="container">
	</div>
</footer>

</body>
</html>