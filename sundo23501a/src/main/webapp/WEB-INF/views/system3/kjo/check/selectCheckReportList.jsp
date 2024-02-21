<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <style>
        /* 추가 스타일링을 위한 CSS */
        tr:hover {
            background-color: #f5f5f5;
            cursor: pointer;
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


        $(function (){
            var trElements = document.querySelectorAll('.cont');

            console.log(trElements.length);
            trElements.forEach(function (trElement) {
                console.log("fdsfds");
                trElement.addEventListener('dblclick', function () {
                    // 더블클릭할 때 수행할 동작을 여기에 추가합니다.
                    console.log("fds");

                    var doc_no = trElement.getAttribute('data-doc-no');
                    // getcheckresultform
                });
            });


        })

        function searchCheckReportList(currentPage) {
            let facility_category = $("#facility_category_List").val();
            let org_area_name = $("#org_area_List").val();  //  행정기관
            let org_name = $("#org_name_List").val();       //  관리기관
            let user_department = $("#user_department").val();      //  소속
            let firstdate = $("#find_date1").val();
            let secdate = $("#find_date2").val();
            let cate_name = $("#cate_name").val();
            let facility_code = $("#facility_code").val();
            let research = $("#research").val();

            const cr = {
                facility_category : $("#facility_category_List").val(),
                org_area_name : $("#org_area_List").val(),  //  행정기관
                org_name : $("#org_name_List").val(),       //  관리기관
                user_department : $("#user_department").val(),      //  소속
                firstdate : $("#find_date1").val(),
                secdate : $("#find_date2").val(),
                cate_name : $("#cate_name").val(),
                facility_code : $("#facility_code").val(),
                research : $("#research").val()
            }
            console.log(cr);
            $.ajax({
                url: "/getcheckresultform",
                data: cr,

                success(data) {
                    let table_body = $("#table_body");

                    console.log("data");
                    console.log(data);
                    const page = JSON.parse(data.Obj);
                    console.log("page");
                    console.log(page);
                    const CRList = JSON.parse(data.ObjList);
                    console.log("CRList");
                    console.log(CRList);

                }
            })

        }


    </script>
</head>
<body>

    <header id="header"></header>




    <div class="container" style="margin-top: 3%">
        <div class="row">
            <div id="center">
                <form action="" id="">
                    <table>
                        <tr>
                            <td>시설물 종류:</td>
                            <td>
                                <select class="form-select" id="facility_category_List">
                                    <c:forEach items="${wrctgList}" var="list">
                                        <option name="facility_category"
                                                value="${list.facility_category}">${list.facility_category}</option>
                                    </c:forEach>
                                    <option name="facility_category"
                                            value="전체" selected>전체
                                    </option>
                                </select></td>
                            <td>행정구역:</td>
                            <td>
                                <select class="form-select" id="org_area_List">
                                    <c:forEach items="${orgList}" var="list">
                                        <option name="org_area" value="${list.org_area}">${list.org_area_name}</option>
                                    </c:forEach>
                                    <option name="org_area"
                                            value="전체" selected>전체
                                    </option>
                                </select>
                            </td>
                            <td>관리기관:</td>

                            <td>
                                <select class="form-select" id="org_name_List">
                                    <c:forEach items="${organizationList}" var="list">
                                        <option name="org_name" value="${list.org_name}">${list.org_name}</option>
                                    </c:forEach>
                                    <option name="org_name"
                                            value="전체" selected>전체
                                    </option>
                                </select>
                            </td>
                            <td>점검자 소속:</td>
                            <td><input type="text" id="user_department"></td>

                        </tr>
                        <tr>
                            <td>조회기간:</td>
                            <td><input type="date" name="find_date1" id="find_date1"></td>
                            <td>~</td>
                            <td><input type="date" name="find_date2" id="find_date2"></td>

                            <td>시설물 명칭:</td>
                            <td><input type="text" name="cate_name" id="cate_name"></td>
                            <td>시설물 코드:</td>
                            <td><input type="text" name="facility_code" id="facility_code"></td>

                            <td><input type="button" onclick="searchCheckReportList()" value="조회"></td>
                            <td><input type="checkbox" id="research">결과 내 재검색</td>

                        </tr>
                    </table>
                </form>
                <table>
                    <tr>
                        <th>연번</th>
                        <th>시설물 종류</th>
                        <th>시설물 코드</th>
                        <th>행정구역</th>
                        <th>관리기관</th>
                        <th>최종점검일</th>
                        <th>최종점검결과</th>
                        <th>점검자</th>
                    </tr>

                    <tbody id="table_body">
                    <c:forEach items="${crList}" var="CheckReport" varStatus="loop">
                        <tr class="cont" data-doc-no="${CheckReport.doc_no}">
                            <td>${CheckReport.rn}</td>
                            <td>${CheckReport.facility_category}</td>
                            <td>${CheckReport.facility_code}</td>
                            <td>${CheckReport.org_area_name}</td>
                            <td>${CheckReport.org_name}</td>
                            <td>${CheckReport.modify_datetime}</td>
                            <td>${CheckReport.check_result}</td>
                            <td>${CheckReport.user_name}</td>
                        </tr>
                    </c:forEach>

                    </tbody>

                </table>

                <div id="paging" class="pagination justify-content-center">
                    <c:if test="${page.startPage > page.pageBlock}">
                        <div class="page-link" onclick="searchCheckReportList(${page.startPage - page.pageBlock})">
                            이전
                        </div>
                    </c:if>
                    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
                        <div class="page-item" onclick="searchCheckReportList(${i})">
                            <div class="page-link" style="cursor:pointer">${i}</div>
                        </div>
                    </c:forEach>
                    <c:if test="${page.endPage <= page.pageBlock}">
                        <div class="page-link" onclick="searchCheckReportList(${page.startPage + page.pageBlock})">
                            다음
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
