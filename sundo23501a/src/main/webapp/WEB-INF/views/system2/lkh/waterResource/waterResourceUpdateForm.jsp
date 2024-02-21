<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body>

    <header id="header"></header>

    <div class="container">
        <div class="row">
            <div id="center">
                <div style="margin-top: 5%; border: solid 1px black; padding: 3%" >
                    <form action ="waterResourcesUpdate" method="post">
                        <p>
                            시설물 코드 <input type="text"   value="${waterResources.facility_code}" name="facility_code">

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

                            <%--<select name="org_areaa" >
                                <c:forEach var="resources" items="${waterResources}">
                                    <c:set var="isSelected" value=""/>
                                    <c:forEach var="orgArea" items="${orgArea_category}">
                                        <c:if test="${resources.org_area eq orgArea.org_area}">
                                            <c:set var="isSelected" value="selected"/>
                                        </c:if>
                                    </c:forEach>
                                    <option value="${resources.org_area}" ${isSelected}>${resources.org_area_name}</option>
                                </c:forEach>
                            </select>

                --%>
                        </p>
                        <p>
                            시설물종류
                            <select id="facility_category" name="facility_category"> <!-- 여기서 "selectBoxName"은 적절한 이름으로 변경하세요. -->
                                <c:forEach var="resource" items="${findfacility_category}">
                                    <option value="${resource.facility_category}">${resource.facility_category}</option>
                                </c:forEach>
                            </select>

                            시설물유형
                            <select id="facility_type" name="facility_type">
                                <c:forEach var="code" items="${codeList}">
                                    <option value="${code.cate_code}">${code.cate_name}</option>
                                </c:forEach>
                            </select>
                        </p>

                        <p>
                            위도		 <input type="text"  value="${waterResources.latitude}" name="latitude">
                            경도		 <input type="text" value="${waterResources.longitude}" name="longitude">
                            주소		 <input type="text" value="${waterResources.facility_addr}" name="facility_addr">
                        </p>

                        <button type="submit">수정하기</button>
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