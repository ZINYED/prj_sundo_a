<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	var system_category = "${userInfo.system_category}";
	if(system_category == '1') {
		location.href = '/adminpage_main';
	}else if(system_category == '2') {
		location.href = '/realTimeSystem/layer';
	}else if(system_category == '3') {
		location.href = '/water_resourcesList';
	}else{
		location.href = '/user_login';
	}
});
</script>
</head>
<body>
</body>
</html>