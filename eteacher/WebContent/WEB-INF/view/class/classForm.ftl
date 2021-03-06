<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<title>教学系统教师pc端</title>
<link href="${context}/css/base.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${context}/js/jquery.min.js"></script>
<script type="text/javascript" src="${context}/js/turingLib/validator.js"></script>
<script type="text/javascript" src="${context}/js/json2form.js"></script>
<script type="text/javascript">
	var editFlag = '${editFlag?default("")}';
	$(function(){
		$('#classForm').validatorInit(function(data){
			window.location.href = 'viewListClass';
		});
		$('#className').validatorEmpty('班级名称');
		$('#specialty3').validatorEmpty('专业');
		init();
	});
	function init(){
		if(editFlag){
			$.post('getClassData',{classId:'${classId?default("")}'},function(data){
				$('#classForm').json2form({data:data});
				loadMajorData($('#specialty1'),'0',data.majorId.substring(0,2));
				loadMajorData($('#specialty2'),data.majorId.substring(0,2),data.majorId.substring(0,4));
				loadMajorData($('#specialty3'),data.majorId.substring(0,4),data.majorId);
			},'json');
		}
		else{
			loadMajorData($('#specialty1'),'0');
		}
	}
	function loadMajorData(select,parentId,value){
		select.html('<option value="">--请选择专业--</option>');
		if(parentId||parent=='0'){
			$.post('getMajorSelectData',{parentId:parentId},function(data){
				$.each(data,function(i,r){
					select.append('<option value="'+r.majorId+'">'+r.majorName+'</option>');
				});
				if(value){
					select.val(value);
				}
			},'json');
		}
	}
	function autoClassName(){
		if(!editFlag){
			var str = $('#grade').val()+'级';
			if($('#specialty3').val()){
				str += $('#specialty3 option:selected').text();
				$('#className').val(str);
			}
		}
	}
</script>
</head>
<body>
	<div class="maincont">
		<div class="title"><span>班级</span></div>
        <div class="enter-message">
            <form id="classForm" method="post" action="saveClass">
            	<input type="hidden" name="classId" />
                <div class="message-group">
                    <div class="message-left">类型：</div>
                    <div class="message-right">
                        <select id="classType" name="classType">
                            <option value="研究生">研究生</option>
                            <option value="本科" selected>本科</option>
                            <option value="专科">专科</option>
                            <option value="中专">中专</option>
                            <option value="技校">技校</option>
                        </select>               
                    </div>                   	
                </div>
                <div class="message-group">
                    <div class="message-left">年级：</div>
                    <div class="message-right">
                        <select id="grade" name="grade" onchange="autoClassName();">
                        	<option>2012</option>
                        	<option>2013</option>
                            <option>2014</option>
                            <option>2015</option>
                            <option selected="selected">2016</option>
                            <option>2017</option>
                        </select>                    
                    </div>                   	
                </div>
                <div class="message-group">
                    <div class="message-left">专业：</div>
                    <div class="message-right">
                        <select id="specialty1" onchange="loadMajorData($('#specialty2'),this.value);($('#specialty3'));">
                            <option value="">--请选择专业--</option>
                        </select>    
                        <select id="specialty2" onchange="loadMajorData($('#specialty3'),this.value);" style="margin-top:5px">
                            <option value="">--请选择专业--</option>
                        </select>      
                        <select id="specialty3" onchange="autoClassName()" name="majorId" style="margin-top:5px">
                            <option value="">--请选择专业--</option>
                        </select>                 
                    </div>                   	
                </div>
                <div class="message-group">
                    <div class="message-left">班级名称：</div>
                    <div class="message-right">
                        <input id="className" name="className" maxlength="40" placeholder="请输入班级名称" type="text" class="mess-control" value="" />
                    </div>                   	
                </div>
                <div class="btnsub">
                    <button type="submit" class="btn-submit" style="float:left;">保存</button>
                    <button type="button" class="btn-submit" style="float:right;" onclick="history.back();">返回</button>
                </div>
            </form> 
        </div>
	</div>
	<#include "/footer.ftl" />
</body>
</html>