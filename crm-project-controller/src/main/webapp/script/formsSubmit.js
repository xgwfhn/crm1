
$(function() {  
		$('#test').datagrid({  //表格数据加载
			title: 'jQuery EasyUI---DataGrid',  
			iconCls: 'icon-save',  
			width: 900,  
			height: 350,  
			nowrap: false,  
			striped: true,  
			url: '../script/data/datagrid_data1.json',  
			sortName: 'ID',  
			sortOrder: 'desc',  
			idField: 'ID',  
			frozenColumns: [[  
				{ field: 'ck', checkbox: true },  
				{ title: 'ID', field: 'ID', width: 80, sortable: true }  
			]],  
			columns:[[   
					  {field:'productid',title:'productid',width:100},   
					  {field:'productname',title:'productname',width:100},   
					  {field:'unitcost',title:'unitcost',width:100,align:'right'},
					  {field:'status',title:'status',width:100,align:'right'},
					  {field:'listprice',title:'listprice',width:100,align:'right'},
					  {field:'Tailless',title:'Tailless',width:100,align:'right'}, 
					  {field:'itemid',title:'itemid',width:100,align:'right'}
				  ]],    
			pagination: true,  
			rownumbers: true,  
			singleSelect: false,  
			toolbar:
			[
				{  
					text: '添加',  
					iconCls: 'icon-add',  
					handler: function() {  
					//alert('添加数据')
					$('#dlg').dialog('open');//打开产品添加表单对话框	
					}  
				}, '-', {  
					text: '保存',  
					iconCls: 'icon-save',  
					handler: function() {  
					alert('保存数据')  
					}  
				}
			]  
        }); 
		//产品添加对话框初始化
		$('#dlg').dialog({
			modal : true,
			iconCls: 'icon-save',
			closed:true,
			buttons:
			[
				{
						text:'save',
						iconCls:'icon-ok',
						handler:function(){
						    $('#dataJson').val(JSON.stringify($('#dg').datagrid("getRows")));//提交前获取表格中的值,并赋值到隐藏域中,提交后easyui会自动序列化
							$('#productAddForm').submit();
						}
				},
				{
						text:'Cancel',
						handler:function(){
							 $('#dlg').dialog('close');
						}
				}
			]
		});
		//产品添加表单验证	
		$("#productAddForm").form({//内核也是调用ajax提交
			url: "formsSubmit.do",//此处不能通过?dataJson=xxx  来传递参数
            onSubmit: function () {//提交之前触发的事件，如果返回false可以防止提交
               return $("#productAddForm").form('validate');
    
            },
            success: function (data) {//表单提交成功的时候触发
            	var obj = jQuery.parseJSON(data);//将json字符串转为json对象  
            	//console.info($('#obj')); 
                if(obj.success){  
                    $.messager.alert('消息','保存成功！');  
                    $('#test').datagrid('reload');//重新加载表格数据  
                    $("#productAddForm").form("clear"); //清空表格数据 
                    //top.location.href = "main/main.html"; //转主页面
                }else{  
                    $.messager.alert('消息','保存失败！');  
                }  
            }
        });
		
		/*
	    $("#productName").next("span").click(function(){//添加产品名称事件,即给easyui自己生成的添加单击事件,而不是你自己写的,自己写的已被它隐藏掉
	        alert("ok");
	    });
	    */
	    

   });
 
var editIndex = undefined;
function endEditing(){
	if (editIndex == undefined){
		return true
	}
	if ($('#dg').datagrid('validateRow', editIndex)){
		$('#dg').datagrid('endEdit', editIndex);
		editIndex = undefined;
		return true;
	} else {
		return false;
	}
}
function onClickCell(index, field){
	if (editIndex != index){
		if (endEditing()){
			$('#dg').datagrid('selectRow', index).datagrid('beginEdit', index);
			var ed = $('#dg').datagrid('getEditor', {index:index,field:field});
			if (ed){
				($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
			}
			editIndex = index;
		} else {
			setTimeout(function(){
				$('#dg').datagrid('selectRow', editIndex);
			},0);
		}
	}
}

function onEndEdit(index, row){
	var ed = $(this).datagrid('getEditor', {
		index: index,
		field: 'productid'
	});
	row.productname = $(ed.target).combobox('getText');
}

function append(){
	if (endEditing()){
		$('#dg').datagrid('appendRow',{status:'P'});
		editIndex = $('#dg').datagrid('getRows').length-1;
		$('#dg').datagrid('selectRow', editIndex).datagrid('beginEdit', editIndex);
	}
}

function removeit(){
	if (editIndex == undefined){return}
	$('#dg').datagrid('cancelEdit', editIndex).datagrid('deleteRow', editIndex);
	editIndex = undefined;
}

function accept(){
	if (endEditing()){
		$('#dg').datagrid('acceptChanges');
	}
}

function reject(){
	$('#dg').datagrid('rejectChanges');
	editIndex = undefined;
}

function getChanges(){
	var rows = $('#dg').datagrid('getChanges');
	alert(rows.length+' rows are changed!');
}