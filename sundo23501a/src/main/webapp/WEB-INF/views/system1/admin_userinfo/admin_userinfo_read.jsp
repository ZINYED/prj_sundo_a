<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--CSS START -->
<style>

.prjlistbox {
	--bs-alert-color: var(--bs-primary-text-emphasis);
    --bs-alert-bg: var(--bs-primary-bg-subtle);
    
    --bs-alert-padding-x: 1rem;
    --bs-alert-padding-y: 1rem;
    --bs-alert-margin-bottom: 1rem;
    --bs-alert-border-color: transparent;
    --bs-alert-border: var(--bs-border-width) solid var(--bs-alert-border-color);
    --bs-alert-border-radius: var(--bs-border-radius);
    --bs-alert-link-color: inherit;
    position: relative;
    padding: var(--bs-alert-padding-y) var(--bs-alert-padding-x);
    margin-bottom: var(--bs-alert-margin-bottom);
    color: var(--bs-alert-color);
    background-color: var(--bs-alert-bg);
    border: var(--bs-alert-border);
    border-radius: var(--bs-alert-border-radius);
}
</style>
<!-- CSS END -->

<!-- JS START -->
<script type="text/javascript" src="/js/board.js"></script>
<!-- JS END -->

</head>
<body>
<!-- CONTENT -->
<!------------------------------ //개발자 소스 입력 START ------------------------------->
	<div class="container-fluid">
		<div id="idDocTitle" style="height:34px">
			<span class="apptitle">문서 조회</span>
		</div>
		<table width="100%" style="margin-top:10px;">
			<tr>
				<td style="text-align:right">
					<c:if test="${(userInfo.user_id eq board.user_id) or (userInfo.user_id eq 'admin')}">
						<button type="button" class="btn btn-dark btn-sm" onclick="callAction('edit','admin_userinfo_edit?user_id=${board.user_id}')">수정</button>
						<button type="button" class="btn btn-dark btn-sm" onclick="callAction('delete','admin_userinfo_delete?user_id=${board.user_id}')">삭제</button>
					</c:if>
					<button type="button" class="btn btn-dark btn-sm" onclick="closeDoc()">닫기</button>
				</td>
			</tr>
		</table>						
		<table class="table" width="100%" style="margin-top:7px">
			<colgroup>
				<col width="20%"></col>
				<col width="80%"></col>
			</colgroup>
			<tr> 
				<th>권한</th>
				<td>${board.system_name}</td>
			</tr>
			<tr> 
				<th>작성자</th>
				<td>${board.user_name}</td>
			</tr>
			<tr> 
				<th>아이디</th>
				<td>${board.user_id}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${board.user_tel}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${board.user_email}</td>
			</tr>
			<tr>
				<th>기관정보</th>
				<td>${board.org_name}</td>
			</tr>
			<tr>
				<th>소속부서</th>
				<td>${board.user_department}</td>
			</tr>
			<tr>
				<th>직급</th>
				<td>${board.user_position}</td>
			</tr>
			<tr>
				<th>사용여부</th>
				<td>${board.use_flag}</td>
			</tr>
			<tr>
				<th>등록일시</th>
				<td><fmt:formatDate value="${board.create_datetime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
			<tr>
				<th>수정일시</th>
				<td><fmt:formatDate value="${board.modify_datetime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
		</table>
	</div>
<!------------------------------ //개발자 소스 입력 END ------------------------------->
</body>
</html>