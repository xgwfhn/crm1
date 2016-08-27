 $.extend($.fn.validatebox.defaults.rules, {//自定义扩展验证规则
	numberId: {//thanks xiaoj
        validator:function (value, param) {           
        	if(!/^\d{8}$/g.test(value)){
                $.fn.validatebox.defaults.rules.numberId.message = '请输入8位编码';
                return false;
            }else{
            	/*
            	$.ajax({ 
                     url:url,
                     data:data,
                     async:false,
                     type:"POST",
                     success:function(result){
                         if(result>0){
                             $.fn.validatebox.defaults.rules.numberId.message = '工号已注册';
                             st=false;
                         }else{
                             st=true;
                         }
                     }
 				 });
                 return st;
                 */
            	return true;
			}
			message: ''
		}
	}
 });
 
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
            url: 'add1.do',	//此处也不需要表单序列化 后台可以获取到
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
 