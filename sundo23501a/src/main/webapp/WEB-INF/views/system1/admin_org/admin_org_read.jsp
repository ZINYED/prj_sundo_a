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
						<button type="button" class="btn btn-dark btn-sm" onclick="callAction('edit','admin_notice_edit?doc_no=${board.doc_no}')">수정</button>
						<button type="button" class="btn btn-dark btn-sm" onclick="callAction('delete','admin_notice_delete?doc_no=${board.doc_no}&attach_path=${board.attach_path}')">삭제</button>
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
				<th>작성자</th>
				<td>
					${board.user_name}
				</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${board.create_date}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${board.subject}</td>
			</tr>
			<c:if test="${board.attach_path ne null}">
				<tr>
					<th>파일첨부</th>
					<td><a href="javascript:popup('/upload/${board.attach_path}',800,600)">${board.attach_name}</a></td>
				</tr>
			</c:if>
			<tr>
				<th>조회수</th>
				<td>${board.bd_count}</td>
			</tr>
			<tr>
				<th>본문</th>
				<td></td>
			</tr>
			<tr>	
				<td colspan="2" class="pms-body">${board.body}</td>
			</tr>
		</table>
	</div>
<!------------------------------ //개발자 소스 입력 END ------------------------------->
</body>
</html>