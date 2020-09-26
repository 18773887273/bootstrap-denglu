<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/17
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    $(function(){
         a();

     });
    function a () {
            $('#userListTable').bootstrapTable({
                     url: "/user/getUserList/",
                     method:"post",
                    dataType: "json",
                     contentType:  "application/x-www-form-urlencoded",
                     striped:true,//隔行变色
                     cache:false,    //是否使用缓存
                     showColumns:false,// 列
                     toobar:'#toolbar',
                    pagination: true, //分页
                    sortable: false,                     //是否启用排序
                singleSelect: false,
                     search:false, //显示搜索框
                     buttonsAlign: "right", //按钮对齐方式
                     showRefresh:false,//是否显示刷新按钮
                     sidePagination: "server", //服务端处理分页
                     pageNumber:"1",
                     pageSize:"15",
                     pageList:[10, 25, 50, 100],
                     undefinedText:'--',
                     uniqueId: "id",  //每一行的唯一标识，一般为主键列
                     queryParamsType:'',
                     queryParams: queryParams,//传递参数（*）
                     columns: [
                         {
                                 title: 'ID',
                             field: 'id',
                             align: 'center',
                             valign: 'middle',
                         },
                     {
                             title: '用户姓名',
                                 field: 'name',
                                 align: 'center',
                                 valign: 'middle',
                             },
                     {
                             title: '性别',
                                 field: 'sex',
                                 align: 'center',
                             },
                     {
                             title: '用户账号',
                                 field: 'username',
                                 align: 'center',
                             },
                         {
                             title: '手机号',
                             field: 'phone',
                             align: 'center',

                         } ,
                         {
                             title: '邮箱',
                                 field: 'email',
                                 align: 'center',
                             },
                     {
                             title: '权限',
                                 field: 'rolename',
                                 align: 'center',
                             },
                     {
                             title: '操作',
                                 field: 'id',
                                 align: 'center',
                                 formatter:function(value,row,index){
                                     var e = '<button href="#"  class="btn btn-default"  mce_href="#" onclick="edit(\''+ row.id + '\')">编辑</button> ';
                                     var d = '<button href="#"  class="btn btn-default" mce_href="#" onclick="del(\''+ row.id +'\')">删除</button> ';
                                     return e+d;
                                 }
                         }
                 ]
             });

             //得到查询的参数
             function queryParams (params) {
                     var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                             pageSize: params.pageSize,   //页面大小
                             pageNumber: params.pageNumber,  //页码
                             username: $("#search_username").val(),
                             name:$("#search_name").val(),
                            sex:$("#search_sex").val(),
                            phone:$("#search_mobile").val(),
                             email:$("#search_email").val(),
                         };
                    return temp;
               };
        }

//搜索
 function  serachUser() {
       $("#userListTable").bootstrapTable('refresh');
     }
</script>
</body>
</html>
