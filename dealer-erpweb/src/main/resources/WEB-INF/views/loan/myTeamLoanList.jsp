<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—借款列表</title>
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
        <li><a class="link-01" href="${basePath}/admin/loan/myPersonalLoanList.html">借款管理</a></li>
        <li>我的团队借款列表</li>
    </ul>
</div>

<div class="main-con">
    <div class="filter-area">
        <form class="form-inline">
            <div class="row mar-b-10">
                <div class="form-group col-sm-3" style="width: 24%">
                    <label>姓名：</label>
                    <input type="text" class="form-control" id="customerName" name="customerName"
                           size="10">
                </div>
                <div class="form-group col-sm-3" style="width: 24%">
                    <label>手机号码：</label>
                    <input type="text" class="form-control" id="mobile" name="mobile" size="10">
                </div>
                <%--<div class="form-group col-sm-3" style="width: 26%">--%>
                    <%--<label>借款所属公司：</label>--%>
                    <%--<select class="form-control" id="companyId" name="companyId">--%>
                        <%--<option value="">请选择</option>--%>

                    <%--</select>--%>
                <%--</div>--%>
                <%--<div class="form-group col-sm-3" style="width: 25%">--%>
                    <%--<label>借款所属部门：</label>--%>
                    <%--<select class="form-control" id="deptId" name="deptId">--%>
                        <%--<option value="">请选择</option>--%>
                    <%--</select>--%>
                <%--</div>--%>
                <div class="form-group col-sm-3" style="width: 25%">
                    <label>状态：</label>
                    <select class="form-control" id="loanStatus" name="loanStatus">
                        <option value="">请选择</option>
                        <option value="vehicleAssess">车辆评估</option>
                        <option value="departLeadAduit">业务部门领导初审</option>
                        <option value="trialPhase">总部面审</option>
                        <option value="callBack">总部电话回访</option>
                        <option value="visiteCheck">线下上门核实</option>
                        <option value="judgment">总部贷款终审</option>
                        <option value="signContract">线下签订相关合同</option>
                        <option value="dataReview">资料复核</option>
                        <option value="reuploadInformatin">资料或相关合同重新上传</option>
                        <option value="lended">借款出账</option>
                        <option value="repayment">已出账，还款中</option>
                        <option value="end">已完结</option>

                    </select>
                    <a href="javascript:void(0)" onclick="select()" class="btn btn-01"
                       id="selectBtn">搜索</a>
                </div>

            </div>
        </form>
    </div>

    <div class="table-area" id="con_one_1">
        <table border="0" cellspacing="0" cellpadding="0"
               class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
            <tr>
                <th><input type='checkbox' name='checkboxAll' id="checkAll" onclick="selectAll()" />
                </th>
                <th>姓名</th>
                <%--<th>性别</th>--%>
                <th>身份证号码</th>
                <th>手机号码</th>
                <th>申请金额</th>
                <th>审批金额</th>
                <th>申请时间</th>
                <th>借款所属公司</th>
                <th>借款所属部门</th>
                <th>年利率</th>
                <th>期限</th>
                <th>还款方式</th>
                <th>状态</th>
                <th>客户经理</th>
                <th>录入人</th>
                <%--<th>录入时间</th>--%>
                <%--<th>操作</th>--%>
            </tr>
            <tbody id="record"></tbody>
        </table>
    </div>
    <div id="r-page"></div>
</div>
</body>
<script type="text/javascript">
    var currentReviewLoanStatus = "${map.status}"; // 根据不同的状态进行查询,参数由IndexController封装为map
    $(function () {
        init();

        /** 动态加载公司列表 */
        var companyIdObj = $("#companyId");
        $.get("${basePath}/admin/company/queryCompanyList.html", function (result) {
            var html = '';
            $(result).each(function (i) {
                html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
            });
            companyIdObj.append(html);
        });

        /*动态加载公司部门*/
        companyIdObj.live("change", function () {
            getDept(this.value);
        });


        /* 根据公司Id查询部门*/
        var deptIdObj = $("#deptId");
        var getDept = function (companyId) {
            if (companyId == "") {
                var html = '<option value="" selected>请选择</option>';
                deptIdObj.html(html);
            } else {
                $.get("${basePath}/admin/dept/queryDeptComById?companyId=" + companyId, function (result) {
                    var html = '';
                    $(result).each(function (i) {
                        html += '<option value="' + result[i].id + '">' + result[i].name +
                                '</option>';
                    });
                    deptIdObj.html(html);
                });
            }
        };
        $("#loanStatus").find('option[value="' + currentReviewLoanStatus + '"]').attr("selected", true);
    });

    function init() {
        var mobile = $("#mobile").val();
        var companyId = $("#companyId").val();
        var deptId = $("#deptId").val();
        var loanStatus = $("#loanStatus").val();
        var customerName = $("#customerName").val();

        if (("" != mobile && null != mobile) || ("" != companyId && null != companyId)
                || ("" != deptId && null != deptId) || ("" != currentReviewLoanStatus && null !=
                currentReviewLoanStatus) || ("" !== customerName && null !== customerName)) {
            var param = {
                "mobile": mobile,
                "companyId": companyId,
                "deptId": deptId,
                "status": currentReviewLoanStatus,
                "customerName": customerName
            };
            onLoadDate(param);
        } else {
            onLoadDate({
                "status": currentReviewLoanStatus
            });
        }
    }

    function onLoadDate(param) {
        var writetablefn = function (data) {
            var context;
            $("#checkAll").prop("checked", false);
            var sexStr = "-----";    //性别
            if (data.sex == "M") {
                sexStr = "男";
            } else {
                sexStr = "女";
            }

            var status = "----";
            if (data.registerStatus == "new") {
                status = "待完善";
            } else {
                status = "完成";
            }
            var sex = "";
            if (data.customerRegisterInfo.sex == "M") {
                sex = "男";
            }
            if (data.customerRegisterInfo.sex == "FM") {
                sex = "女";
            }

            var way = "";
            if (data.repayWay == "AverageCapitalPlusInterest") {
                way = "等额本息";
            }
            if (data.repayWay == "InterestRatesBefore") {

                way = "先息后本";
            }
            if (data.repayWay == "flexiblerepaymentv2") {
                way = "灵活还款";
            }
            if (data.repayWay == "averagePrincipalreduceinterest") {

                way = "等本减息";
            }
            if (data.repayWay == "averagePrincipalzerointerestrent") {
                way = "等本零息(押证)";
            }
            if (data.repayWay == "intrestbeforePrincipaltransfer") {

                way = "先息后本(押车)";
            }
            if (data.repayWay == "intrestbeforePrincipalrent") {

                way = "先息后本(押证)";
            } 
            var loanStatus = data.loanStatus;
            var loanStatusStr = "";
            if (loanStatus == "vehicleAssess") {
                loanStatusStr = "待车辆评估";
            } else if (loanStatus == "departLeadAduit") {
                loanStatusStr = "待初审";
            } else if (loanStatus == "departLeadAduit_rejected") {
                loanStatusStr = "初审不通过";
            } else if (loanStatus == "trialPhase") {
                loanStatusStr = "待总部面审";
            } else if (loanStatus == "trialPhase_rejected") {
                loanStatusStr = "总部面审不通过";
            } else if (loanStatus == "callBack") {
                loanStatusStr = "待总部电话回访";
            } else if (loanStatus == "visiteCheck") {
                loanStatusStr = "待线下上门核实";
            } else if (loanStatus == "judgment") {
                loanStatusStr = "待总部终审";
            } else if (loanStatus == "judgment_rejected") {
                loanStatusStr = "总部终审不通过";
            } else if (loanStatus == "signContract") {
                loanStatusStr = "待线下签订相关合同";
            } else if (loanStatus == "signContract_rejected") {
                loanStatusStr = "签订合同终止";
            } else if (loanStatus == "dataReview") {
                loanStatusStr = "资料复核";
            } else if (loanStatus == "reuploadInformatin") {
                loanStatusStr = "资料或相关合同重新上传";
            } else if (loanStatus == "lended") {
                loanStatusStr = "待出账";
            } else if (loanStatus == "repayment") {
                loanStatusStr = "还款中";
            } else if (loanStatus == "end") {
                loanStatusStr = "已完结";
            }

            var linkUrl = "${basePath}/admin/loan/loanDetail/" + data.uuid + "/" + data.loanStatus + ".html";
            var linkUrl2 = "${basePath}/admin/loan/queryLoanDetail/" + data.uuid + ".html";


            var edit = "";
            if (loanStatus == "vehicleAssess") {
                edit = "<a href='" + linkUrl2 + "' class='link-01'>编辑</a>";
            } else {
                edit = "";
            }
            context = "<tr>" +
                    "<td align='center'><input type='checkbox' onclick='paramClick()' name='checkbox1' value='" + data.uuid + "'>" +
                    "<td align='center' title= '查看借款详情'><a class='link-01' href='${basePath}/admin/loan/loanDetail/" + data.uuid + "/detail.html'>" + data.customerRegisterInfo.customerName + "</a></td>" +
//                    "<td align='center'>" + sex + "</td>" +
                    "<td align='center'>" + data.idCard + "</td>" +
                    "<td align='center'>" + data.mobile + "</td>" +
                    "<td align='center'>" + data.applyMoney + "</td>" +
                    "<td align='center'>" + data.loanMoney + "</td>" +
                    "<td align='center'>" + data.applyedAt + "</td>" +
                    "<td align='center'>" + data.company.name + "</td>" +
                    "<td align='center'>" + data.dept.name + "</td>" +
                    "<td align='center'>" + data.loanRate + "</td>" +
                    "<td align='center'>" + data.loanLimitTime + "</td>" +
                    "<td align='center'>" + way + "</td>" +
                    "<td align='center'>" + loanStatusStr + "</td>" +
                    "<td align='center'>" + data.responsibleBy.realname + "</td>" +
                    "<td align='center' title='录入时间：" + data.createdAt + "'>" +
                    data.createBy.realname +
                    "</td>" +
//                    "<td align='center'><a href='" + linkUrl + "' class='link-01'>查看</a></td>" +
//                    "<td align='center'>" + edit + "</td>" +
                    "</tr>";
            return context;
        };

        pageComm("${basePath}/admin/loan/queryMyTeamLoanList", param == null ? {} : param,
                writetablefn, "record", 18);
    }

    var param = function () {
        return {
            "customerName": $("#customerName").val(),
            "mobile": $("#mobile").val(),
            "companyId": $("#companyId").val(),
            "deptId": $("#deptId").val(),
            "status": $("#loanStatus").val()
        };
    };

    function select() {
        onLoadDate(param());
    }

    function reset() {
        $("#mobile").val("");
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
