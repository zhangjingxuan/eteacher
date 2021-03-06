<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<title>教学系统教师pc端</title>
<link href="${context}/css/base.css" rel="stylesheet" type="text/css">
<link href="${context}/js/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${context}/js/jquery.min.js"></script>
<script type="text/javascript" src="${context}/js/turingLib/validator.js"></script>
<script type="text/javascript" src="${context}/js/json2form.js"></script>
<script type="text/javascript" src="${context}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	var editFlag = '${editFlag?default("")}';
	$(function(){
		$('#workForm').validatorNormalInit(prepare);
		$('#courseId').validatorEmpty('课程');
		$('#content').validatorEmpty('作业内容');
		$('#timeLength').validatorZZS('作业时长');
		function prepare(){
			if($('#publishType2').is(':checked')){
				if($('#publishTime').val() == ''){
					alert('发布时间不能为空');
					return false;
				}
			}
			return true;
		}
		init();
	});
	function init(){
		if(editFlag){
			$.post('getWorkData',{workId:'${workId?default("")}'},function(data){
				$('#workForm').json2form({data:data});
				if(data.publishType == '01'){
					$('#publishType1').prop('checked',true);
				}
				else if(data.publishType == '03'){
					$('#publishTime').show();
				}
			},'json');
			initFile();
		}
	}
	function initFile(){
		$.post('${context}/file/getFileDatas',{dataId:'${workId?default("")}'},function(data){
			$.each(data,function(i,n){
				$('#content').after('<div>' + n.fileName + '&nbsp;&nbsp;<i style="cursor: pointer;" title="删除" class="glyphicon glyphicon-trash" onclick="removeFile(this,\''+n.fileId+'\');"></i></div>');
			});
		},'json');
	}
	function addFile(btn){
		$(btn).parent().parent().clone().appendTo('#filesDiv');
	}
	function delFile(btn){
		if($('#filesDiv').children('.fileDiv').length > 1){
			$(btn).parent().parent().remove();
		}
		else{
			$(btn).parent().prev().val('');
		}
	}
	function removeFile(btn,fileId){
		if(confirm("确定删除")){
			$.post('${context}/file/deleteFile',{fileId:fileId},function(data){
				$(btn).parent().remove();
			});
		}
	}
</script>
</head>
<body>
	<div class="maincont">
        <div class="title"><span>创建作业</span></div>
        <div class="enter-message">
            <form id="workForm" method="post" action="saveWork" enctype="multipart/form-data">
            	<input type="hidden" name="termId" value="${termId?default("")}" />
            	<input type="hidden" id="isDraft" name="isDraft" value="" />
            	<input type="hidden" name="workId" value="${workId?default("")}" />
            	<div class="message-group">
                    <div class="message-left">选择课程：</div>
                    <div class="message-right">                	
                        <select id="courseId" name="courseId">
                            <option value="">--请选择课程--</option>
                            <#list courseList as course> 
								<option value="${course.courseId}" <#if course.courseId == courseId?default("")>selected="selected"</#if>>${course.courseName}</option>
							</#list>
                        </select>
                    </div>                   	
                </div>
                <div class="message-group">
                    <div class="message-left">作业内容：</div>
                    <div class="message-right" id="filesDiv">
                    	<textarea id="content" name="content" maxlength="200" placeholder="作业内容（不超过200字）" style="margin-bottom:10px;"></textarea>
                    	<div class="message-wrap fileDiv">
	                        <input name="files" type="file" class="mess-control" style="width:60%;float:left;" />
	                        <div id="toolbar" class="btn-group" style="float:left;margin-left:5px">
							    <button type="button" class="btn btn-default" style="height:34px;" title="新增" onclick="addFile(this);">
							        <i class="glyphicon glyphicon-plus"></i>
							    </button>
							    <button type="button" class="btn btn-default" style="height:34px;" title="删除" onclick="delFile(this);">
							        <i class="glyphicon glyphicon-remove"></i>
							    </button>
							</div>
						</div>
                    </div>                   	
                </div>
                <div class="message-group">
                    <div class="message-left">作业时长：</div>
                    <div class="message-right">
                        <input id="timeLength" name="timeLength" type="text" class="mess-control" style="width:20%;" /> 天
                    </div>                   	
                </div>                
                <div class="message-group">
                    <div class="message-left">发布方式：</div>
                    <div class="message-right">
                    	<div class="radio">
						  <label>
						    <input type="radio" id="publishType1" name="publishType" value="02" checked onclick="$('#publishTime').hide();$('#publishTime').val('')">立即发布
						  </label>
						  <label>
						    <input type="radio" id="publishType2" name="publishType" value="03" onclick="$('#publishTime').show();">预约发布
						  </label>
						  <input id="publishTime" name="publishTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text" class="mess-control" placeholder="请选择发布时间" style="width:37%;display:none" />         
						</div>
                    </div>                   	
                </div> 
                <div class="btnsub">
                	<button type="submit" class="btn-submit" onclick="$('#isDraft').val('true');">草稿</button>
                    <button type="submit" class="btn-submit">保存</button>
                    <button type="button" class="btn-submit" onclick="history.back();">返回</button>
                </div>
            </form> 
        </div>
    </div>
	<#include "/footer.ftl" />
</body>
</html>