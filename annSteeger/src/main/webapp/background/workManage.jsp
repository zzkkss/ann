<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="screen" href="jscss/jquery-ui/jquery-ui.theme.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="jscss/jqGrid/css/ui.jqgrid.css" />
<script src="jscss/jqGrid/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="jscss/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
<script src="jscss/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>

<script src="jscss/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
		<link href="jscss/AjaxFileUploader/ajaxfileupload.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="jscss/AjaxFileUploader/ajaxfileupload.js"></script>
	<script src="jscss/Validform_v5.3.2/Validform_v5.3.2_min.js" type="text/javascript"></script>
	
		
	<script type="text/javascript" src="jscss/tinymce/tinymce.min.js"></script>
<script>
	tinymce.init({
		selector:'textarea',
		language : 'zh_CN'});
	
	
</script>
<script type="text/javascript">
$(function() {
	$(".consoleForm").Validform({
		tiptype:2
	});
});
var selectedRowid;
$(document).ready(function(){
    jQuery("#list1").jqGrid({
       	url:"workByJqgrid.do",
    	datatype: "json",
    	height: "80%",
    	autowidth:true,
    	
       	colNames:['ID','工作职位','工作地点','招聘人数','图片链接','发表时间','工作内容'],
       	colModel:[
			{name:'id',index:'Id', width:50,hidden:true,editoptions:{defaultValue:0}},
       		{name:'name',index:'name', width:50,editable:true},
       		{name:'place',index:'place', width:50,editable:true},
       		{name:'quantity',index:'quantity', width:50,editable:true},
       		{name:'imgpath',index:'imgpath', width:50,editable:true},
       		{name:'addtime',index:'addtime', width:50,sortable:false,editable:false,formatter:timeformat},
       		{name:'content',index:'content', editable:true}
       	],
       	rowNum:10,
       	rowList:[10,20,30],
       	jsonReader: {  
            root:"entity",        // 数据行（默认为：rows）  
            page: "page",      // 当前页  
            total: "totalPages",  // 总页数  
            records: "totalRecords",  // 总记录数  
            repeatitems : false        // 设置成false，在后台设置值的时候，可以乱序。且并非每个值都得设  
        },  
        prmNames:{rows:"rows",page:"page",sort:"sort",order:"order", oper:"oper",},
       	pager: '#pager1',
       	sortname: 'Id',
        viewrecords: true,
        sortorder: "desc",
      //  caption:"招聘管理",
        editurl:"workEditByJqgrid.do",
        onSelectRow:function(rowid,status){
        	selectedRowid=rowid;
        }

    });
    jQuery("#list1").jqGrid('navGrid','#pager1',{edit:false,add:false,del:false,search:false}, {}, {}, {}, {}
    );	
    // 配置对话框  
    $("#consoleDlg").dialog({  
        autoOpen: false,      
        modal: true,    // 设置对话框为模态（modal）对话框  
        resizable: true,      
        width: 800,  
        buttons: {  // 为对话框添加按钮  
            "取消": function() {$("#consoleDlg").dialog("close")},  
            "创建": addContact,  
            "保存": updateContact,  
            "删除": deleteContact  
        }  
    });  
	}); 

var openDialog4Adding = function() {  
    var consoleDlg = $("#consoleDlg");  
    var dialogButtonPanel = consoleDlg.siblings(".ui-dialog-buttonpane");  
    consoleDlg.find("input").removeAttr("disabled").val("");  
    dialogButtonPanel.find("button:not(:contains('取消'))").hide();  
    dialogButtonPanel.find("button:contains('创建')").show(); 
    consoleDlg.dialog("option", "title", "添加职位信息").dialog("open");  
};  
var openDialog4Updating = function() {  
    var consoleDlg = $("#consoleDlg");  
    var dialogButtonPanel = consoleDlg.siblings(".ui-dialog-buttonpane");  
      
    consoleDlg.find("input").removeAttr("disabled");  
    dialogButtonPanel.find("button:not(:contains('取消'))").hide();  
    dialogButtonPanel.find("button:contains('保存')").show();  
    consoleDlg.dialog("option", "title", "修改职位信息");  
    loadSelectedRowData();  
};
var openDialog4Deleting = function() {  
    var consoleDlg = $("#consoleDlg");  
    var dialogButtonPanel = consoleDlg.siblings(".ui-dialog-buttonpane");  
      
    consoleDlg.find("input").attr("disabled", true);  
    dialogButtonPanel.find("button:not(:contains('取消'))").hide();  
    dialogButtonPanel.find("button:contains('删除')").show();  
    consoleDlg.dialog("option", "title", "删除职位信息");  
    loadSelectedRowData();  
};  
var loadSelectedRowData = function() {    
    var selectedRowId = $("#list1").jqGrid("getGridParam", "selrow");  
    if (!selectedRowId) {  
        alert("请先选择需要编辑的行!");  
        return false;  
    } else {  
        var params = {  
            "id" : selectedRowId  
        };  
        var actionUrl = "workById.do";  
        // 从Server读取对应ID的JSON数据  
        $.ajax( {  
        	 type:"post",
            url : actionUrl,  
            data : params,  
            dataType : "json",  
            cache : false,  
            error : function(textStatus, errorThrown) {  
                alert("系统ajax交互错误: " + textStatus);  
            },  
            success : function(data, textStatus) {  
                // 如果读取结果成功，则将信息载入到对话框中                   
                var rowData = data;  
                var consoleDlg = $("#consoleDlg");  
             /*    var name = $.trim(consoleDlg.find("#name").val());  
                var type = $.trim(consoleDlg.find("#type").val());  
                var imgpath = $.trim(consoleDlg.find("#imgpath").val());  
                var content = $.trim(consoleDlg.find("#content").val());   */
                consoleDlg.find("#selectId").val(rowData.id);  
                consoleDlg.find("#name").val(rowData.name);  
                consoleDlg.find("#place").val(rowData.place);  
                consoleDlg.find("#quantity").val(rowData.quantity);  
                
                consoleDlg.find("#imgpath").val(rowData.imgpath);  
                consoleDlg.find("#content").val(rowData.content);  
                  
                tinyMCE.get('tinyT').setContent(rowData.content);
                // 根据新载入的数据将表格中的对应数据行一并更新一下  
                var dataRow = {  
                        id : rowData.id,  
                        name : rowData.name,  
                        type : rowData.type,  
                        imgpath : rowData.imgpath,  
                        content : rowData.content  
                    };  
                  
                $("#gridTable").jqGrid("setRowData", data.id, dataRow);  
                      
                // 打开对话框  
                consoleDlg.dialog("open");  
            }  
        });  
          
    }  
};  
var addContact = function() {  
	var demo=$(".consoleForm").Validform();
	if(demo.check(false,'')){
	
    var consoleDlg = $("#consoleDlg");  
          
    var name = $.trim(consoleDlg.find("#name").val());  
    var place = $.trim(consoleDlg.find("#place").val());  
    var quantity = $.trim(consoleDlg.find("#quantity").val());  
    var imgpath = $.trim(consoleDlg.find("#imgpath").val());  
    var content = tinyMCE.get('tinyT').getContent();  
    
   /*  {name:'id',index:'Id', width:150,hidden:true,editoptions:{defaultValue:0}},
		{name:'name',index:'name', width:150,editable:true},
		{name:'type_id',index:'type_id', width:150,editable:true,edittype:'select',formatter:typeformat,editoptions:{
			value:{0:'进口果仁系列',1:'进口果干系列',2:'国产果仁系列',3:'国产蜜饯系列',4:'西梅系列',5:'罐装系列',6:'礼品装系列',7:'专卖店专有系列',8:'其他系列',9:'服务性产品'
				}}},
		{name:'imgpath',index:'imgpath', width:150,editable:true},
		{name:'addtime',index:'addtime', width:150,sortable:false,editable:false,formatter:timeformat} */
    var params = {  
		"oper":"add",
        "name":name,  
        "place":place,  
        "quantity":quantity,  
        "imgpath":imgpath,  
        "content":content, 
        "id":0
    };  
      
    var actionUrl = "workEditByJqgrid.do";
      
  $.ajax({
	  type:"post",
        url : actionUrl,  
        data : params,  
        dataType : "text",  
        cache : false,  
        error : function(textStatus, errorThrown) {  
            alert("系统ajax交互错误: " + textStatus);  
        },  
        success : function(data, textStatus) {  
            if(data == "success") {  
                var dataRow = {  
                  //  id : data.contact.id,   // 从Server端得到系统分配的id  
                    name : name,  
                    place : place,  
                    quantity : quantity,  
                    imgpath : imgpath,  
                    content : content  
                };  
                  
                var srcrowid = $("#list1").jqGrid("getGridParam", "selrow");  
                  
                if(srcrowid) {  
                    $("#list1").jqGrid("addRowData", 0, dataRow, "before", srcrowid);  
                } else {  
                    $("#list1").jqGrid("addRowData", 0, dataRow, "first");  
                }  
                consoleDlg.dialog("close");  
                  
                  
            } else {  
                alert("添加操作失败!");  
            }  
        }  
    });  
	}else{
		//alert("请检查表单！");
	}
};  
var updateContact = function() {  
	var demo=$(".consoleForm").Validform();
	if(demo.check(false,'')){
	
    var consoleDlg = $("#consoleDlg");  
      
    var pId = $.trim(consoleDlg.find("#selectId").val());  
    var name = $.trim(consoleDlg.find("#name").val());  
    var place = $.trim(consoleDlg.find("#place").val());  
    var quantity = $.trim(consoleDlg.find("#quantity").val());  
    var imgpath = $.trim(consoleDlg.find("#imgpath").val());  
    var content = tinyMCE.get('tinyT').getContent();  
    
   /*  {name:'id',index:'Id', width:150,hidden:true,editoptions:{defaultValue:0}},
		{name:'name',index:'name', width:150,editable:true},
		{name:'type_id',index:'type_id', width:150,editable:true,edittype:'select',formatter:typeformat,editoptions:{
			value:{0:'进口果仁系列',1:'进口果干系列',2:'国产果仁系列',3:'国产蜜饯系列',4:'西梅系列',5:'罐装系列',6:'礼品装系列',7:'专卖店专有系列',8:'其他系列',9:'服务性产品'
				}}},
		{name:'imgpath',index:'imgpath', width:150,editable:true},
		{name:'addtime',index:'addtime', width:150,sortable:false,editable:false,formatter:timeformat} */
    var params = {  
		"oper":"edit",
        "name" : name,  
        "place" : place,  
        "quantity" : quantity,  
        "imgpath" : imgpath,  
        "content" : content, 
        "id":pId
    };  
    var actionUrl = "workEditByJqgrid.do";  
    
    $.ajax( {  
    	 type:"post",
        url : actionUrl,  
        data : params,  
        dataType : "text",  
        cache : false,  
        error : function(textStatus, errorThrown) {  
            alert("系统ajax交互错误: " + textStatus);  
        },  
        success : function(data, textStatus) {  
             if (data == "success") {  
                var dataRow = {  
                    id : pId,  
                    name : name,  
                    place : place,  
                    quantity : quantity,  
                    imgpath : imgpath,  
                    content : content  
                };  
                $("#list1").jqGrid("setRowData", pId, dataRow, {color:"#FF0000"});  
                  
                  
                consoleDlg.dialog("close");  
                  
            } else {  
                alert("修改操作失败!");  
            }   
        }  
    });  
	}else{
		//alert("请检查表单！");
	}
};  
var deleteContact = function() {  
    var consoleDlg = $("#consoleDlg");  
      
    var pId = $.trim(consoleDlg.find("#selectId").val());  
    var params = {  
    		"oper":"del",
        "id" : pId  
    };  
    var actionUrl = "workEditByJqgrid.do";  
    $.ajax({  
    	 type:"post",
        url : actionUrl,  
        data : params,  
        dataType : "text",  
        cache : false,  
        error : function(textStatus, errorThrown) {  
            alert("系统ajax交互错误: " + textStatus);  
        },  
        success : function(data, textStatus) {  
            if (data == "success") {  
                $("#list1").jqGrid("delRowData", pId);  
                  
                consoleDlg.dialog("close");  
            } else {  
                alert("删除操作失败!");  
            }  
        }  
    });  
};  
function timeformat(e){
	return new Date(e).toLocaleString();
}
</script>
<script type="text/javascript">
	
    var count = 1;  
    /** 
    * 生成多附件上传框 
    */  
    function createInput(parentId){  
        count++;  
        var str = '<div name="div" ><font style="font-size:12px;">附件</font>'+  
        '   '+ '<input type="file" contentEditable="false" id="file' + count + '' +  
        '" name="file'+ count +'"  value="" style="width: 220px"/><input type="button"  value="删除" onclick="removeInput(event,'+"'more'"+')" />'+'</div>';  
        document.getElementById(parentId).insertAdjacentHTML("beforeEnd",str);  
    }  
    /** 
    * 删除多附件删除框 
    */  
    function removeInput(evt, parentId){  
       var el = evt.target == null ? evt.srcElement : evt.target;  
       var div = el.parentNode;  
       var cont = document.getElementById(parentId);         
       if(cont.removeChild(div) == null){  
        return false;  
       }  
       return true;  
    }  
    function addOldFile(data){  
        var str = '<div name="div' + data.name + '" ><a href="#" style="text-decoration:none;font-size:12px;color:red;" onclick="removeOldFile(event,' + data.id + ')">删除</a>'+  
        '   ' + data.name +   
        '</div>';  
        document.getElementById('oldImg').innerHTML += str;  
    }  
      
    function removeOldFile(evt, id){  
        //前端隐藏域，用来确定哪些file被删除，这里需要前端有个隐藏域  
        $("#imgIds").val($("#imgIds").val()=="" ? id :($("#imgIds").val() + "," + id));  
        var el = evt.target == null ? evt.srcElement : evt.target;  
        var div = el.parentNode;  
        var cont = document.getElementById('oldImg');      
        if(cont.removeChild(div) == null){  
            return false;  
        }  
        return true;  
    }  
    function ajaxFileUploadImg(id){ 
    	$(document)
			.ajaxStart(function(){
			 var consoleDlg = $("#consoleDlg");  
			 var dialogButtonPanel = consoleDlg.siblings(".ui-dialog-buttonpane");  
			 dialogButtonPanel.find("button:contains('创建')").hide(); 
			$("#loading").show();
		})
		.ajaxComplete(function(){
			 var consoleDlg = $("#consoleDlg");  
			 var dialogButtonPanel = consoleDlg.siblings(".ui-dialog-buttonpane");  
			 dialogButtonPanel.find("button:contains('创建')").show(); 
			$("#loading").hide();
		});
        //获取file的全部id  
        var uplist = $("input[name^=file]");  
    var file = [];  
    for (var i=0; i< uplist.length; i++){  
        if(uplist[i].value){  
        	file[i] = uplist[i].id;  
        }  
        }  
    $.ajaxFileUpload({  
        url:'worksImgUpload.do',  
        secureuri:false,  
        fileElementId: file,  //这里不在是以前的id了，要写成数组的形式哦！  
        fileElementName: "file",  //这里不在是以前的id了，要写成数组的形式哦！  
        dataType: 'text',  
        data: {  
                     //需要传输的数据  
                },  
        success: function (data){  
        	$("#imgpath").val(data);
        },  
        error: function(data){  
        }  
    });  
}
	</script>	
	<style type="text/css">
	/*==========以下部分是Validform必须的===========*/
.Validform_checktip{
	margin-left:8px;
	line-height:20px;
	height:20px;
	overflow:hidden;
	color:#999;
	font-size:12px;
}
.Validform_right{
	color:#71b83d;
	padding-left:20px;
	background:url(jscss/Validform_v5.3.2/Validform_v5.3.2/demo/images/right.png) no-repeat left center;
}
.Validform_wrong{
	color:red;
	padding-left:20px;
	white-space:nowrap;
	background:url(jscss/Validform_v5.3.2/Validform_v5.3.2/demo/images/error.png) no-repeat left center;
}
.Validform_loading{
	padding-left:20px;
	background:url(jscss/Validform_v5.3.2/Validform_v5.3.2/demo/images/onLoad.gif) no-repeat left center;
}
.Validform_error{
	background-color:#ffe7e7;
}
#Validform_msg{color:#7d8289; font: 12px/1.5 tahoma, arial, \5b8b\4f53, sans-serif; width:280px; -webkit-box-shadow:2px 2px 3px #aaa; -moz-box-shadow:2px 2px 3px #aaa; background:#fff; position:absolute; top:0px; right:50px; z-index:99999; display:none;filter: progid:DXImageTransform.Microsoft.Shadow(Strength=3, Direction=135, Color='#999999');}
#Validform_msg .iframe{position:absolute; left:0px; top:-1px; z-index:-1;}
#Validform_msg .Validform_title{line-height:25px; height:25px; text-align:left; font-weight:bold; padding:0 8px; color:#fff; position:relative; background-color:#000;}
#Validform_msg a.Validform_close:link,#Validform_msg a.Validform_close:visited{line-height:22px; position:absolute; right:8px; top:0px; color:#fff; text-decoration:none;}
#Validform_msg a.Validform_close:hover{color:#cc0;}
#Validform_msg .Validform_info{padding:8px;border:1px solid #000; border-top:none; text-align:left;}
	
#atop {
  background-color: #eef1f7;
  display: block;
  height: 70px;
}
#atop div:hover{
background-image: url('background/images/background_xuan_0000s_0000s_0001_filter-active-bg.png');
}
#atop div {
  display: inline-block;
  height: 20px;
  text-align: center;
  width: 72px;
  cursor: pointer;
  position: relative;
  top:24px;
}
</style>
<title>招聘管理</title>
</head>
<body>
<div id="atop">
<!-- <div class="atopd" id="atopd0"><a href="background/aticleManage.jsp?type=0">全部</a></div>
<div class="atopd" id="atopd1"><a href="background/aticleManage.jsp?type=1">时尚生活</a></div>
<div class="atopd" id="atopd2"><a href="background/aticleManage.jsp?type=2">食品妙用</a></div>
<div class="atopd" id="atopd3"><a href="background/aticleManage.jsp?type=3">品牌动态</a></div> -->
</div>
<table id="list1" ></table> <div id="pager1"></div>
<div>
		<button onclick="openDialog4Adding()">添加职位</button>
		<button onclick="openDialog4Updating()">修改职位</button>
		<button onclick="openDialog4Deleting()">删除职位</button>
	</div>
	<div id="consoleDlg" >
		<div id="formContainer">
			<form id="consoleForm" class="consoleForm">
				<input type="hidden" id="selectId" />
				<table class="formTable">
					<tr>
						<th>职位名称：</th>
						<td><input type="text" class="textField" id="name"
							name="name" datatype="*" /></td>
							<td><div class="Validform_checktip"></div></td>
					</tr>
					<tr>
						<th>工作地点：</th>
						<td><input type="text" class="textField" id="place"
							name=place datatype="*" /></td>
							<td><div class="Validform_checktip"></div></td>
					</tr>
					<tr>
						<th>招聘人数：</th>
						<td><input type="text" class="textField" id="quantity"
							name="quantity" datatype="n" /></td>
							<td><div class="Validform_checktip"></div></td>
					</tr>
					<tr>
						<th>工作内容：</th>
						<td><input type="text" class="textField" id="content"
							name="content" style="display:none"/>
							 <textarea id="tinyT" name="tinyT" datatype="*">&lt;p&gt;输入内容&lt;/p&gt;</textarea></td>
					<td><div class="Validform_checktip"></div></td>
					</tr>
					
					<tr>
						<th>图片路径：</th>
						<td><input type="text" class="textField" id="imgpath"
							name="imgpath" readonly="readonly" datatype="*"/></td>
					</tr>
					
				</table>
			</form>
					图片上传：
					<button class="button" id="buttonUpload" onclick="return ajaxFileUploadImg();">上传</button>
					<button class="button" id="" onclick="createInput('more')">添加图片</button>
					<div id="more"></div>
					<img id="loading" class="loading" src="jscss/AjaxFileUploader/loading.gif" style="display:none;">  
	
		</div>
	</div>
</body>
</html>