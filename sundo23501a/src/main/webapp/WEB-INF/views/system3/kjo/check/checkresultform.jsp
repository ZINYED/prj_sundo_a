<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript"
            src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- COMMON END -->
    <style type="text/css">
        header {
            height: 55px;
        }

        container{
            width: 80%;
        }
        ul{
            padding: 0;
        }
        li{
            list-style: none;
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

        // 저장 버튼 클릭 시
        function btnclick() {
            console.log("안녕하세요");

            let dep = $("#user_department").val();
            let pos = $("#user_position").val();
            let una = $("#user_name").val();
            let facility_code = $("#facility_code").val();
            let check_date = $("#check_date").val();
            let weather = $("#weather").val();
            let check_result = $("#check_result").val();
            let spec_memo = $("#spec_memo").val();




            var selects = $(".check_grade");
            var notes = $(".note");
            let check_grade="";    //  평가등급
            let note="";           //  비고

            // 선택된 check_grade의 <select> 엘리먼트들을 순회하면서 값을 가져옴
            selects.each(function(index, element) {
                check_grade+=$(element).val()+"|";
                // console.log("selects " + (index + 1) + ": " + check_grade);
                // 가져온 값을 사용하거나 필요에 맞게 처리
            });
            // 선택된 note의 <input> 엘리먼트들을 순회하면서 값을 가져옴
            notes.each(function(index, element) {
                note+=$(element).val()+"|";
                // console.log("notes " + (index + 1) + ": " + note);
                // 가져온 값을 사용하거나 필요에 맞게 처리
            });

            // note = note.slice(0, -1);
            // check_grade = check_grade.slice(0, -1);
            //
            // note = note.split('|');
            // check_grade = check_grade.split('|');


            console.log("check_grade");
            console.log(check_grade);
            console.log("note");
            console.log(note);


            const cr = {
                "facility_code": facility_code,
                "check_date":check_date,
                "weather":weather,

                "user_name":una,
                "user_position":pos,
                "user_department": dep,

                "check_result":check_result,
                "spec_memo":spec_memo,

                "check_grade":check_grade,

                "note":note
            };

            $.ajax({
                type: "POST",
                url: "checkresultSave",
                data: cr,
                dataType: 'json',
                success: function (response) {
                    // 서버 응답에 대한 로직
                    console.log(response);
                    let url = "/water_resourcesList";
                    location.replace(url);

                },
                error: function (error) {
                    alert("값을 정확히 입력하세요");
                    console.log(error);
                }
            });
        }


    </script>
</head>
<body>


    <header id="header"></header>


    <div class="container" style="margin-top: 3%">
        <div class="row">
            <div id="center">

                <table class="table">
                    <tr>
                        <td>시설물코드</td>
                        <input type="hidden" id="facility_code" value="${WaterResources.facility_code}">
                        <td>${WaterResources.facility_code}</td>
                        <td>시설물</td>
                        <td id="facility_category">${WaterResources.facility_category }</td>
                        <td>유형</td>
                        <td id="cate_name">${WaterResources.cate_name }</td>
                    </tr>
                    <tr class="table">
                        <td>점검일자:</td>
                        <td><input type="date" name="check_date" id="check_date"></td>

                        <td>기상상황:</td>
                        <td><select class="form-select" id="weather" name="weather">
                            <option value="맑음">맑음</option>
                            <option value="흐림">흐림</option>
                            <option value="비">비</option>
                        </select></td>
                        <td>점검자 소속:</td>
                        <td><input class="form-control" type="text" name="user_department" id="user_department">
                        </td>
                        <td>직급:</td>
                        <td><input class="form-control" type="text" name="user_position" id="user_position">
                        </td>
                        <td>이름:</td>
                        <td><input class="form-control" type="text" name="user_name" id="user_name">
                        </td>

                    </tr>
                    <tr>
                        <th>점검위치</th>
                        <th>점검 항목</th>
                        <th>평가 점수</th>
                        <th>비고</th>
                    </tr>

                    <tr>
                        <td>마루</td>
                        <td>
                            <ul>
                                <li>균열 및 단차</li>
                                <li>수축이음부의 열림</li>
                                <li>기타사항</li>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <li><select class="check_grade form-select" id="check_grade1">
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                                <li><select class="check_grade form-select" id="check_grade2">
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                                <li><select class="check_grade form-select" id="check_grade3">
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <li><input class="note form-control" id="note1" type="text" name="input1"></li>
                                <li><input class="note form-control" id="note2" type="text" name="input2"></li>
                                <li><input class="note form-control" id="note3" type="text" name="input3"></li>
                            </ul>
                        </td>
                    </tr>

                    <tr>
                        <td>상류면</td>
                        <td>
                            <ul>
                                <li>수축이음부의 열림</li>
                                <li>균열</li>
                                <li>박락</li>
                                <li>기타사항</li>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <li><select class="check_grade form-select" id=check_grade4>
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                                <li><select class="check_grade form-select" id=check_grade5>
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                                <li><select class="check_grade form-select" id=check_grade6>
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                                <li><select class="check_grade form-select" id=check_grade7>
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <li><input class="note form-control" id="note4" type="text" name="input1"></li>
                                <li><input class="note form-control" id="note5" type="text" name="input2"></li>
                                <li><input class="note form-control" id="note6" type="text" name="input3"></li>
                                <li><input class="note form-control" id="note7" type="text" name="input3"></li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>하류면</td>
                        <td>
                            <ul>
                                <li>균열 및 단차</li>
                                <li>수축 및 수평시공이음부를 통한 누수</li>
                                <li>균열 및 박락</li>
                                <li>기타사항</li>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <li><select class="check_grade form-select" id=check_grade8>
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                                <li><select class="check_grade form-select" id=check_grade9>
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                                <li><select class="check_grade form-select" id=check_grade10>
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                                <li><select class="check_grade form-select" id=check_grade11>
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <li><input class="note form-control" id="note8" type="text" name="input2"></li>
                                <li><input class="note form-control" id="note9" type="text" name="input3"></li>
                                <li><input class="note form-control" id="note10" type="text" name="input4"></li>
                                <li><input class="note form-control" id="note11" type="text" name="input4"></li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>검사량</td>
                        <td>
                            <ul>
                                <li>횡방향 검사량에서의 균열</li>
                                <li>상류 종방향 검사량에서의 균열</li>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <li><select class="check_grade form-select" id=check_grade12>
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                                <li><select class="check_grade form-select" id=check_grade13>
                                    <option value="a">a</option>
                                    <option value="b">b</option>
                                    <option value="c">c</option>
                                </select></li>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <li><input class="note form-control" id="note12" type="text" name="input1"></li>
                                <li><input class="note form-control" id="note13" type="text" name="input2"></li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>점검결과:</td>

                        <td>
                            <select class="form-select" id="check_result" name="check_result">
                                <option value="보수필요">보수필요</option>
                                <option value="양호">양호</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>특이사항:</td>
                        <td><input class="form-control" id="spec_memo" type="text"></td>
                    </tr>
                    <tr>
                        <td>점검일지:파일임</td>
                        <td><input type="text"></td>
                    </tr>
                </table>
                <input type="button" value="목록">
                <input type="button" value="삭제">
                <input type="button" value="초기화">
                <input type="button" value="저장" id="saveButton" onclick="btnclick()">

            </div>
        </div>
    </div>

    <footer class="footer py-2">
        <div id="footer" class="container">
        </div>
    </footer>

</body>
</html>