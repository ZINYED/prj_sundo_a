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
	
	select, input, textarea {
		width: 100%;
	}
	
	.btns {
		text-align: right;
		margin-top: 20px;
	}
	
	.buttons {
		width: 80px;
	}
	
	.actionRead {
		width: 130px;
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
	function goBack(){
		location.href="/action_report_list";
	}
	
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
					<p class="title">조치 결과 보고서 작성</p>
					<form action="action_report_write" method="post">
						<table>
							<thead>
							<tr>
								<th>시설물 종류</th>
								<td>
									<select id="waterCategorySelect" name="facility_category">
										<option>전체</option>
										<c:forEach var="water" items="${waterCategory }">
											<option value="${water.facility_category }">${water.facility_category }</option>
										</c:forEach>
									</select>
								</td>
								<th>시설물 코드</th>
								<td>
									<div id="wrCodeOption">
										<select id="wrCodeSelect" name="facility_code">
											<option>전체</option>
										</select>
									</div>
								</td>
								<th>작성자</th><td><input type="text" name="user_id"></td>	<!-- 로그인한 사용자 이름 자동 표출 필요 -->
							</tr>

							<tr>
								<th>점검대상</th>
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
								<th>중분류</th>
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
								<th>소분류</th>
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
							<tr>
								<th>고장/발생 일자</th><td colspan="2"><input type="date" name="break_date"></td>
								<th>조치/복구 일자</th><td colspan="2"><input type="date" name="action_date"></td>
							</tr>
							<tr><th>고장내역</th><td colspan="5"><textarea name="break_content"></textarea></td></tr>
							<tr><th>조치내역</th><td colspan="5"><textarea name="action_content"></textarea></td></tr>
							<tr><th>특이사항</th><td colspan="5"><textarea name="spec_memo"></textarea></td></tr>
							<tr><th>향후계획</th><td colspan="5"><textarea name="future_plan"></textarea></td></tr>
							<tr><th>파일첨부</th><td colspan="5"></td></tr>
							</tbody>
						</table>
						<div class="btns">
							<input type="button" class="btn btn-dark btn-sm buttons" onclick="goBack()" value="돌아가기"/>
							<input type="button" class="btn btn-dark btn-sm actionRead" value="고장보고서 보기">
							<input type="submit" class="btn btn-dark btn-sm buttons" value="저장">
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