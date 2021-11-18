<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
-->
<title>주택담보대출상품 조회</title>

<script src="/js/jquery-1.11.1.min.js"></script>
<script>
var xmlhttp ;
var url = "http://finlife.fss.or.kr/finlifeapi/rentHouseLoanProductsSearch.xml?auth=ca671628ffa24c972229e54f6db94508&topFinGrpNo=020000&pageNo=1";
//페이지 번호 클릭
var goPage = function(pageNum) { 
	url = "http://finlife.fss.or.kr/finlifeapi/rentHouseLoanProductsSearch.xml?auth=ca671628ffa24c972229e54f6db94508&topFinGrpNo=020000&pageNo="+pageNum;
	startRequest();
}

var createXMLHttpRequest = function() {
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari      
		xmlhttp=new XMLHttpRequest();  
	} else {// code for IE6, IE5      
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); 
	} 
}

var startRequest= function() {
	createXMLHttpRequest();
	
	xmlhttp.onreadystatechange = handleStateChange;
	xmlhttp.open("POST", url, true);
	xmlhttp.send(null);
}

var handleStateChange = function() {
	if (xmlhttp.readyState == 4){           
	      if (xmlhttp.status == 200){            
			var xmlDoc=xmlhttp.responseXML;     
					
			var results = xmlDoc.getElementsByTagName("result")[0];    
			var maxPageCnt = xmlDoc.getElementsByTagName("max_page_no")[0].childNodes[0].nodeValue;
			var nowPageCnt = xmlDoc.getElementsByTagName("now_page_no")[0].childNodes[0].nodeValue;
			var html = "<table class='Serch-Result-tabs' align=center summary='페이징처리를 하는 표입니다.'><caption>페이징처리 표</caption>";
			html += "<tr>";
			html += "<th>";
			/*** 										페이징 처리 참조 Start										***/
			html += " ◀ ";					
			for (var p = 1; p <= maxPageCnt; p++) {
				if (nowPageCnt == p) {
					html += " <a href='javascript:goPage('"+p+"');'><u><font color='blue'>" +p+"</font></u></a> ";
				} else {
					html += " <a href='javascript:goPage('"+p+"');'>" +p+"</a> ";
				}
			}
			html += " ▶ ";				
			/*** 										페이징 처리 참조 End										***/
			html += "</th>";
			html += "</tr>";
			html += "</table>";
			
			html += "<table class='tbl_type top_line Serch-Result-tabs' summary='금융회사 정보 표입니다.'><caption>금융회사 정보 표</caption>";
	        html += "<tr>";
	        html += "<th class='liveTh'>공시제출월</th>";
	        html += "<th class='liveTh'>금융회사 명</th>";
	        html += "<th class='liveTh'>대출종류명</th>";
            html += "<th class='liveTh'>900점초과 금리</th>";
            html += "<th class='liveTh'>801~900점 금리</th>";
            html += "<th class='liveTh'>701~800점 금리</th>";
            html += "<th class='liveTh'>601~700점 금리</th>";
            html += "<th class='liveTh'>401~500점 금리</th>";
            html += "<th class='liveTh'>301~400점 금리</th>";
            html += "<th class='liveTh'>300점 이하 금리</th>";
            html += "<th class='liveTh'>평균 금리</th>";
	        
	        html += "</tr>";
	        var list = results.getElementsByTagName("products")[0];     
	    
	        for(var idx=0;idx<results.getElementsByTagName("products")[0].childNodes[0].length;idx++){        
				var row = list.getElementsByTagName("product")[idx];
				var baseRow = row.getElementsByTagName("baseinfo")[0];
				var optionRow = row.getElementsByTagName("options")[0];
				var rowSpanCnt = row.getElementsByTagName("options")[0].childNodes[0].length ;
				if (rowSpanCnt > 0) {
					rowSpanCnt = rowSpanCnt+1;
				}
				
				var dcls_month = baseRow.getElementsByTagName("dcls_month")[0].childNodes[0].nodeValue;  //공지제출월
				var kor_co_nm = baseRow.getElementsByTagName("kor_co_nm")[0].childNodes[0].nodeValue;  //금융회사명
				var fin_prdt_nm = "";
				if (baseRow.getElementsByTagName("crdt_prdt_type_nm")[0].childNodes[0] != null) {    //금융상품명
					fin_prdt_nm = baseRow.getElementsByTagName("crdt_prdt_type_nm")[0].childNodes[0].nodeValue;
				}
			    html += "<tr>"; 
			    html += "	<td rowspan=" + rowSpanCnt + ">" + dcls_month.substring(0,4)+"."+dcls_month.substring(4) + "</td>";         
			    html += "	<td rowspan=" + rowSpanCnt + ">" + kor_co_nm + "</td>";          
			    html += "	<td rowspan=" + rowSpanCnt + ">" + crdt_prdt_type_nm + "</td>";                 
			    for(var subIdx=0; subIdx<rowSpanCnt; subIdx++) {         
					var opRow = optionRow.getElementsByTagName("option")[subIdx];
					
					var intr_rate_type_nm = "-";
					if (opRow.getElementsByTagName("crdt_grad_1")[0].childNodes[0] != null) {   //900점초과 금리
						intr_rate_type_nm = opRow.getElementsByTagName("crdt_grad_1")[0].childNodes[0].nodeValue;
					}
				
					var save_trm  = "-";
					if (opRow.getElementsByTagName("crdt_grad_4")[0].childNodes[0] != null) {     //801~900점 금리
						save_trm  = opRow.getElementsByTagName("crdt_grad_4")[0].childNodes[0].nodeValue;
					}

                    var intr_rate = "-";
					if (opRow.getElementsByTagName("crdt_grad_5")[0].childNodes[0] != null) {      //701~800점 금리
						intr_rate = opRow.getElementsByTagName("crdt_grad_5")[0].childNodes[0].nodeValue;
					}

                    var intr_rate = "-";
					if (opRow.getElementsByTagName("crdt_grad_6")[0].childNodes[0] != null) {     //601~700점 금리
						intr_rate = opRow.getElementsByTagName("crdt_grad_6")[0].childNodes[0].nodeValue;
					}

                    var intr_rate = "-";
					if (opRow.getElementsByTagName("crdt_grad_10")[0].childNodes[0] != null) {     //401~500점 금리
						intr_rate = opRow.getElementsByTagName("crdt_grad_10")[0].childNodes[0].nodeValue;
					}
					
					var intr_rate = "-";
					if (opRow.getElementsByTagName("crdt_grad_12")[0].childNodes[0] != null) {     //301~400점 금리
						intr_rate = opRow.getElementsByTagName("crdt_grad_12")[0].childNodes[0].nodeValue;
					}
					
					var intr_rate = "-";
					if (opRow.getElementsByTagName("crdt_grad_13")[0].childNodes[0] != null) {     //300점이하 금리
						intr_rate = opRow.getElementsByTagName("crdt_grad_13")[0].childNodes[0].nodeValue;
					}
					
					var intr_rate = "-";
					if (opRow.getElementsByTagName("crdt_grad_avg")[0].childNodes[0] != null) {     //평균 금리
						intr_rate = opRow.getElementsByTagName("crdt_grad_avg")[0].childNodes[0].nodeValue;
					}
					
					html += "	<td>" + crdt_grad_1 + "</td>";             
					html += "	<td>" + crdt_grad_4 + "</td>";          
					html += "	<td>" + crdt_grad_5 + "</td>";
                    html += "	<td>" + crdt_grad_6 + "</td>";
                    html += "	<td>" + crdt_grad_10 + "</td>";
                    html += "	<td>" + crdt_grad_12 + "</td>";
                    html += "	<td>" + crdt_grad_13 + "</td>";
                    html += "	<td>" + crdt_grad_avg + "</td>";
					
					html += "</tr>"; 
					if (subIdx < rowSpanCnt) html += "<tr>";
			         
			    }
			}
			html += "</table>"; 
			document.getElementById('tableDiv').innerHTML = html;             
			xmlhttp = null;    
		
	      }
	}
}
</script>
</head>
<body onload="startRequest();">
    <h3 class="Serch-Result-head"> ▣ 주택담보대출상품 조회결과</h3>
	<br></br>   
    <div id="tableDiv"></div>
</body> 
</html>