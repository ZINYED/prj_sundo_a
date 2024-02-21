<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--CSS START -->
<!-- CSS END -->

<!-- JS START -->
<script type="text/javascript" src="/js/board.js"></script>
<!-- JS END -->

<script type="text/javascript">
$(function() {
	$('#idUseFlag').click(function(){
		var checked = $(this).is(':checked');
		if(checked) {
			$(this).val("Y");
			$('input[name=use_flag]').val("Y");
		}else {
			$(this).val("N");
			$('input[name=use_flag]').val("N");
		}
	});

	var USE_FLAG = "${board.use_flag}";
	if(USE_FLAG == 'N') {
		$('#idUseFlag').prop('checked', false);
	}else{
		$('#idUseFlag').prop('checked', true);
	}
	
});

</script>
</head>
<body>
<!-- CONTENT -->
			<!------------------------------ //개발자 소스 입력 START ------------------------------->
			<div class="container-fluid">
					<form name="formUserInfo" action="admin_userinfo_update" method="post">
						<input type="hidden" class="form-control" name="user_pw" value="${board.user_pw}" readonly>
						<div style="height:34px">
							<span class="apptitle">문서 수정</span>
						</div>
						<table width="100%" style="margin-top:7px">
							<tr>
								<td style="text-align:right">
									<button type="submit" class="btn btn-dark btn-sm">저장</button>
									<button type="button" class="btn btn-dark btn-sm" onclick="closeDoc()">닫기</button>
								</td>
							</tr>
						</table>
						<table class="table" width="100%">
							<colgroup>
								<col width="20%"></col>
								<col width="80%"></col>
							</colgroup>
							<tr>
								<th>권한</th>
								<td>
				        			<select name="system_category"  class="form-select">
				        				<c:forEach var="code" items="${CodeList_system_category}" varStatus="status">
											<option value="${code.cate_code}" 
											<c:if test="${status.count == board.system_category}">selected</c:if>
											>${code.cate_name}</option>				        				
				        				</c:forEach>
				        			</select>
								</td>
							</tr>	
							<tr> 
								<th>작성자</th>
								<td><input type="text" class="form-control" name="user_name" required="required" value="${board.user_name}"></td>
							</tr>
							<tr> 
								<th>아이디</th>
								<td><input type="text" class="form-control" name="user_id" value="${board.user_id}" readonly></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" class="form-control" name="user_tel" required="required" value="${board.user_tel}"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" class="form-control" name="user_email" required="required" value="${board.user_email}"></td>
							</tr>
							<tr>
								<th>기관정보</th>
								<td>
									<select name="org_code" class="form-select" >
										<c:forEach var="org" items="${orgList}">
											<option value="${org.org_code}">${org.org_name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>소속부서</th>
								<td><input type="text" class="form-control" name="user_department" required="required" value="${board.user_department}"></td>
							</tr>
							<tr>
								<th>직급</th>
								<td><input type="text" class="form-control" name="user_position" required="required" value="${board.user_position}"></td>
							</tr>
							<tr>
								<th>사용여부</th>
								<td><input type="hidden" name="use_flag" value="${board.use_flag}">
									<div class="form-check form-switch">
										<input class="form-check-input" type="checkbox" role="switch" id="idUseFlag" checked="" value="${board.use_flag}">
									</div>
								</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td><input type="text" class="form-control" name="create_datetime" value="<fmt:formatDate value="${board.create_datetime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" readonly></td>
							</tr>
							<tr>
								<th>수정일</th>
								<td><input type="text" class="form-control" name="modify_datetime" value="<fmt:formatDate value="${board.modify_datetime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" readonly></td>
							</tr>
						</table>
					</form>
			</div>
	  		<!------------------------------ //개발자 소스 입력 END ------------------------------->
</body>
</html>