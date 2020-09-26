<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/16
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap-table.js"></script>
    <script type="text/javascript" src="js/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript" src="js/as.js"></script>
    <script type="text/javascript" src="js/toastr.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/bootstrap-table.css">
    <link rel="stylesheet" href="css/toastr.min.css">
    <%--<!-- 分页插件 -->
    <script type="text/javascript" src="js/bootstrap-table-locale-all.min.js"></script>--%>
</head>
<body>
<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
        <div class="panel-heading">查询条件</div>
        <div class="panel-body">
            <form id="formSearch" class="form-horizontal" >
                <div class="form-group" style="margin-top:15px">
                    <label class="control-label col-sm-1" for="yonghuname">姓名</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="yonghuname">
                    </div>
                    <label class="control-label col-sm-1" for="phone">电话</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="phone">
                    </div>
                    <div class="col-sm-4" style="text-align:left;">
                        <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div id="toolbar" class="btn-group">
        <button id="btn_add" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_edit" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
        </button>
        <button id="btn_delete" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>
    <table id="table"></table>
</div>

<%--添加窗口--%>
<div class="modal fade" id="loginModalId" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×
                </button>
                <h4 class="modal-title" id="myModalLabel">添加员工：</h4>
            </div>
            <div class="modal-body">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon">用户姓名：</span>
                    <input type="text" class="input-sm" id="yonghunames" name="yonghuname" aria-describedby="basic-addon3" placeholder="admin">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="sexs">性别：</span>
                    <input type="text" class="input-sm" id="sex" name="sex" aria-describedby="basic-addon3" placeholder="请输入性别">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon3">生日：</span>
                    <input type="text" class="input-sm" id="birthday" name="birthday" aria-describedby="basic-addon3" placeholder="请输入生日">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon4">电话：</span>
                    <input type="text" class="input-sm" id="phones" name="phone" aria-describedby="basic-addon3" placeholder="请输入电话">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="loginModalYesId">添加</button>
            </div>
        </div>
    </div>
</div>
<%--编辑串口--%>
<div class="modal fade"  id="loginxiugai" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×
                </button>
                <h4 class="modal-title" id="myModalLabelxiugai">编辑员工：</h4>
            </div>
            <div class="modal-body">
                <input type="text" style="display: none" id="yids">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">用户姓名：</span>
                    <input type="text" class="input-sm" id="yonghunamess" name="yonghuname" aria-describedby="basic-addon3" placeholder="请输入用户姓名">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="sexss">性别：</span>
                    <input type="text" class="input-sm" id="sexsss" name="sex" aria-describedby="basic-addon3" placeholder="请输入性别">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon3s">生日：</span>
                    <input type="text" class="input-sm" id="birthdays" name="birthday" aria-describedby="basic-addon3" placeholder="请输入生日">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon4s">电话：</span>
                    <input type="text" class="input-sm" id="phoness" name="phone" aria-describedby="basic-addon3" placeholder="请输入电话">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="loginModalYesIdxiugai">编辑</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
   $(function () {
    a()
   })
     function a () {
            $('#table').bootstrapTable({
                url: 'yonghu.action',         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
               pagination: true,                   //是否显示分页（*）*/
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                buttonsAlign: "right", //按钮对齐方式
                queryParamsType:'',
                queryParams: queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 5,                       //每页的记录行数（*）
                pageList: [5, 10, 15],        //可供选择的每页的行数（*）
            /*    search: true,    */                 //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: false,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                     height:300,                 //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "yid",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                columns: [{
                    checkbox: true
                }, {
                    field: 'yid',
                    title: 'yid'
                }, {
                    field: 'yonghuname',
                    title: '姓名'
                }, {
                    field: 'sex',
                    title: '性别'
                }, {
                    field: 'birthday',
                    title: '生日'
                }, {
                        field: 'phone',
                        title: '电话'
                    },]
            });
        //得到查询的参数
        function queryParams (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                pageSize: params.pageSize,   //页面大小
                pageNumber: params.pageNumber,  //页码
                yonghuname: $("#yonghuname").val(),
                phone:$("#phone").val(),
            };
            return temp;
        };
    }
    //搜索
   $("#btn_query").click(function () {
       $("#table").bootstrapTable('refresh');
   })
    //删除
    $("#btn_delete").click(function () {
        // 获取当前行
        var row=$("#table").bootstrapTable('getSelections');
        if (row.length<=0) {
            toastr.warning('请选择有效数据');
                             return;
                        }
            var ids=row[0].yid;
                     Ewin.confirm({ message: "确认要删除选择的数据吗？" }).on(function (e) {
                             if (!e) {
                                     return;
                                 }
                             $.ajax({
                                     type: "post",
                                     url: "delyonghu.action",
                                     data: { "ids": ids },
                                 success: function (data, status) {
                                         if (data>=1) {
                                             $("#table").bootstrapTable('refresh');
                                             toastr.success('删除数据成功');

                                             }
                                     },
                                 error: function () {
                                         toastr.error('Error');
                                     },
                                 complete: function () {
                                     }
                             });
                         });
                 });
   //添加
   //打开添加界面
    $("#btn_add").click(function () {
        $('#loginModalId').modal('show');
    })
    //添加成功按钮
    $("#loginModalYesId").click(function () {
        var yonghuname=$("#yonghunames").val();
        var sex=$("#sex").val();
        var birthday=$("#birthday").val();
        var phone=$("#phones").val();
        $.ajax({
            type: "post",
            url: "addyonghu.action",
            data: { "yonghuname": yonghuname,"sex":sex,"birthday":birthday,"phone":phone},
            success: function (data, status) {
                if (data==1) {
                   // alert(data)
                    toastr.success('添加成功');
                    $("#table").bootstrapTable('refresh');
                    $('#loginModalId').modal('hide');
                }
            },
            error: function () {
                toastr.error('Error');
            },
            complete: function () {

            }
        });
    })
   //打开编辑界面
   $("#btn_edit").click(function () {
       // 获取当前行
       var row=$("#table").bootstrapTable('getSelections');
       if (row.length<=0) {
           toastr.warning('请选择有效数据');
           return;
       }
       var yid=row[0].yid;
      // alert(yid)
       $.ajax({
           type: "get",
           url: "getid.action",
           data: {"yid":yid},
           success: function (data, status) {
               $("#yids").val(data.yid);
             $("#yonghunamess").val(data.yonghuname);
               $("#sexsss").val(data.sex);
               $("#birthdays").val(data.birthday);
               $("#phoness").val(data.phone);
           },
           error: function () {
               toastr.error('Error');
           },
           complete: function () {

           }
       })
       $('#loginxiugai').modal('show');
   })
   $("#loginModalYesIdxiugai").click(function () {
       var yid=$("#yids").val();
       var yonghuname=$("#yonghunamess").val();
       var sex=$("#sexsss").val();
       var birthday=$("#birthdays").val();
       var phone=$("#phoness").val();
       $.ajax({
           type: "post",
           url: "Updatayonghu.action",
           data: { "yid":yid,"yonghuname": yonghuname,"sex":sex,"birthday":birthday,"phone":phone},
           success: function (data, status) {
               if (data==1) {
                   // alert(data)
                   toastr.success('修改成功');

                   $('#loginxiugai').modal('hide');
                   $("#table").bootstrapTable('refresh');
               }
           },
           error: function () {
               toastr.error('Error');
           },
           complete: function () {


           }
       });
   })

</script>
</body>
</html>
