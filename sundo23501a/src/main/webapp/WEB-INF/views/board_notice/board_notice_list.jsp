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
<!-- JS END -->

<script type="text/javascript">
	$(function() {
		
		$.ajax({
			url			: '/main_header',
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
	
		$('#idNewWinFlag').click(function(){
			var checked = $(this).is(':checked');
			if(checked) {
				$(this).val("Y");
				setCookie("NewWinFlag", "Y", 1, "/");
			}else {
				$(this).val("N");
				setCookie("NewWinFlag", "N", 1, "/");
			}
		});

		var NEW_WIN_FLAG = getCookie("NewWinFlag");
		if(NEW_WIN_FLAG == 'N') {
			$('#idNewWinFlag').prop('checked', false);
		}else{
			$('#idNewWinFlag').prop('checked', true);
		}
	});	
	
	function popup(url, w, h) {
		var pwidth = 800;
		var pheight = 800;
		if(w != null) pwidth = w;
		if(h != null) pheight = h;

		var left = Math.ceil((window.screen.width - pwidth)/2);
		var top  = Math.ceil((window.screen.height - pheight)/2);

		var options = "location=no, directories=no, resizable=yes, status=no, toolbar=no, menubar=no, scrollbars=auto"
		            + ", height="+pheight+", width="+pwidth+", left="+left+", top="+top;

		window.open(url, "_blank", options);
	}
	
	function callAction(action, mapping_name) {
		var checked = false;
		if($('#idNewWinFlag')) { //목록창에만 새 창 열기 체크박스 존재
			checked = $("#idNewWinFlag").is(':checked');
		}
		if(checked || opener) { //목록에 새 창 열기 체크되어 있거나, 이미 문서가 열린 경우 opener가 있는 경우(새 창 열기로 연 경우)
			popup(mapping_name);
		}else{	//프레임에서 열기 이거나, opener가 없는 경우(=프레임에서 문서가 열린 경우)
			$('#idFrameSet').addClass("frame_set");
			$('#idFrameList').addClass("frame_left");
			$('#idFrameDoc').addClass("frame_right");
			$.ajax({
				url			: mapping_name,
				dataType 	: 'html',
				success		: function(data) {
					$('#idFrameDoc').html(data);
				}
			});
		}
	}

	//문서 버튼 >> 닫기
	function closeDoc() {
		if(opener) {
			if(opener.location.href.indexOf("_list") > 0) { //목록에서 뜬 경우만 새로고침
				opener.location.reload();
			}
			window.close();
		}else{
			location.reload();
		}
	}
	
</script>
<style type="text/css">
header {
    height: 55px;
}
</style>
</head>
<body>
<!-- HEADER -->
<header id="header"></header>
<!-- CONTENT -->
<div class="container">
	<div class="row">	
		<!-- 본문 -->
		<div id="center">
			<!------------------------------ //개발자 소스 입력 START ------------------------------->
			<br>
			<div id="idFrameSet">
				<div id="idFrameList">
					<div class="container-fluid">
						<table width="100%" style="height:45px">
							<tr>
								<td style="vertical-align:top"><span class="apptitle">공지사항</span></td>
								<td align="right">
									<form action="board_notice_list">
										<table>
											<tr>
												<td>
													<select class="form-select" name="search" style="font-size:0.8rem">
														<c:forEach var="code" items="${search_codelist}">
															<option value="${code.cate_code}">${code.cate_name}</option>
														</c:forEach>
													</select>
												</td>
												<td><input type="text" class="form-control me-2" style="font-size:0.8rem" name="keyword" placeholder="검색어를 입력하세요" required="required"></td>
												<td>
													<button type="submit" class="btn btn-dark btn-sm">검색</button>
													<button type="button" class="btn btn-outline-secondary btn-sm" onclick="goto('board_notice_list')" style="cursor:pointer">
									         			<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
															<path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"></path>
															<path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"></path>
														</svg>
													</button>
												</td>
											</tr>
										</table>
									</form>	
								</td>
							</tr>
						</table>						
						<table width="100%" style="margin-bottom:5px">
							<tr>
								<td width="200">
									<div class="form-check form-switch">
										<input class="form-check-input" type="checkbox" role="switch" id="idNewWinFlag" checked="" value="newwin"><!-- flexSwitchCheckChecked -->
										<label class="form-check-label" for="flexSwitchCheckChecked">새 창 열기</label>
									</div>
								</td>
								<td width="*" style="text-align:right">
									<c:if test="${not empty keyword}">								
										<a href="board_notice_list"><img src="/images/btn_icon_delete2.png" width="18" height="19" style="vertical-align:bottom"></a> 
										검색어( <c:forEach var="code" items="${search_codelist}"><c:if test="${code.cate_code == search}">${code.cate_name}</c:if></c:forEach> = ${keyword} ) 
										<img src="/images/icon_search.png" width="14" height="14" style="vertical-align:bottom"> 검색 건수
									</c:if>
									<c:if test="${keyword eq null}">총 건수</c:if>
									 : ${totalCount}
								</td>
							</tr>
						</table>
						<table class="table table-hover">
							<colgroup>
								<col width="5%"></col>
								<col width="45%"></col>
								<col width="10%"></col>
								<col width="15%"></col>
								<col width="15%"></col>
								<col width="10%"></col>
							</colgroup>
							<thead class="table-light">
								<tr>
									<th>No.</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th><img src="/images/attach/icon_document.png"></th>
									<th>조회</th>
								</tr>
							</thead>
							<tbody>
							<c:set var="num" value="${page.total-page.start+1}"></c:set>
							<c:forEach items="${boardList}" var="board">
								<tr>
									<td>${board.rn}</td>
									<td>
										<a href="javascript:callAction('read','board_notice_read?doc_no=${board.doc_no}')">${board.subject}</a>
									</td>
									<td>
										${board.user_name}										
									</td>
									<td><fmt:formatDate value="${board.create_date}" type="date" pattern="yyyy-MM-dd"/></td>
									<td>
										<c:set var="attach_name" value="${board.attach_name}"/>
									    <c:set var="attach_length" value="${fn:length(attach_name)}"/>
									    <c:set var="extension_name" value="${fn:substringAfter(attach_name, '.')}" />
									    <c:if test="${extension_name ne ''}">
									    	<a href="javascript:popup('/upload/${board.attach_path}',800,600)"><img src="/images/attach/icon_${extension_name}.png" alt="${board.attach_name}"> ${board.attach_name}</a>
									    </c:if>
									</td>
									<td>${board.bd_count}</td>
								</tr>
								<c:set var="num" value="${num-1}"></c:set>
							</c:forEach>
							</tbody>
						</table>
						<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						    
							<c:if test="${page.startPage > page.pageBlock}">
							   	<li class="page-item"><a class="page-link" href="javascript:gotoPage('${page.startPage-page.pageBlock}')" tabindex="-1" aria-disabled="true">이전</a></li>
							</c:if>
						    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
								<c:choose>
									<c:when test="${page.currentPage==i}"><li class="page-item active"></c:when>
									<c:otherwise><li class="page-item"></c:otherwise>
								</c:choose>
								<a class="page-link" href="javascript:gotoPage('${i}')">${i}</a></li>
							</c:forEach>						
						    <c:if test="${page.endPage > page.totalPage}">
						    	<li class="page-item"><a class="page-link" href="javascript:gotoPage('${page.startPage+page.pageBlock}')">다음</a></li>
						    </c:if>
						    
						  </ul>
						</nav>
									
					</div>
				</div>
				<div id="idFrameDoc">
				</div>
			</div>
	  		<!------------------------------ //개발자 소스 입력 END ------------------------------->	
		</div>
	</div>
</div>
<!-- FOOTER -->
<footer class="footer py-2">
  <div id="footer" class="container">
  </div>
</footer>
</body>
</html>