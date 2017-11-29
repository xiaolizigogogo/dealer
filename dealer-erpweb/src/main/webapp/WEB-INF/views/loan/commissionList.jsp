<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>卖钱翁金融网站后台管理—佣金管理</title>
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
        <li><a class="link-01" href="#">佣金管理</a></li>
    </ul>
</div>
<div class="main-con">
    <form class="form-inline">
        <div class="filter-area">
            <label> &nbsp;&nbsp;&nbsp;&nbsp;查询条件:</label>
            <div class="form-group col-sm-3" style="width: 15%">
                <select class="form-control" id="conditionKey" name="conditionKey">
                    <option value="" selected="selected">--请选择--</option>
                    <option value="idCard">业务员身份证</option>
                    <option value="openId">分销员标识</option>
                    <option value="customerName">借款人姓名</option>
                    <option value="nickname">业务员姓名</option>
                    <option value="orderId">分销流水号</option>
                </select>
            </div>
            <label> 查询值:</label>
            <div class="form-group col-sm-3" style="width: 14%">
                <input type="text" class="form-control" id="conditionValue" name="conditionValue"
                       size="15">
            </div>
            <label>结清状态:</label>
            <div class="form-group col-sm-3" style="width:10%">
                <select class="form-control" id="isEnded" name="isEnded">
                    <option value="" selected="selected">--请选择--</option>
                    <option value=0>未结清</option>
                    <option value=1>已结清</option>
                </select>
            </div>
            <a href="javascript:void(0)" onclick="select()" class="btn btn-01"
               id="selectBtn">查询</a>
        </div>

        <div class="filter-area">
            <div class="row mar-b-10">
                <div class="form-group col-sm-3" style="width: 30%">
                    <label>借款时间:&nbsp;&nbsp;</label>
                    <div class="form-group">
                        <div class="input-group date form_date" data-date=""
                             data-date-format="yyyy-mm-dd"
                             data-link-field="chargedoffAt"
                             data-link-format="yyyy-mm-dd">
                            <input class="form-control" type="text"
                                   value="" pattern="yyyy-MM-dd">
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                        <input type="text" hidden="hidden" id="chargedoffAt" name="chargedoffAt"
                               value="" pattern="yyyy-MM-dd" />
                        <span id="repay_end_date_div"
                              style="display:none">(提示:还款时间不能大于当前时间)</span><br />
                    </div>
                </div>

                <div class="form-group col-sm-3" style="width: 30%">
                    <label>至:&nbsp;&nbsp;&nbsp;&nbsp;</label>
                    <div class="form-group">
                        <div class="input-group date form_date" data-date=""
                             data-date-format="yyyy-mm-dd"
                             data-link-field="chargedoffAtEnd"
                             data-link-format="yyyy-mm-dd">
                            <input class="form-control" type="text"
                                   value="" pattern="yyyy-MM-dd" />
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                        <input type="text" hidden="hidden" id="chargedoffAtEnd"
                               name="dateJoinedEnd"
                               value="" />
                        <span id="repay_end_date_div2"
                              style="display:none">(提示:还款时间不能大于当前时间)</span><br />
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<div class="table-area" id="con_one_1">
    <table border="0" cellspacing="0" cellpadding="0"
           class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
        <tr>
            <th>借款人姓名</th>
            <th>借款金额</th>
            <th>已还款本金</th>
            <th>已还款利息</th>
            <th>期数</th>
            <th>分销员标识</th>
            <th>分销订单号</th>
            <th>跟单业务员</th>
            <th>业务员身份证</th>
            <th>业务员提成佣金</th>
            <th>分销员提成佣金</th>
            <th>业务员提成比例</th>
            <th>分销员提成比例</th>
            <th>是否结清</th>
            <th>还款时间</th>
            <th>出账时间</th>
            <%--<th>操作</th>--%>
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
        var name = $("#name").val();
        if (("" != mobile && null != mobile) && ("" != name && null != name)) {
            var param = {
                mobile: mobile,
                name: name
            };
            onLoadDate(param);
        } else {
            onLoadDate(null);
        }
    }

    function onLoadDate(param) {
        var writetablefn = function (data) {
            var context;
            $("#checkAll").prop("checked", false);

            var status = "----";
            if (data.isEnded == 1) {
                status = "结清";
            } else {
                status = "未结清";
            }


            var detailUrl = "${basePath}/admin/customer/queryCustomerDetail.html?uuid=" + data.uuid;
            var applyUrl = "${basePath}/admin/customer/queryCustomer.html?uuid=" + data.uuid;

            context = "<tr>" +
                    "<td align='center'><a href='" + detailUrl + "' class = 'link-01'>" + data.customerName + "</a></td>" +
                    "<td align='center'>" + data.loanMoney + "</td>" +
                    "<td align='center'>" + data.captialSum + "</td>" +
                    "<td align='center'>" + data.interestSum + "</td>" +
                    "<td align='center'>" + data.repayPeriod + "</td>" +
                    "<td align='center'>" + data.openId + "</td>" +
                    "<td align='center'>" + data.orderId + "</td>" +
                    "<td align='center'>" + data.nickname + "</td>" +
                    "<td align='center'>" + data.idCard + "</td>" +
                    "<td align='center'>" + data.userCommission + "</td>" +
                    "<td align='center'>" + data.openIdComission + "</td>" +
                    "<td align='center'>" + data.commissionRate + "</td>" +
                    "<td align='center'>" + data.openIdrate + "</td>" +
                    "<td align='center'>" + status + "</td>" +
                    "<td align='center'>" + data.repayTime + "</td>" +
                    "<td align='center'>" + data.chargedoffAt + "</td>" +
//                    "<td align='center'><a class='link-01' href='" + applyUrl + "'>借款申请</a></td>" +
                    "</tr>";
            return context;
        };

        pageComm("${basePath}/admin/financeManager/commissionManage", param == null ? {} : param,
                writetablefn, "record", 17);
    }

    var param = function () {
        return {
            "conditionKey": $("#conditionKey").val(),
            "conditionValue": $("#conditionValue").val(),
            "startDate": $("#chargedoffAt").val(),
            "endDate": $("#chargedoffAtEnd").val(),
            "isEnded": $("#isEnded").val()
        };
    };

    function select() {
        onLoadDate(param());
    }

</script>
</html>
