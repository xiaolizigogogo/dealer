<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—借款人列表</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/other.js"></script>
    <script src="${basePath}/js/tableutils.js"></script>
</head>
<body class="main-bg">
<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li><strong id="tip"></strong> 业务明细报表</li>
    </ul>
</div>
<div class="main-con">

    <div class="filter-area">
        <form class="form-inline">
            <div class="row mar-b-10">
                <div class="form-group col-sm-3" style="width: 24%">
                    <label>手机号码：</label>
                    <input type="text" class="form-control" id="mobile" name="mobile" size="15">
                </div>
                <a href="javascript:void(0)" onclick="init()" class="btn btn-01"
                   id="selectBtn">搜索</a>
            </div>
        </form>
    </div>

    <div class="table-area" id="con_one_1">
        <table border="0" cellspacing="0" cellpadding="0"
               class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
            <tr>
                <th>客户经理姓名</th>
                <th>手机号码</th>
                <th>本月放款笔数</th>
                <th>本月放款金额</th>
                <th>所属公司</th>
                <th>所属部门</th>
            </tr>
            <tbody id="record"></tbody>
        </table>
    </div>
    <div id="r-page"></div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        init();
    });

    function init() {
        var mobile = $("#mobile").val();

        if ("" != mobile && null != mobile) {
            var param = {
                "mobile": mobile
            };
            onLoadDate(param);
        } else {
            onLoadDate(null);
        }
    }

    function onLoadDate(param) {
        var writetablefn = function (data) {

            var month = data.cycle;
            $("#tip").text(month);
            var context;
            $("#checkAll").prop("checked", false);

            context = "<tr>" +
                    "<td align='center' title= '查看借款详情'><a class='link-01' href='#'>" + data.realname + "</a></td>" +
                    "<td align='center'>" + data.mobile + "</td>" +
                    "<td align='center'>" + data.loanMonthCount + "</td>" +
                    "<td align='center'>" + data.loanMonthMoney + "</td>" +
                    "<td align='center'>" + data.company.name + "</td>" +
                    "<td align='center'>" + data.dept.name + "</td>" +
                    "</tr>";
            return context;
        };

        pageComm("${basePath}/admin/loan/queryBusinessDetailPage", param == null ? {} : param,
                writetablefn, "record", 6);
    }

    var param = function () {
        return {
            "mobile": $("#mobile").val()
        };
    };

    function reset() {
        $("#mobile").val("");
    }
</script>
</html>
