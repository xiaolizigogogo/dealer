<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">

    <title>e车贷管理系统—缓存列表</title>
    <%@include file="../common/taglibs.jsp" %>
</head>
<body class="main-bg">
<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li>缓存列表</li>
    </ul>
</div>
<div class="main-con">

    <div class="tool-bar clearfix">
        <ul>
            <li><a href="javascript:void(0);" onclick="deleteUserInfo()" class="del">删除</a></li>
        </ul>
    </div>
    <div class="table-area" id="con_one_1">
        <table border="0" cellspacing="0" cellpadding="0"
               class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
            <tr>
                <th><input type='checkbox' name='checkboxAll' id="checkAll"
                           onclick="selectAll()" />
                </th>
                <th>缓存名称</th>
                <th>读取命中次数</th>
                <th>读取失效次数</th>
                <th>读取总命中率</th>
                <%--<th>内存中对象数</th>--%>
                <%--<th>硬盘中对象数</th>--%>
                <%--<th>内存中占有（KB）</th>--%>
                <%--<th>操作</th>--%>
            </tr>
            <tbody id="record">
            <c:forEach items="${cacheManager}" var="cm">
                <tr>
                    <td align="center"><input type='checkbox' onclick='paramClick()'
                                              name='checkbox1'
                                              value='${cm.cacheName}'></td>
                    <td align="center">${cm.cacheName}</td>
                    <td align="center">${cm.cacheHitCount}</td>
                    <td align="center">${cm.cacheMissCount}</td>
                    <td align="center">${cm.cacheHitPercent}</td>
                        <%--<td></td>--%>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<script type="text/javascript">

    function deleteUserInfo() {
        var checkbox = $('input[name="checkbox1"]:checked');
        var checkLength = checkbox.length;
        if (checkLength == 0) {
            layer.msg("请选择一行数据进行删除！");
            return;
        }
        var checkValues = [];
        var i = 0;
        checkbox.each(function () {
            checkValues[i] = this.value;
            i++;
        });
        layer.confirm("你确定删除吗？", {icon: 3, title: '提示'}, function () {
            $.ajax({
                type: 'POST',
                url: '${basePath}/admin/monitor/ehcache/clear.html',
                data: {cacheNames: checkValues},
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                            window.location.href = "${basePath}/admin/monitor/ehcache.html";
                            return true;
                        });
                    } else {
                        layer.msg("操作失败!");
                        return false;
                    }
                }, error: function () {
                    layer.msg("网络错误!");
                    return false;
                }
            });
        });
    }

    /**
     * 全部选中或取消全选
     */
    function selectAll() {
        var isChecked = $("#checkAll").prop("checked");
        if (isChecked) {
            $("[name='checkbox1']").prop("checked", true);//全选
        } else {
            $("[name='checkbox1']").prop("checked", false);//取消全选
        }
    }

    /**
     * 判断子选则框是否有全部选中。如果没有则去将全选的checkbox置为false
     */
    function paramClick() {
        var boxLength = $("[name='checkbox1']").length;
        var checkLength = $("input[name='checkbox1']:checked").length;
        if (boxLength == checkLength && boxLength != 0) {
            $("#checkAll").prop("checked", true);
        } else {
            $("#checkAll").prop("checked", false);
        }
    }

</script>
</html>
