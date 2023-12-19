<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="faheader.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery UI CSS -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI JavaScript -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">

		/* 제목 */
	#title{
		margin-top: 50px;
		text-align: center;
		font-weight: bold;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
		/* 테이블 */	
	#con-table{
		margin: 50px;
		text-align: center;
		border-top: solid 2px;
	}
	
		/* 컨텐츠 */
	#content{
		padding-right: 20%;
		padding-left: 20%;
	}
	
	
</style>

<script>
    $(document).ready(function() {
		// 달력 함수
    	$("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd' // 원하는 날짜 형식을 
        });
        // 아이콘 클릭 시 달력 출력
        $("#calendarIcon").on("click", function() {
            $("#datepicker").datepicker("show");
        });
   
        // 아이콘 클릭 시 파일 업로드 다이얼로그 열기
        $("#fileUpload").on("click", function() {
            $("#fileInput").click();
        });
        
     
        // 파일 변경 이름 처리
        $("#fileInput").on("change", function() {
            var fileName = $(this).val();
            $("#selectFileName").text(fileName);
        });
    
        // 파일 변경 이미지 처리
        $("#fileInput").on("change", function() {
            var fileInput = $(this)[0]; // 파일 인풋 엘리먼트
            var selectedImage = $("#selectedImage")[0]; // 이미지를 표시할 엘리먼트

            if (fileInput.files && fileInput.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    // 선택된 이미지를 화면에 표시
                    selectedImage.src = e.target.result;
                    selectedImage.style.display = "block";
                };

                // 선택된 파일을 읽기
                reader.readAsDataURL(fileInput.files[0]);
            }
        });
        
    	 // 시설물 코드 선택시 알람 가져오기
        $("#siseolSelect").change(function() {
            var selectedSiseol = $(this).val();

            // 선택된 시설물 코드에 해당하는 알람 리스트 가져오기
            $.ajax({
                type: "POST",
                url: "/alarmList.do",
                data: { siseol_id: selectedSiseol },
                dataType: "json",
                success: function(data) {
              
           	    	// 알람 테이블의 tbody 요소 가져오기
              	    var alarmTable = $("#alarmTable"); 
                 	 alarmTable.empty(); // 기존 행 제거
                 	 
                    // 알람 리스트를 알람 테이블에 추가
                    for (var i = 0; i < data.length; i++) {
                   	 console.log(data);
                        var alarm = data[i];
	                  	 // alarm_time을 Date 객체로 변환
	                  	var alarmTime = new Date(alarm.alarm_time);
		                 // 원하는 형식으로 시간을 문자열로 변환
	                  	var options = { year: 'numeric', month: '2-digit', day: '2-digit' };
	                  	var formattedAlarmTime = alarmTime.toLocaleString('ko-KR', options); // 한국 로케일을 사용하고 옵션을 설정

                        var row = "<tr>" +
                        	 "<td class='table-active'></td>" +
                            "<td>" + alarm.alarm_id + "</td>" +
                            "<td>" + alarm.content + "</td>" +
                            "<td colspan='2'>" + formattedAlarmTime + "</td>" +
                            "<td><input type='checkbox' name='alarmCheck'></td>" +
                            "</tr>";
                        alarmTable.append(row);
                    }
                },
                error: function(xhr, status, error) {
                    // 오류 처리
                    alert("알람 리스트를 가져오는 데 실패했습니다.");
                }
            });
        });

        
    });
    
</script>

<script type="text/javascript">
// 시설물 코드 가져오기	
function siseolContent() {
    var selectedSmallCode = $("#small_code").val(); // 선택된 small_code 값
	
    
    // small_code에 대한 시설물 코드 목록 가져오기
    $.ajax({
        type: "POST", // 요청 메서드 (POST)
        url: "/selectSmallCode.do",
        data: { small_code: selectedSmallCode }, 
        dataType: "json", // 응답 데이터 형식 (JSON)
        success: function(data) {
        	
            var siseolSelect = $("#siseolSelect"); // 시설물 코드 select 요소
            siseolSelect.empty(); // 기존 옵션 제거
					
            // 받은 데이터를 반복하여 옵션을 추가
            for (var i = 0; i < data.length; i++) {
            	siseolSelect.append("<option value='" + data[i] + "'>" + data[i] + "</option>");
            }
            console.log(data);
        },
        error: function(xhr, status, error) {
            // 오류 처리
           alert("시설물을 선택하세요.");
        }
    });
}

</script>


</head>
<body>

	<div id="title">
		<h2>고장 보고서 작성</h2>
	</div>

<div id="content">
	<form action="rpWriteAction.do" method="post">
		<div id="con-table">
		 <table class="table">
			<tr style="border-bottom: 1px;">
				<td class="table-active" style="font-weight: bold;">시설물 종류</td>
				<td>
				<select class="form-select" id="small_code" name="small_code" onchange="siseolContent()" required="required">
					<option>시설물 종류</option>
					<option value="1">댐</option>
					<option value="2">저수지</option>
					<option value="3">펌프장</option>
					<option value="4">관개수로</option>
				</select> 
				
				</td>

				<td class="table-active" style="font-weight: bold;">시설물 코드</td>
				<td>
				    <select class="form-select" id="siseolSelect" name="siseol_id" required="required">
						<option></option>
				    </select>
				</td>
				
				<td class="table-active"  style="font-weight: bold;">작성자</td>
				<td><input name="user_id" value="admin"  class="form-control" type="text" required="required"></td>
			</tr>
			
			<tr>
				<td class="table-active" style="font-weight: bold;">제목</td>
				<td colspan="5"><input  class="form-control" type="text" name="title" required="required"></td>
			</tr>
			
			<tr>
			    <td class="table-active" style="font-weight: bold;">고장일자</td>
			    <td>
			       <div class="input-group">
					    <input type="text" id="datepicker" name="gojang_date" class="form-control" readonly required="required">
					    <span class="input-group-text" id="calendarIcon"><i class="bi bi-calendar-date"></i></span>
					</div>
			    </td>
			</tr>
			
			<tr>
				<td class="table-active" style="font-weight: bold;">고장원인</td>
				<td colspan="5">
					<textarea rows="2" cols="" class="form-control" name="gojang_cause" required="required"></textarea>
				</td>
			</tr>
			
			<tr>
				<td class="table-active" style="font-weight: bold;">현재상황</td>
				<td colspan="5">
					<textarea rows="2" cols=""  class="form-control" name="curr_status" required="required"></textarea>
				</td>
			</tr>
	
			<tr>
			    <td class="table-active" style="font-weight: bold;">즉시처리</td>
			    <td colspan="5">
  					<div class="input-group">
                        <input type="checkbox" name="immediate_action" id="imCk" value="1">&nbsp;&nbsp;
                        <input class="form-control rounded" type="text" name="">
                    </div>
			    </td>
			</tr>

			<tr style="border-bottom: 1px; ">
				<td class="table-active" style="font-weight: bold;">향후계획</td>
				<td colspan="5">
					<textarea rows="2" cols=""  class="form-control" name="future_plan" required="required"></textarea>
				</td>
			</tr>
			
			<tr style="border-bottom: 1px;">
			    <td class="table-active" style="font-weight: bold;">파일첨부</td>
			    <td colspan="5">
			        <div style="text-align: center;">
			            <!-- 파일 이미지 -->
			            <div style="display: inline-block; text-align: center;">
			                <img id="selectedImage" src="" alt="Selected Image" style="max-width: 500px; max-height: 500px; display: none; margin: 0 auto;">
			            </div><p>
			            <span id="selectFileName"></span>
			            <i class="bi bi-plus-square-fill" id="fileUpload"></i>
			            <input type="file" id="fileInput" style="display: none;" name="file_name">
			        </div>
			    </td>
			</tr>
		
			<tr>
				<td class="table-active" style="font-weight: bold;">알람내역</td>
				<td class="table-active" style="font-weight: bold;">알람코드</td>
				<td class="table-active" style="font-weight: bold;">알람내용</td>
				<td colspan="2" class="table-active" style="font-weight: bold;">알람일시</td>
				<td class="table-active" style="font-weight: bold;">확인</td>
				
			</tr>
			
			<tbody id="alarmTable">
				
			</tbody>
			</table>
		</div>
		
		<div style="float: right; margin-right: 50px; margin-bottom: 50px;" >
	        <button type="button" style="background: #000042; color: white;" onclick="location.href='troubleList.do'">돌아가기
	        </button>
			
			<button type="submit" style="background: #000042; color: white;">저장</button>	
		</div>
		
	</form>
</div>	
	
	

</body>
</html>