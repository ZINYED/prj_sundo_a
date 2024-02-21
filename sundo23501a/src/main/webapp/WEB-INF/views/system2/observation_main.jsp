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
	
	$.ajax({
		url			: '/main_header_2',
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
<style type="text/css">
header {
    height: 75px;
}

</style>
</head>
<body>
<!-- HEADER -->
<header id="header"></header>
<!-- CONTENT -->
<div>
</div>
<!-- FOOTER -->
<footer class="footer py-2">
  <div id="footer" class="container">
  </div>
</footer>
</body>
</html>