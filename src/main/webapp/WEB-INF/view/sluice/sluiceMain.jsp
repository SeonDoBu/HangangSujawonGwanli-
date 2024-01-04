<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluiceMapHeader.jsp" %>    
<%@ include file="../../components/header.jsp" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>지도</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
     integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<style type="text/css">
		.sidebar10 {
			width: 80px;
			background-color: #000042;
			height: 1100px;
			float: left;
		}
		
		.close {
		  float: right;
		  cursor: pointer;
		}
		/* 지도 크기 설정을 위한 css */
		.map {
      	height: 860px;
      	width: 100%;
    	}
	</style>
	
    <script src="https://code.jquery.com/jquery-3.6.0.js" 
	 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="/js/ol.js"></script> <!-- OpenLayer 라이브러리 -->
	<link href="/css/ol.css" rel="stylesheet" type="text/css" > <!-- OpenLayer css -->
	<link rel="stylesheet" href="css/ol-ext.css" /> <!-- scale 표시 -->
	<script type="text/javascript" src="js/ol-ext.js"></script> <!-- scale 표시 -->
	<script type="text/javascript" src="/js/mapTest.js?ver=1"></script> <!-- 지도 맵객체 생성을 위한 js-->
	<script type="text/javascript">
/* 		$(function(){
			console.log("sluiceMain.jsp");
			 // 맵 객체에 레이어를 추가함
		/* 	map.addLayer(wms2);
			map.addLayer(wms3);
			map.addLayer(wms4);
		}) */
		/*전체 선택 할려고 했으나 값이 바뀌지않음  */
/* 		$(document).ready(function() {
			$("#chkAll").click(function() {
				if($("#chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
				else $("input[name=chk]").prop("checked", false);
			});

			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;

				if(total != checked) $("#chkAll").prop("checked", false);
				else $("#chkAll").prop("checked", true); 
			});
		});
	 */

		function addLayer1() {			
		/* 	var haha = $("#chk").val;
			 console.log(haha); */
			if(document.getElementById('chk1').checked) {
				console.log('하하');
				map.addLayer(wms1);
			} else {
				console.log('메롱');
				map.removeLayer(wms1);
			}	
		}
		
		function addLayer2() {
			if(document.getElementById('chk2').checked) {
				console.log('하하');
				map.addLayer(wms2);
			} else {
				console.log('메롱');
				map.removeLayer(wms2);
			}
		}
		
		function addLayer3() {
			if(document.getElementById('chk3').checked) {
				console.log('하하');
				map.addLayer(wms3);
			} else {
				console.log('메롱');
				map.removeLayer(wms3);
			}
		}
		
		function addLayer4() {
			if(document.getElementById('chk4').checked) {
				console.log('하하');
				map.addLayer(wms4);
			} else {
				console.log('메롱');
				map.removeLayer(wms4);
			}
		}
		
		function addLayer5() {
			if(document.getElementById('chk5').checked) {
				console.log('하하');
				map.addLayer(wms5);
			} else {
				console.log('메롱');
				map.removeLayer(wms5);
			}
		}
		
		function addLayer6() {
			if(document.getElementById('chk6').checked) {
				console.log('하하');
				map.addLayer(wms6);
			} else {
				console.log('메롱');
				map.removeLayer(wms6);
			}
		}
		
		function addLayer7() {
			if(document.getElementById('chk7').checked) {
				console.log('하하');
				map.addLayer(wms7);
			} else {
				console.log('메롱');
				map.removeLayer(wms7);
			}
		}
		
		function addLayer8() {
			if(document.getElementById('chk8').checked) {
				console.log('하하');

				sluiceval();
				
			} else {
				console.log('메롱');
				map.removeLayer(markerVectorLayer);
			}
		}
		
		function chkLayer() {
			if(document.getElementById('chk9').checked) {
				sluiceval();
			} else {
				map.removeLayer(markerVectorLayer);
			}
		}
		
		function addLayer10() {
			if(document.getElementById('chk10').checked) {
				
				console.log('하하');
				sluiceval();
				
			} else {
				console.log('메롱');
				map.removeLayer(markerVectorLayer);
			}
		}
		
		function addLayer11() {
			if(document.getElementById('chk11').checked) {
				console.log('하하');
				sluiceval();
			} else {
				console.log('메롱');
				map.removeLayer(markerVectorLayer);
			}
		}
		
		
		function deleteDiv() {
			  const div = document.getElementById('my_div');
			  
			  div.remove();
			} 
		
		function saveBookmarkSs() {
			const id = document.getElementById('siseol_id').value;
			if(confirm('북마크에 저장하시겠습니까?')) {
				location.href = "saveBookmarkSs.do?siseol_id="+id;	
			}
		}
		
		function saveBookmarkSl() {
			const id = document.getElementById('sluice_id').value;
			if(confirm('북마크에 저장하시겠습니까?')) {
				location.href = "saveBookmarkSl.do?sluice_id="+id;	
			}
		}
		
		function updateBookmarkList() {
			const option  = document.getElementById('bookmarkSelect').value;
			const user_id = "${user_id}";
			
			$.ajax({
				url      : "updateBookmarkList",
				data     : {option: option, user_id: user_id},
				method   : 'GET',
				dataType : 'json',
				success  : function(map) {
					$('#totalBookmark').empty();
					$('#bookmarkListTable').empty();
					var count = map.count;
					$('#totalBookmark').append("총 "+count+"개");
					var bookmarkList = map.bookmarkList;
					for(var i = 0; i < bookmarkList.length; i++) {
						if(bookmarkList[i].sluice_id != 0 && bookmarkList[i].sluice_id != null) {
							var id = "<td scope='row'>" + bookmarkList[i].sluice_id + "</td>";
							var name = "<td scope='row'>" + bookmarkList[i].sluiceName + " 관측소</td>";
							$("#bookmarkListTable").append("<tr>"+name+id+"</tr>");
						} else if(bookmarkList[i].siseol_id != 0 && bookmarkList[i].siseol_id != null) {
							var id = "<td scope='row'>" + bookmarkList[i].siseol_id + "</td>";
							var name = "<td scope='row'>" + bookmarkList[i].siseolName + "</td>";
							$("#bookmarkListTable").append("<tr>"+name+id+"</tr>");
						}
					}
				},
				error : function() {
					alert("북마크 정보를 가져오지 못했습니다.");
				}
			})
		}
		
		$(document).ready(function() {
			var msg = "<c:out value='${msg}'/>";
			if(msg != null && msg != undefined && msg != "") {
				alert(msg);
			}
			updateBookmarkList();
		})
	
		
	</script>
	<style>
	.__float-tbl{
		border: 1px solid #2a5dc5;
		border-radius: 5px;
		background-color: #2a5dc5;
		font-size: 15px;
		color: white;
		text-align: center;
		position: absolute;
		top: 600px;
		left: 1000px;
		z-index:10;
		width:130px;
	}
	</style>
  </head>
  <body>

<!-- 사이드바 버튼  -->
<div class="sidebar10" >
 <button class="btn btn-primary"  style="margin: 10px; border:0px; width:70px; height:70px; background-color: #000042;"  type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">
 <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-thermometer-sun" viewBox="0 0 16 16">
  <path d="M5 12.5a1.5 1.5 0 1 1-2-1.415V2.5a.5.5 0 0 1 1 0v8.585A1.5 1.5 0 0 1 5 12.5z"/>
  <path d="M1 2.5a2.5 2.5 0 0 1 5 0v7.55a3.5 3.5 0 1 1-5 0V2.5zM3.5 1A1.5 1.5 0 0 0 2 2.5v7.987l-.167.15a2.5 2.5 0 1 0 3.333 0L5 10.486V2.5A1.5 1.5 0 0 0 3.5 1zm5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-1 0v-1a.5.5 0 0 1 .5-.5zm4.243 1.757a.5.5 0 0 1 0 .707l-.707.708a.5.5 0 1 1-.708-.708l.708-.707a.5.5 0 0 1 .707 0zM8 5.5a.5.5 0 0 1 .5-.5 3 3 0 1 1 0 6 .5.5 0 0 1 0-1 2 2 0 0 0 0-4 .5.5 0 0 1-.5-.5zM12.5 8a.5.5 0 0 1 .5-.5h1a.5.5 0 1 1 0 1h-1a.5.5 0 0 1-.5-.5zm-1.172 2.828a.5.5 0 0 1 .708 0l.707.708a.5.5 0 0 1-.707.707l-.708-.707a.5.5 0 0 1 0-.708zM8.5 12a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-1 0v-1a.5.5 0 0 1 .5-.5z"/>
</svg><small>관측소</small></button><br>
<div class="offcanvas offcanvas-start" style="margin-top: 80px; margin-left: 80px; float: left;" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
  <!-- 사이드바 헤더  -->
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasScrollingLabel">관측소 수 : ${sluiceCnt }</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <!-- 사이드바 바디 리스트용  -->
  <div class="offcanvas-body">

    <h1>관측소 목록</h1>
    <table class="table">
  <thead>
    <tr>
      <th scope="col">관측소명</th>
    </tr>
  </thead>

  <tbody>
<c:forEach var="SL" items="${SluiceList }">
    <tr>
      <td scope="row">${SL.name}</td>
	</tr>
</c:forEach>

  </tbody>
  
</table>
  <nav aria-label="Page navigation example text-center" style="margin-top: 20px;">
			<ul class="pagination">
				<c:if test="${page.startPage > page.pageBlock}">
					<li class="page-item">
						<a class="page-link" href="sluiceList?currentPage=${page.startPage - page.pageBlock}" aria-label="이전">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<li class="page-item">
						<a class="page-link" href="#">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${page.endPage < page.totalPage}">
					<li class="page-item">
						<a class="page-link" href="sluiceList?currentPage=${page.startPage + page.pageBlock}" aria-label="다음">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
			</ul>
		</nav>
  </div>
  
  
</div>
<!-- 사이드바 끝  -->

<!-- 사이드바 버튼2  -->

 <button class="btn btn-primary" style="margin: 10px; border:0px; background-color:#000042; width: 70px; height: 70px;"  type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling2" aria-controls="offcanvasScrolling">
 <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-stack" viewBox="0 0 16 16">
  <path d="m14.12 10.163 1.715.858c.22.11.22.424 0 .534L8.267 15.34a.598.598 0 0 1-.534 0L.165 11.555a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.66zM7.733.063a.598.598 0 0 1 .534 0l7.568 3.784a.3.3 0 0 1 0 .535L8.267 8.165a.598.598 0 0 1-.534 0L.165 4.382a.299.299 0 0 1 0-.535L7.733.063z"/>
  <path d="m14.12 6.576 1.715.858c.22.11.22.424 0 .534l-7.568 3.784a.598.598 0 0 1-.534 0L.165 7.968a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.659z"/>
</svg>
 <small>레이어</small>
 

 </button><br>
<div class="offcanvas offcanvas-start" style="margin-top: 80px; margin-left: 80px; float: left;" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling2" aria-labelledby="offcanvasScrollingLabel">
  <!-- 사이드바 헤더  -->
  <div class="offcanvas-header" style="float: right;">
  
    <h5 class="offcanvas-title" id="offcanvasScrollingLabel">레이어 
    </h5>
  <!--   <div>
    <input type="checkbox" checked="checked" id="chkAll">
    </div> -->
    
    
    
    <button type="button"  class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <!-- 사이드바 바디 리스트용  -->
  <div class="offcanvas-body">
   
<!-- 메롱의메롱 -->
<h4>행정구역</h4>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer5()" name="chk" id="chk5" > 행정구역 경기<br>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer6()" name="chk" id="chk6" > 행정구역 서울

<h4 style="margin-top: 10px;">한강하천</h4>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer1()" name="chk" id="chk1" > 한강하천_서울<br>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer2()" name="chk" id="chk2" > 한강하천_경기<br>
<h4 style="margin-top: 10px;">한강수계</h4>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer3()" name="chk"  id="chk3" > 한강수계_서울<br>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer4()" name="chk" id="chk4" > 한강수계_경기<br>
<br>
<h4 style="margin-top: 10px;">관측소</h4>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer7()" name="chk" id="chk7" > 관측소 RedPoint<br>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer8()" name="" id="chk8" value="4"> 관측소 Marker<br>
&nbsp;&nbsp;<input type="checkbox" onclick="chkLayer()" name="" id="chk9"  value="1"> 강수량 Marker<br>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer10()" name="" id="chk10" value="2"> 수위 Marker<br>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer11()" name="" id="chk11" value="3"> 유량 Marker<br>

<h4 style="margin-top: 10px;">시설물</h4>
&nbsp;&nbsp;<input type="checkbox" onclick="getSiseolLayer()" name="chk" id="chkSiseol1"> 댐<br>
&nbsp;&nbsp;<input type="checkbox" onclick="getSiseolLayer()" name="chk" id="chkSiseol2"> 저수지<br>
&nbsp;&nbsp;<input type="checkbox" onclick="getSiseolLayer()" name="chk" id="chkSiseol3"> 펌프장<br>
&nbsp;&nbsp;<input type="checkbox" onclick="getSiseolLayer()" name="chk" id="chkSiseol4"> 관개수로<br>
 </div>
</div>


<!-- 사이드바 버튼3  -->

 <button class="btn btn-primary" style="margin: 10px; border:0px;  background-color:#000042; width: 70px; height: 70px;"  type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling3" aria-controls="offcanvasScrolling">
 <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"  fill="white" class="bi bi-bookmark" viewBox="0 0 16 16">
  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
</svg>
 <small>북마크</small>
</button>

<div class="offcanvas offcanvas-start" style="margin-top: 80px; margin-left: 80px; float: left;" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling3" aria-labelledby="offcanvasScrollingLabel">
  <!-- 사이드바 헤더 -->
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasScrollingLabel">북마크</h5>
    <button  type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <!-- 사이드바 바디 리스트용  -->
  <div class="offcanvas-body">
    <div>
	    <select name="keyword" id="bookmarkSelect" onchange="updateBookmarkList()">
	    	<option value="1">전체</option>
	    	<option value="2">관측소</option>
	    	<option value="3">시설물</option>
	    </select>
    	<span id="totalBookmark"></span><!-- 총 개수 -->
    </div>
    <table class="table">
	    <thead>
	    	<tr>
	    		<th scope="col">이름</th>
	    		<th scope="col">코드</th>
	    	</tr>
	    </thead>
		
		<tbody id="bookmarkListTable">
<%-- 			<c:forEach var="bookmark" items="${bookmarkList}">
				<c:if test="${bookmark.siseol_id != 0 && bookmark.siseol_id != null}">
					<tr>
						<td scope="row">${bookmark.siseol_id}</td>
					</tr>	
				</c:if>	
				<c:if test="${bookmark.sluice_id != 0 && bookmark.sluice_id != null}">
					<tr>
						<td scope="row">${bookmark.sluice_id}</td>
					</tr>	
				</c:if>	
			</c:forEach> --%>
		</tbody>
	</table>
  </div>
</div>
</div>
<div>

<!-- 진짜 바디의 시작 -->
	<div id="map" class="map" style="margin-left: 80px;">
	<!-- 실제 지도가 표출 될 영역 -->
	<div id="popup">
<!-- Modal -->
<div class="modal fade" id="Modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <h1>관측소 명 :${sluice.name }      
	<c:choose>
      <c:when test="${observData.type eq 1 }">
      강수량관측소
      </c:when>
      <c:when test="${observData.type eq 2 }">
      수위관측소
      </c:when>
      <c:when test="${observData.type eq 3 }">
      유량관측소
      </c:when>
      <c:otherwise>
      관측중
      </c:otherwise>
    </c:choose> </h1>
<br>
(단위: mm) <button type="button" style="float: right; margin-right: 10px;" class="btn btn-secondary">저장</button> 
<!-- <button type="button"   onclick="locate()" class="btn" style="background-color: #000042; color: white; margin-right:20px; float: right;" >관리</button> -->
<br>
<table class="table table-bordered" style="margin-top: 30px; width: 1100px;">
  <thead class="table-light">
    <tr>
      <th scope="col" colspan="2">관측일시</th>
      
     <th>0</th>
     <th>1</th>
     <th>2</th>
     <th>3</th>
     <th>4</th>
     <th>5</th>
     <th>6</th>
     <th>7</th>
     <th>8</th>
     <th>9</th>
     <th>10</th>
     <th>11</th>
     <th>12</th>
     <th>13</th>
     <th>14</th>
     <th>15</th>
     <th>16</th>
     <th>17</th>
     <th>18</th>
     <th>19</th>
     <th>20</th>
     <th>21</th>
     <th>22</th>
     <th>23</th>
     
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="obs" items="${ObservDataList}">
    <tr>  
      <td scope="row" colspan="2">${obs.data_ymd }</td>
     		<td>${obs.value00}</td>
			<td>${obs.value01}</td>
			<td>${obs.value02}</td>
			<td>${obs.value03}</td>
			<td>${obs.value04}</td>
			<td>${obs.value05}</td>
			<td>${obs.value06}</td>
			<td>${obs.value07}</td>
			<td>${obs.value08}</td>
			<td>${obs.value09}</td>
			<td>${obs.value10}</td>
			<td>${obs.value11}</td>
			<td>${obs.value12}</td>
			<td>${obs.value13}</td>
			<td>${obs.value14}</td>
			<td>${obs.value15}</td>
			<td>${obs.value16}</td>
			<td>${obs.value17}</td>
			<td>${obs.value18}</td>
			<td>${obs.value19}</td>
			<td>${obs.value20}</td>
			<td>${obs.value21}</td>
			<td>${obs.value22}</td>
			<td>${obs.value23}</td>
    </tr>
 	</c:forEach>
  </tbody>
</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
		<div id="popup-content"></div>
	</div>
	</div>

</div>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
   
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
  
  </body>
</html>