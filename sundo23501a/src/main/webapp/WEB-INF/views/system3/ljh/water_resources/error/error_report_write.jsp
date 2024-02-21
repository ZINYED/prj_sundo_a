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
	
	th {
		background: #EAEAEA;
		padding: 5px 10px;
	}
	
	td {
		padding: 5px 10px;
	}
	
	select {
		width: 100%;
	}
	
	.btns {
		text-align: right;
		margin-top: 20px;
	}
	
	button {
		width: 80px;
	}
	
	.cate {
		width: 200px;
	}
	
	.rptTbl th {
		width: 200px;
	}

	.alarmTbl .cate {
		width: 200px;
	}

	header {
		height: 55px;
	}
</style>


<script type="text/javascript">

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

	$(function() {
		$('#waterCategorySelect').change(function() {
			var category = $(this).val();
			var sendurl = 'get_facility_code?facility_category=' + category;
			
			$.ajax({
				url		: sendurl,
				dataType: 'json',
				success : function(rtndata) {
					console.log(rtndata);
					
					var wrCodeOption = $('#wrCodeOption');
					var options = "";
					
					options += '<select id="wrCodeSelect" name="facility_code">';
					options += '<option>전체</option>';
					
					for(var i = 0; i < rtndata.length; i++) {
						options += '<option value="' + rtndata[i].facility_code + '">' + rtndata[i].facility_code + '</option>';
					}
					
					options += '</select>';

					wrCodeOption.empty();
					wrCodeOption.append(options);
					
					$('#wrCodeSelect').change(function() {
						var wrCode = $(this).val();
						var sendurl = 'get_alarm?facility_code=' + wrCode;
						
						$.ajax({
							url		: sendurl,
							dataType: 'json',
							success	: function(rtndata) {
								console.log(rtndata);
								
								var alarmBox = $('#alarmBox');
								var alarms = "";
								
								alarms += '<tr><th rowspan="' + rtndata.length+1 + '">알람내역</th><th>알람코드</th><th>알람내용</th><th>알람일시</th><th>확인</th></tr>';
								
								for(var i = 0; i < rtndata.length; i++) {
									alarms += '<tr><td>' + rtndata[i].alarm_code + '</td>' 
											+ '<td>' + rtndata[i].alarm_content	+ '</td>'
											+ '<td>' + rtndata[i].alarm_date + '</td>'
											+ '<td><input type="checkbox" name="alarm_code" value="' + rtndata[i].alarm_code + '"></td></tr>';
								}
								
								alarmBox.empty();
								alarmBox.append(alarms);
							}
						});
					});
				}
			});
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
						<p class="title">고장 보고서 작성</p>
						<form action="error_report_write" method="post">
							<table class="rptTbl">
								<thead>
								<tr>
									<th class="cate">시설물 종류</th>
									<td>
										<select id="waterCategorySelect" name="facility_category">
											<option>전체</option>
											<c:forEach var="water" items="${waterCategory }">
												<option value="${water.facility_category }">${water.facility_category }</option>
											</c:forEach>
										</select>
									</td>
									<th class="cate">시설물 코드</th>
									<td>
										<div id="wrCodeOption">
											<select id="wrCodeSelect" name="facility_code">
												<option>전체</option>
											</select>
										</div>
									</td>
									<th class="cate">작성자</th><td><input type="text" name="user_id"></td>	<!-- 로그인한 사용자 이름 자동 표출 필요 -->
								</tr>
								<tr>
									<th class="cate">점검대상</th>
									<td>
										<select name="check_target">
											<option>전체</option>
											<c:forEach var="checkCode" items="${checkCodeList }">
												<c:if test="${checkCode.field_name == 'check_target' }">
													<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
									<th class="cate">중분류</th>
									<td>
										<select name="m_category">
											<option>전체</option>
											<c:forEach var="checkCode" items="${checkCodeList }">
												<c:if test="${checkCode.field_name == 'm_category' }">
													<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
									<th class="cate">소분류</th>
									<td>
										<select name="s_category">
											<option>전체</option>
											<c:forEach var="checkCode" items="${checkCodeList }">
												<c:if test="${checkCode.field_name == 's_category' }">
													<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
								</tr>
								</thead>
								<tbody>
								<tr><th class="cate">제목</th><td colspan="5"><input type="text" name="subject"></td></tr>
								<tr><th class="cate">고장일자</th><td colspan="5"><input type="date" name="break_date"></td></tr>
								<tr><th class="cate">고장원인</th><td colspan="5"><textarea name="break_cause"></textarea></td></tr>
								<tr><th class="cate">현재상황</th><td colspan="5"><textarea name="current_state"></textarea></td></tr>
								<tr><th class="cate">즉시처리</th><td colspan="5"><input type="checkbox" name="handling_flag" value="Y">
									<input type="text" name="handling_content"></td></tr>
								<tr><th class="cate">향후계획</th><td colspan="5"><textarea name="future_plan"></textarea></td></tr>
								<tr><th class="cate">파일첨부</th><td colspan="5"><!-- <input type="file" name="file1"> --></td></tr>
								</tbody>
							</table>
							<table class="alarmTbl">
								<tbody id="alarmBox">
								<tr>
									<th rowspan="50" class="cate">알람내역</th>
									<th>알람코드</th><th>알람내용</th><th>알람일시</th><th>확인</th>
								</tr>
								<tr>
									<td> </td><td> </td><td> </td><td><input type="checkbox"></td>
								</tr>
								</tbody>
							</table>
							<div class="btns">
								<button class="btn btn-dark btn-sm" onclick="location.href='/error_report_list'">돌아가기</button>
								<button type="submit" class="btn btn-dark btn-sm">저장</button>
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