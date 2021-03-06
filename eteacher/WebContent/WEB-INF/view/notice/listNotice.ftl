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
	var noticeTable;
	$(function(){
		noticeTable = $('#noticeTable').bootstrapTable({
		    url: 'getNoticeListData',
		    striped : true,
		    toolbar : '#toolbar',
		    queryParams : function(params){
		    	params.ckb1 = $('#ckb1').prop('checked');
		    	params.ckb2 = $('#ckb2').prop('checked');
		    	return params;
		    },
		    columns: [{
		        title: '序号',
		        align: 'center',
		        formatter : function (value, row, index){
		        	return index + 1;
		        }
		    },{
		        field: 'title',
		        halign: 'center',
		        title: '通知标题'
		    }, {
		        field: 'noticeObject',
		        halign: 'center',
		        title: '通知对象'
		    }, {
		        field: 'status',
		        align: 'center',
		        title: '状态',
		        formatter : function (value, row, index){
		        	if(value == '已发布'){
		        		return '<span class="label label-success">已发布</span>';
		        	}
		        	else{
		        		return '<span class="label label-warning">未发布</span>';
		        	}
		        }
		    },{
		        field: 'publishTime',
		        align: 'center',
		        title: '发布时间'
		    },{
		        title: '操作',
		        align: 'center',
		        formatter : function (value, row, index){
		        	var oper = '';
		        	if(row.status == '未发布'){
		        		oper += '<i style="cursor: pointer;" title="立即发布" class="glyphicon glyphicon-check"></i> &nbsp;';
		        		oper += '<i style="cursor: pointer;" title="编辑" class="glyphicon glyphicon-edit"></i> &nbsp;';
		        	}
		        	oper += '<i style="cursor: pointer;" title="删除" class="glyphicon glyphicon-trash"></i>';
		        	return oper;
		        },
		        events : {
		        	'click .glyphicon-check': function (e, value, row, index) {
			            if(confirm("确定立即发布?")){
			            	$.post('publishNotice',{noticeId : row.noticeId},function(data){
				            	noticeTable.bootstrapTable('refresh');
				            });
			            }
			        },
		        	'click .glyphicon-edit': function (e, value, row, index) {
			            window.location.href = 'viewEditWork?workId=' + row.workId;
			        },
			        'click .glyphicon-trash': function (e, value, row, index) {
			        	if(confirm("确定删除?")){
			            	$.post('deleteNotice',{noticeId : row.noticeId},function(data){
				            	noticeTable.bootstrapTable('refresh');
				            });
			            }
			        }
		        }
		    } ]
		});
	});
	function add(){
		window.location.href = 'viewAddNotice';
	}
</script>
</head>
<body>
	<div class="maincont">
        <div class="title"><span>作业列表</span></div>
        <div class="enter-message">
            <div id="toolbar">
			    <button type="button" class="btn btn-default btn-sm" title="新增" onclick="add();">
			        <i class="glyphicon glyphicon-plus"></i> 新增
			    </button>
			    <label><input id="ckb1" type="checkbox" checked onchange="noticeTable.bootstrapTable('refresh');" /> 已发布</label>
			    <label><input id="ckb2" type="checkbox" checked onchange="noticeTable.bootstrapTable('refresh');" /> 未发布</label>
			</div>                          
            <table id="noticeTable"></table>
        </div>
    </div>
	<#include "/footer.ftl" />
</body>
</html>