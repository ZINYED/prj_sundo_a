<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수자원 목록</title>
	<style>

	  header {
		  height: 55px;
	  }


		table {
			border-collapse: collapse;
			width: 100%;
		}
		th, td {
			border: 1px solid #ddd;
			padding: 8px;
			text-align: left;
		}
		th {
			background-color: #f2f2f2;
		}
	</style>

	<script>
		// 페이지 로드 시 자동으로 데이터를 받아오는 함수 호출
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

		// 데이터를 받아오는 함수
		function fetchData() {
			// Ajax를 이용하여 서버로 데이터 요청
			$.ajax({
				url: '/waterResourcesListA', // 비동기 데이터를 처리할 서블릿이나 JSP 페이지의 경로
				type: 'GET',
				dataType: 'json', // 받아올 데이터 타입 (JSON 형식으로 받아오는 경우)
				contentType : "application/json; charset=utf-8",
				success: function(data) {
					displayData(data.waterResourcesList);
				},
				error: function() {
					// 데이터를 받아오지 못했을 때 처리
					alert("에러");
					$('#result').text('데이터를 가져오는데 실패했습니다.');
				}
			});
		}

		function displayData(data) {
			var tableBody = $('#facilityTable tbody');
			// 기존에 표시되어 있는 데이터 삭제
			tableBody.empty();
			// 데이터를 테이블에 추가
			$.each(data, function(index, waterResources) {
				console.log(waterResources.rn);
				var row = '<tr>' +
						'<td>' + waterResources.rn + '</td>' +
						'<td><a href="waterResourcesListDetail?facility_code=' + waterResources.facility_code + '">' + waterResources.facility_code + '</a></td>'+
						'<td>' + waterResources.facility_category + '</td>' +
						'<td>' + waterResources.cate_name + '</td>' +
						'<td>' + waterResources.org_area_name + '</td>' +
						'<td>' + waterResources.org_name + '</td>' +
						'</tr>';
				tableBody.append(row)
			})

		}

		function Listsearch() {
			var facilityCategory = $("select[name='facility_category']").val();
			var orgCode = $("select[name='org_code']").val();
			var orgArea = $("select[name='org_area']").val();
			var keywordFacilityCode = $("input[name='keyword_facility_code']").val();

			// 입력값을 JSON 형식으로 구성
			var lkh_waterResources = {
				facility_category: facilityCategory,
				org_code: orgCode,
				org_area: orgArea,
				keyword_facility_code: keywordFacilityCode
			};

			$.ajax({
				type: "GET", // 여전히 GET 메서드 사용
				url: "/waterResourcesListA",
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				data: lkh_waterResources, // 객체 직접 전달
				success: function(data) {
					displayData(data.waterResourcesList);
				},
				error: function(error) {
					alert("Error: " + error.responseText);
				}
			});
		}
	</script>
</head>
<body>
    <header id="header">
	</header>

	<div class="container">
			<div class="row">
				<div id="center">
					<h2><a href="/waterResourcesList">정보</a> | <a href="/waterResourceStatistics">통계</a></h2>
					시설물종류
					<select name="facility_category"> <!-- 여기서 "selectBoxName"은 적절한 이름으로 변경하세요. -->
						<c:forEach var="resource" items="${findfacility_category}">
							<option value="${resource.facility_category}">${resource.facility_category}</option>
						</c:forEach>
					</select>

					관리기간
					<select name="org_code"> <!-- 여기서 "selectBoxName"은 적절한 이름으로 변경하세요. -->
						<c:forEach var="organization" items="${organization_category}">
							<option value="${organization.org_code}">${organization.org_name}</option>
						</c:forEach>
					</select>

					행정구역
					<select name="org_area"> <!-- 여기서 "selectBoxName"은 적절한 이름으로 변경하세요. -->
						<c:forEach var="org_area" items="${orgArea_category}">
							<option value="${org_area.org_area}">${org_area.org_area_name}</option>
						</c:forEach>
					</select>

					시설물코드 <input type="text" name="keyword_facility_code"> <button ONCLICK="Listsearch()">검색</button>


					<br>
					<button type="button" class="btn btn-sm btn-primary"  onclick="location.href='/waterResourcesInsertForm' ">등록</button>
					<button type="button"  class="btn btn-sm btn-secondary " onclick="location.href='/waterResourcesInsertForm' ">저장</button>



					<table id="facilityTable">
						<thead>
						<tr>
							<th>연번</th>
							<th>시설물 종류</th>
							<th>시설물코드</th>
							<th>시설물유형</th>
							<th>행정구역</th>
							<th>관리기관</th>
							<!-- 추가 필요한 컬럼들을 여기에 추가 -->
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${waterResourcesList}" var="waterResource">
							<tr>
								<td>${waterResource.rn}</td>
								<td>${waterResource.facility_category}</td>
								<td><a href="waterResourcesListDetail?facility_code=${waterResource.facility_code}">${waterResource.facility_code}</a></td>
								<td>${waterResource.cate_name}</td>
								<td>${waterResource.org_area_name}</td>
								<td>${waterResource.org_name}</td>
							</tr>
						</c:forEach>

						</tbody>
					</table>

					<div id="paging" class="pagination justify-content-center">
						<c:if test="${page.startPage > page.pageBlock}">
							<div onclick="location.href='/waterResourcesList?currentPage=${page.startPage - page.pageBlock}'">
								<p>[이전]</p>
							</div>
						</c:if>
						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							<div class="page-item" onclick="location.href='/waterResourcesList?currentPage=${i}'">
								<div class="page-link" style="cursor:pointer">${i}</div>
							</div>
						</c:forEach>
						<c:if test="${page.endPage <= page.pageBlock}">
							<div onclick="location.href='/waterResourcesList?currentPage=${page.startPage + page.pageBlock}'">
								<p>[다음]</p>
							</div>
						</c:if>
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