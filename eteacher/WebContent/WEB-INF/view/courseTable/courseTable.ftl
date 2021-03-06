<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<title>教学系统教师pc端</title>
<link href="${context}/css/base.css" rel="stylesheet" type="text/css">
<link href="${context}/js/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${context}/js/bootstrap-table/bootstrap-table.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${context}/js/jquery.min.js"></script>
<script type="text/javascript" src="${context}/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${context}/js/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="${context}/js/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('a[href="#courseDiv"]').on('show.bs.tab', function (e) {
			var type = $(e.target).data('type');
			var url = 'viewCourseTable?type='+type;
			if(type=='class'){
				url += '&classId=' + $(e.target).data('classid');
			}
			window.location.href = url;
		});
		if('${classId?default("")}'!=''){
			$('#classLi').addClass('active');
		}
		else{
			$('.userType').addClass('active');
		}
		$('#titleSpan').text('${title?default("")}');
	});
</script>
</head>
<body>
	<div class="maincont">
	<div class="title"><span id="titleSpan">课表</span></div>
        <div class="course-table">
        	<ul class="nav nav-tabs">
        	  <li class="dropdown userType">
			    <a href="#courseDiv" data-toggle="tab" data-type="user">教师课表</a>
			  </li>
			  <li id="classLi" class="dropdown">
			    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
			      	班级课表 <span class="caret"></span>
			    </a>
			    <ul class="dropdown-menu">
			    <#list classList as record> 
			      	<li><a href="#courseDiv" data-toggle="tab" data-type="class" data-classid="${record.classId}">${record.className}</a></li>
			  	</#list>
			    </ul>
			  </li>
			</ul>
			<div class="tab-content">
			    <div class="tab-pane active" id="courseDiv">
			    <!-- Javascript goes in the document HEAD -->
				<script type="text/javascript">
				function altRows(id){
					if(document.getElementsByTagName){  
						
						var table = document.getElementById(id);  
						var rows = table.getElementsByTagName("tr"); 
						 
						for(i = 0; i < rows.length; i++){          
							if(i % 2 == 0){
								rows[i].className = "evenrowcolor";
							}else{
								rows[i].className = "oddrowcolor";
							}      
						}
					}
				}
				window.onload=function(){
					altRows('alternatecolor');
				}
				</script>
                <table width="100%" height="" border="0" cellpadding="0" cellspacing="0" class="altrowstable" id="alternatecolor">
                	<tbody>
                    	<tr height="40">
                        	<th width="6%" align="center">课次</th>
                            <th width="13%" align="center">星期一</th>
                            <th width="13%" align="center">星期二</th>
                            <th width="13%" align="center">星期三</th>
                            <th width="13%" align="center">星期四</th>
                            <th width="13%" align="center">星期五</th>
                            <th width="13%" align="center">星期六</th>
                            <th width="13%" align="center">星期日</th>
                        </tr>
                        <tr align="center" onmouseover="this.style.backgroundColor='#f5f5f5';" onmouseout="this.style.backgroundColor='';">
                        	<td>第<br/>1<br/>2<br/>节<br/>课</td>
                            <td>${datas['1_1,2']?default("")}</td>
                            <td>${datas['2_1,2']?default("")}</td>
	                        <td>${datas['3_1,2']?default("")}</td>
	                        <td>${datas['4_1,2']?default("")}</td>
	                        <td>${datas['5_1,2']?default("")}</td>
	                        <td>${datas['6_1,2']?default("")}</td>
	                        <td>${datas['7_1,2']?default("")}</td>
                        </tr>
                        <tr align="center" align="center" onmouseover="this.style.backgroundColor='#f5f5f5';" onmouseout="this.style.backgroundColor='';">
                        	<td>第<br/>3<br/>4<br/>节<br/>课</td>
                            <td>${datas['1_3,4']?default("")}</td>
                            <td>${datas['2_3,4']?default("")}</td>
	                        <td>${datas['3_3,4']?default("")}</td>
	                        <td>${datas['4_3,4']?default("")}</td>
	                        <td>${datas['5_3,4']?default("")}</td>
	                        <td>${datas['6_3,4']?default("")}</td>
	                        <td>${datas['7_3,4']?default("")}</td>
                        </tr>
                        <tr align="center" onmouseover="this.style.backgroundColor='#f5f5f5';" onmouseout="this.style.backgroundColor='';">
                        	<td>第<br/>5<br/>6<br/>节<br/>课</td>
                            <td>${datas['1_5,6']?default("")}</td>
                            <td>${datas['2_5,6']?default("")}</td>
	                        <td>${datas['3_5,6']?default("")}</td>
	                        <td>${datas['4_5,6']?default("")}</td>
	                        <td>${datas['5_5,6']?default("")}</td>
	                        <td>${datas['6_5,6']?default("")}</td>
	                        <td>${datas['7_5,6']?default("")}</td>
                        </tr>
                        <tr align="center" onmouseover="this.style.backgroundColor='#f5f5f5';" onmouseout="this.style.backgroundColor='';">
                        	<td>第<br/>7<br/>8<br/>节<br/>课</td>
                            <td>${datas['1_7,8']?default("")}</td>
                            <td>${datas['2_7,8']?default("")}</td>
	                        <td>${datas['3_7,8']?default("")}</td>
	                        <td>${datas['4_7,8']?default("")}</td>
	                        <td>${datas['5_7,8']?default("")}</td>
	                        <td>${datas['6_7,8']?default("")}</td>
	                        <td>${datas['7_7,8']?default("")}</td>
                        </tr>
                        <tr align="center" onmouseover="this.style.backgroundColor='#f5f5f5';" onmouseout="this.style.backgroundColor='';">
                        	<td>第<br/>9<br/>10<br/>节<br/>课</td>
                            <td>${datas['1_11,12']?default("")}</td>
                            <td>${datas['2_11,12']?default("")}</td>
	                        <td>${datas['3_11,12']?default("")}</td>
	                        <td>${datas['4_11,12']?default("")}</td>
	                        <td>${datas['5_11,12']?default("")}</td>
	                        <td>${datas['6_11,12']?default("")}</td>
	                        <td>${datas['7_11,12']?default("")}</td>
                        </tr>
                        <tr align="center" onmouseover="this.style.backgroundColor='#f5f5f5';" onmouseout="this.style.backgroundColor='';">
                        	<td>第<br/>10<br/>11<br/>节<br/>课</td>
                            <td>${datas['1_10,11']?default("")}</td>
                            <td>${datas['2_10,11']?default("")}</td>
	                        <td>${datas['3_10,11']?default("")}</td>
	                        <td>${datas['4_10,11']?default("")}</td>
	                        <td>${datas['5_10,11']?default("")}</td>
	                        <td>${datas['6_10,11']?default("")}</td>
	                        <td>${datas['7_10,11']?default("")}</td>
                        </tr>
                        <tr align="center" onmouseover="this.style.backgroundColor='#f5f5f5';" onmouseout="this.style.backgroundColor='';">
                        	<td>第<br/>11<br/>12<br/>节<br/>课</td>
                            <td>${datas['1_11,12']?default("")}</td>
                            <td>${datas['2_11,12']?default("")}</td>
	                        <td>${datas['3_11,12']?default("")}</td>
	                        <td>${datas['4_11,12']?default("")}</td>
	                        <td>${datas['5_11,12']?default("")}</td>
	                        <td>${datas['6_11,12']?default("")}</td>
	                        <td>${datas['7_11,12']?default("")}</td>
                        </tr>
                    </tbody>
                </table>
	          </div>
        </div>
	</div>
	<#include "/footer.ftl" />
</body>
</html>