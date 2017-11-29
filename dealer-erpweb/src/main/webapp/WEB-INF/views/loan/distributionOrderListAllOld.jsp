<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>卖钱翁金融网站后台管理—分销订单列表</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/tableutils.js"></script>
</head>
<body class="main-bg">
<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li><a class="link-01" href="${basePath}/admin/layout/main.html">主页</a></li>
        <li><a class="link-01" href="${basePath}/admin/loan/loanerListAll.html">分销订单管理</a></li>
    </ul>
</div>
<div class="main-con">
    <div class="filter-area">
        <form class="form-inline">
            <div class="row mar-b-10">
                <div class="form-group col-sm-3" style="width: 25%">
                    <label>状态：</label>
                    <select class="form-control" id="status" name="status" onchange="select();">
                        <option value="0">未处理</option>
                        <option value="1">已处理</option>
                        <option value="6">二次对接中</option>
                        <option value="7">二次对接失败</option>
                        <option value="8">二次对接成功</option>
                    </select>
                </div>
            </div>
        </form>
    </div>

    <div class="table-area" id="con_one_1">
        <table border="0" cellspacing="0" cellpadding="0"
               class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
            <tr>
                <th>姓名</th>
                <th>性别</th>
                <th>手机号码</th>
                <th>贷款类型</th>
                <th>返款方式</th>
                <th>还款期数</th>
                <th>借款金额</th>
                <th>所在地</th>
                <th>品牌</th>
                <th>上牌</th>
                <th>车辆里程</th>
                <th>状态</th>
                <th>申请时间</th>
                <th>操作</th>
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
        var status = $("#status").val();
        if ("" != status && null != status) {
            var param = {
                status: status
            };
            onLoadDate(param);
        } else {
            onLoadDate(null);
        }
    }
    function openLayer(id) {
        layer.open({
            type: 2,
            area: ['700px', '338px'],
            fix: true,
            title: '修改对接状态',
            maxmin: true,
            content: '${basePath}/admin/distributionOrderController/distributionOrderEditPage?id=' + id
        });
    }
    function onLoadDate(param) {
        var writetablefn = function (data) {
            var context;

            var status = "----";
            var linkUrl = "----";
            if (data.status == "1") {
                status = "已处理";
            } else if (data.status == "0") {
                var url = "${basePath}/admin/customer/goAddLoanerInfo.html?name=" + data.customer +
                        "&tel=" + data.tel + "&idCard=" + data.identifyId + "&openId=" + data.openId +
                        "&orderId=" + data.orderId;
                status = "未处理";
                linkUrl = "<a href='" + url + "' class='link-01'>完善资料</a>";
            } else if (data.status == "6") {
                var url2 = "${basePath}/admin/customer/goAddLoanerInfo.html?name=" + data.customer +
                        "&tel=" + data.tel + "&idCard=" + data.identifyId + "&openId=" + data.openId +
                        "&orderId=" + data.orderId;
                status = "二次对接中";
                linkUrl = "<a href='javascript:void(0);' class='link-01' onclick='openLayer(" + data.id + ");'>修改对接状态</a>";
            } else if (data.status == "7") {
                status = "二次对接失败";
            } else if (data.status == "8") {
                status = "二次对接成功";
            }


            context = "<tr>" +
                    "<td align='center' title='orderId:["+ data.orderId+"]openId:["+data.openId+"]'>" +
                    data.customer + "</td>" +
                    "<td align='center'>" + data.sex + "</td>" +
                    "<td align='center' title='身份证：["+ data.identifyId+"]'>" + data.tel + "</td>" +
                    "<td align='center'>" + data.loanType + "</td>" +
                    "<td align='center'>" + data.repayType + "</td>" +
                    "<td align='center'>" + data.repayPeriods + "</td>" +
                    "<td align='center'>" + data.loanMoney + "</td>" +
                    "<td align='center'>" + data.province +" " + data.city + "</td>" +
                    "<td align='center' title='车系：" + data.carSeries + "]车型：["+ data.carModel+"]'>" + data.carBrand + "</td>" +
                    "<td align='center'>" + data.carYear +"年" + data.carMonth+ "月</td>" +
                    "<td align='center'>" + data.carMile + "</td>" +
                    "<td align='center' title='备注："+data.remark+"'>" + status + "</td>" +
                    "<td align='center'>" + data.createdAt + "</td>" +
                    "<td align='center'>"+linkUrl+"</td>" +
                    "</tr>";
            return context;
        };

        pageComm("${basePath}/admin/distributionOrderController/distributionOrderPageList", param == null ? {} :
                param, writetablefn, "record", 19);
    }

    var param = function () {
        return {
            "status": $("#status").val()
        };
    };

    function select() {
        onLoadDate(param());
    }

</script>
</html>
