<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		header {
			height: 55px;
		}
	</style>
<meta charset="UTF-8">
<title>수자원 등록 </title>
<script>
    // 셀렉트 박스 값이 변경될 때 이벤트 핸들러 등록
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

        $('#facility_category').change(function () {
            var divison = $(this).val();
            var di;
           if("댐" === divison){
        	   di="a";
           }else if("저수지"=== divison){
        	   di="b";
           }else if("펌프장"=== divison){
        	   di="c";
           }else if("관개수로"=== divison){
        	   di="d";
           }
           
           
            
       
            $.ajax({
                url			: '/facilityCategoryType',
                dataType 	: 'json',
                data		: {"divison":di},
                success		: function(codeList) {
              	
                var selectBox = $('#facility_type');

                   
                 selectBox.empty();
                  $.each(codeList, function (index, item) {
                	  selectBox.append('<option value="' + item.cate_code + '">' + item.cate_name + '</option>'); 
                	  
                  });
                }
            });

        });
    });
</script>

	<style>
		#formbox{
			border: solid 1px black;
			margin: 5%;
			padding: 1%;
		}

		.btn_group{
			margin-top: 25%;
			margin-bottom: 2%;
			text-align: center;
		}

	</style>
</head>
<body>
	<header id="header"></header>
	<div class="container">
		<div class="row">
			<div id="center">



				<div id="formbox">
					<button type="button" onclick="location.href='/waterResourcesList' ">목록으로</button>
					<h2>수자원 정보</h2>

					<hr style="margin-bottom: 5%">

					<form action ="waterResourcesInsert" method="post">
						<p>
							시설물 코드 <input type="text" name="facility_code">

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
							</select>`
						</p>


						<p>
							위도		 <input type="text" name="latitude">
							경도		 <input type="text" name="longitude">
							주소		 <input type="text" name="facility_addr">
						</p>


						<div class="btn_group">
							<button type="submit" class="btn btn-sm btn-primary">등록</button>
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