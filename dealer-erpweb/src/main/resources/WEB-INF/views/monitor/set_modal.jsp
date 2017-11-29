<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>工作平台</title>
    <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/font-awesome.min93e3.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}/css/common.css" />
    <style>
        body {
            min-height: auto;
            padding-top: 30px;
        }

        .set-form label {
            width: 100px;
        }
        input{ display: inline-block;}
    </style>
</head>

<body>
<div class="container">
<form class="form-horizontal">
    <div class="form-group">
        <label  class="col-sm-2 control-label">放款天数</label>
        <div class="col-sm-10">
            <input type="text" class="form-control " id="day_range"/>
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">利率 =</label>
        <div class=" col-sm-10">
            <input type="text" class="form-control " id="rate" name="sysValue"  style="width: 200px;  display: inline-block;" /><label style="text-align: center; width: 100px;"> ×  基准利率</label>
        </div>
    </div>
    <div class="form-group">

        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-danger"  onclick="add()" style=" margin-right: 10px;">确定</button> <button type="reset" class="btn btn-default">取消</button>
        </div>
    </div>
</form>

</div>


<script src="${basePath}/js/jquery.min.js"></script>
<script src="${basePath}/js/bootstrap.min.js"></script>
<script src="${basePath}/js/layer/layer.js"></script>
<script>
    $(function() {
        debugger;
        $("#day_range").val(getQueryString("dayRange"));
        $("#rate").val(getQueryString("rate"));
    });
    function add(){
        debugger;
        var param =variable();
        var  urlType =getQueryString("urlType");
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        $.ajax({
            type: 'post',
            url: "${basePath}/admin/setting/"+urlType,
            data: JSON.stringify(param),
            contentType:"application/json",
            dataType: "text",
            success : function(data) {
                debugger;
                if (data == '0000') {
                    /*layer.confirm("操作成功！",function(){
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);

                    });*/
                    window.parent.location.reload(); //刷新父页面
                    parent.layer.msg("操作成功！");
                    parent.layer.close(index);


                } else {
                    layer.alert("操作失败！");
                    return false;
                }

            }
    })
    }
    function variable(){
        debugger;
        var  dayRange =$("#day_range").val();
        var  rate =$("#rate").val();
        if (dayRange==null || dayRange==""){
            layer.alert("放款天数不能为空！");
            return false;
        }
        if (rate==null|| rate ==""){
            layer.alert("利率不能为空！");
            return false;
        }
        var  id =getQueryString("id");
        var datarequest={};
        datarequest['dayRange'] = $("#day_range").val();
        datarequest['rate'] = $("#rate").val();
        datarequest['id'] = id;
        return datarequest;
    }

    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = location.search.substr(1).match(reg);
        if (r != null) return unescape(decodeURI(r[2])); return "";
    }
</script>
</body>

</html>