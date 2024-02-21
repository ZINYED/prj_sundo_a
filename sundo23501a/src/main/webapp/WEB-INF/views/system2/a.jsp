<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    </head>

    <body>
        관측소 통계


        <form>
            <label for="datepicker">조회기간</label>
            <input type="date" id="datepicker" name="datepicker">
            <input type="submit" value="제출">
        </form>

    </body>

</html>