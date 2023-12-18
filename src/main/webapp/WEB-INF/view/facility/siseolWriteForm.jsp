<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../facilityStat/faheader.jsp" %>
<%@ include file="/WEB-INF/components/header.jsp"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	/* 검색 카드 */	
	#con{ 
		margin: 50px;
		border: solid 2px;
		border-radius: 10px; 
	}
	
	/* 검색 카드  내용*/	
	#con-text{
		margin-top: 10px;
		margin-bottom: 10px;
		font-weight: bold;
	}
	
	/* 테이블 */	
	#con-table{
		margin: 50px;
		text-align: center;
		border-top: solid 2px;
	}
	
	#page {
    text-align: center;
    margin: 50px;
	}

	ul {
	  list-style-type: none; /* 리스트 아이템 앞의 점 제거 */
	  padding-left: 0; /* 왼쪽 여백 제거 */
	}
	
	/* li 요소의 스타일 변경 (선택적) */
	li {
	  margin-bottom: 5px; /* 리스트 아이템 간격을 추가로 조절할 수 있습니다. */
	}
	/* 구분 열 너비 조정 */
	th:nth-child(1), td:nth-child(1) {
	  width: 10%; /* 원하는 너비로 조정 */
	}
	
	/* 점검항목 열 너비 조정 */
	th:nth-child(2), td:nth-child(2) {
	  width: 40%; /* 원하는 너비로 조정 */
	}
	
	/* 평가점수 열 너비 조정 */
	th:nth-child(3), td:nth-child(3) {
	  width: 10%; /* 원하는 너비로 조정 */
	}
	
	/* 비고 열 너비 조정 */
	th:nth-child(4), td:nth-child(4) {
	  width: 40%; /* 원하는 너비로 조정 */
	}
	
	  /* 파일 업로드 스타일 */
	  #file-upload {
	    margin-top: 20px;
	  }
	
	  #file-upload label {
	    display: block;
	    font-weight: bold;
	    margin-bottom: 10px;
	  }
	
	  #file-upload .custom-file-upload {
	    background-color: #191D31;
	    color: white;
	    border: none;
	    padding: 5px 10px;
	    border-radius: 5px;
	    cursor: pointer;
	  }



</style>

</head>
<body>
	<form action="siseoulWriteAction.do">
	<input type="hidden" name="user_id" value="${inspection.user_id}">
	<input type="hidden" name="siseol_id" value="${inspection.siseol_id}">
	<div id="con">
	 <div class="card card-product ">
        <div class="card-body py-8 ">
				<div id="con-text">
					점검일자 : 	
					<input type="date" name="insp_date">
					&nbsp;&nbsp;&nbsp;
					
					기상상황 : 
					<select name="weather">
						<option selected>맑음</option>
						<option>흐림</option>
						<option>눈</option>
						<option>비</option>
					</select>&nbsp;&nbsp;&nbsp;
					
					점검자 소속 : ${inspection.dept}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					직급 : ${inspection.position}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					이름 : ${inspection.name}
					
				</div>	
		  </div>
	   </div>	
	</div>
	
	<div id="con-table">
		 <table class="table" id="table2">
		   <thead class="table-light">
			<tr>
				<th>구분</th>
				<th>점검항목</th>
				<th>평가점수</th>
				<th>비고</th>
			</tr>
			</thead>
			<tbody>
			  <tr>
			    <th>상류면</th>
			    <td >
			      <ul>
			        <li>수문 열림</li>
			        <li>균열</li>
			        <li>박락</li>
			        <li>기타사항</li>
			      </ul>
			    </td>
			    <td>
			      <ul>
			       <li>
			    	<select name="up1_score">
			    		<option selected value="a">a</option>
			    		<option value="b">b</option>
			    		<option value="c">c</option>
			    	</select>
			       </li>
			       <li>
			    	<select name="up2_score">
			    		<option selected value="a">a</option>
			    		<option value="b">b</option>
			    		<option value="c">c</option>
			    	</select>
			       </li>
			       <li>
			    	<select name="up3_score">
			    		<option selected value="a">a</option>
			    		<option value="b">b</option>
			    		<option value="c">c</option>
			    	</select>
			       </li>
			       <li>
			    	<select name="up4_score">
			    		<option selected value="a">a</option>
			    		<option value="b">b</option>
			    		<option value="c">c</option>
			    	</select>
			       </li>	
			      </ul>
			    </td>
			    <td>
			      <ul>
			        <li>
			          <input type="text" name="up1_note">
			        </li>
			        <li>
			          <input type="text" name="up2_note">
			        </li>
			        <li>
			          <input type="text" name="up3_note">
			        </li>
			        <li>
			          <input type="text" name="up4_note">
			        </li>
			      </ul>
			    </td>
			  </tr>
			  <tr>
			    <th>하류면</th>
			    <td>
			      <ul>
			        <li>균열 및 단차</li>
			        <li>수축 및 수평시공이름부를 통한 누수</li>
			        <li>균열 및 박락</li>
			        <li>기타사항</li>
			      </ul>
			    </td>
			    <td>
			      <ul>
			       <li>
			    	<select name="down1_score">
			    		<option selected value="a">a</option>
			    		<option value="b">b</option>
			    		<option value="c">c</option>
			    	</select>
			       </li>
			       <li>
			    	<select name="down2_score">
			    		<option selected value="a">a</option>
			    		<option value="b">b</option>
			    		<option value="c">c</option>
			    	</select>
			       </li>
			       <li>
			    	<select name="down3_score">
			    		<option selected value="a">a</option>
			    		<option value="b">b</option>
			    		<option value="c">c</option>
			    	</select>
			       </li>
			       <li>
			    	<select name="down4_score">
			    		<option selected value="a">a</option>
			    		<option value="b">b</option>
			    		<option value="c">c</option>
			    	</select>
			       </li>	
			      </ul>
			    </td>
			    <td>
			      <ul>
			        <li>
			          <input type="text" name="down1_note">
			        </li>
			        <li>
			          <input type="text" name="down2_note">
			        </li>
			        <li>
			          <input type="text" name="down3_note">
			        </li>
			        <li>
			          <input type="text" name="down4_note">
			        </li>
			      </ul>
			    </td>
			  </tr>
			  <tr>
			    <th>검사량</th>
			    <td>
			      <ul>
			        <li>횡방향 검사량에서의 균열</li>
			        <li>상류 종방향 검사량에서의 균열</li>
			      </ul>
			    </td>
			    <td>
			      <ul>
			       <li>
			    	<select name="inspec1_score">
			    		<option selected value="a">a</option>
			    		<option value="b">b</option>
			    		<option value="c">c</option>
			    	</select>
			       </li>
			       <li>
			    	<select name="inspec2_score">
			    		<option selected value="a">a</option>
			    		<option value="b">b</option>
			    		<option value="c">c</option>
			    	</select>
			       </li>
			      </ul>
			    </td>
			    <td>
			      <ul>
			        <li>
			          <input type="text" name="inspec1_note">
			        </li>
			        <li>
			          <input type="text" name="inspec2_note">
			        </li>
			      </ul>
			    </td>
			  </tr>
			</tbody>
		</table>
	</div>
	<div id="con-table">
		 <table class="table" id="table2">
		  <tr>
		  	<th>
		  		점검결과 : 
		  	</th>
		  	<td >
			  <textarea name="insp_result"  rows="3" style="width: 100%;"></textarea>
			</td>
		  </tr>
		  <tr>
		  	<th>
		  		특이사항 : 
		  	</th>
		  	<td >
			  <textarea name="special_note"  rows="3" style="width: 100%;"></textarea>
			</td>
		  </tr>
		  <tr>
		  	<th>
		  		점검일지 : 
		  	</th>
		  	<td>
			  <textarea name="insp_record" rows="3" style="width: 80%; float: left;"></textarea>
		      <!-- <div id="file-upload">
			    <label for="file">파일 업로드:</label>
			    <input type="file" name="file" id="file">
			  </div> -->
			</td>
		  </tr>
		</table>
	
		<div>
		<!--  <button style="background: white; color: #191D31; border-radius: 5px;"><a href="siseoulList.do" style="text-decoration: none; color: #000;">목록</a></button>
		 <button style="background: white; color: #191D31; border-radius: 5px;"><a href="siseoulWriteForm.do" style="text-decoration: none; color: #000;">삭제</a></button> -->
		 <button type="reset" style="background: white; color: #191D31; border-radius: 5px;">초기화</button>
		 <button type="submit" style="background: white; color: #191D31; border-radius: 5px;">저장</button>
  		 
  		</div>
	</div>
  </form>
</body>
</html>