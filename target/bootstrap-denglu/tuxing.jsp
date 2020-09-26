<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/22
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/echarts.js"></script>
</head>
<body>
<div  id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    var arr= new Array();
    var arr2= new Array();
    $.ajax({
        url:"getsex.action",
        async:false,
        success: function (data) {
        for(var i=0;i<data.length;i++){
            arr.push(data[i].name);
            arr2.push(data[i].value);
        }

        }

        },"json")

    var myChart = echarts.init(document.getElementById('main'));
    // 显示标题，图例和空的坐标轴
    myChart.setOption({
        title: {
            text: '异步数据加载示例'
        },
        tooltip: {},
        legend: {
            data:['人数']
        },
        xAxis: {
            data: arr
        },
        yAxis: {},
        series: [{
            name: '人数',
            type: 'bar',
            data: arr2
        }]
    });

</script>
</body>
</html>
