<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="basePath" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统--车辆评估</title>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/css.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/layer/skin/layer.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="${basePath}/css/bootstrap-table.css">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ basePath}/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>
    <script type="text/javascript" src="${basePath}/js/other.js"></script>
    <script type="text/javascript" src="${basePath}/js/my.js"></script>
    <script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
    <script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/jquery.validate.js"></script>
    <script src="${basePath}/js/sisyphus.js"></script>
    <script>
        $(function () {
            /*详情页判断车辆是否在有效期内*/
            var isExamObj = $('input[name="isExamined"]');
            isExamObj.removeAttrs("checked");
            if ("${loanInfo.guaranteeEvaluateInfo.isExamined}" == "否") {
                isExamObj.eq(1).attr("checked", 'checked');
            } else {
                isExamObj.eq(0).attr("checked", 'checked');
            }

            /*详情页车辆商业全险是否购买*/
            var isInsuObj = $('input[name="isInsure"]');
            isInsuObj.removeAttrs("checked");
            if ("${loanInfo.guaranteeEvaluateInfo.isInsure}" == "否") {
                isInsuObj.eq(1).attr("checked", 'checked');
            } else {
                isInsuObj.eq(0).attr("checked", 'checked');
            }

            /*节假日是否驾驶车辆离省*/
            var isProvObj = $('input[name="isProvince"]');
            isProvObj.removeAttrs("checked");
            if ("${loanInfo.guaranteeEvaluateInfo.isProvince}" == "否") {
                isProvObj.eq(1).attr("checked", 'checked');
            } else {
                isProvObj.eq(0).attr("checked", 'checked');
            }

            /*暗锁有无*/
            var darkLocksObj = $('input[name="darkLocks"]');
            darkLocksObj.removeAttrs("checked");
            if ("${loanInfo.guaranteeEvaluateInfo.darkLocks}" == "无") {
                darkLocksObj.eq(1).attr("checked", 'checked');
            } else {
                darkLocksObj.eq(0).attr("checked", 'checked');
            }

            /*全款按揭*/
            var buyTheWayObj = $('input[name="buyTheWay"]');
            buyTheWayObj.removeAttrs("checked");
            if ("${loanInfo.guaranteeEvaluateInfo.buyTheWay}" == "按揭") {
                buyTheWayObj.eq(1).attr("checked", 'checked');
            } else {
                buyTheWayObj.eq(0).attr("checked", 'checked');
            }

            /* 室内 */
            var indoorVals = "${loanInfo.guaranteeEvaluateInfo.indoor}";
            var indoorVal = indoorVals.split(",");
            $('input[name="indoor"]').each(function () {
                for (var i = 0; i < indoorVal.length; i++) {
                    if ($(this).val() == indoorVal[i]) {
                        $(this).prop("checked", true);
                    }
                }
            });

            /* 随车工具 */
            var toolVals = "${loanInfo.guaranteeEvaluateInfo.tool}";
            var toolVal = toolVals.split(",");
            $('input[name="tool"]').each(function () {
                for (var i = 0; i < toolVal.length; i++) {
                    if ($(this).val() == toolVal[i]) {
                        $(this).prop("checked", true);
                    }
                }
            });

            $("input[name='darkLocks']").live("click", function () {
                var supplementObj = $("#dark_locks_position");
                if (this.value == '有') {
                    supplementObj.html("<label>暗锁位置：</label><input type = 'text' class= 'form-control' name='darkLocksPosition' > ");
                } else {
                    supplementObj.html("");
                }
            });
            $("#carForm").validate({
                errorLaberContainer: "loanError",
                errorElement: "span",
                rules: {
                    vehicleBrand: {
                        required: true
                    },
                    vehicleNo: {
                        required: true
                    },
                    mileaged: {
                        required: true
                    },
                    vehicleIdentification: {
                        required: true
                    },
                    engineNo: {
                        required: true
                    },
                    displacement: {
                        required: true
                    },
                    engine: {
                        required: true
                    },
                    price: {
                        required: true
                    },
                    evaluatePrice: {
                        required: true
                    },
                    evaluateConclusion: {
                        required: true
                    },
                    purchaseDate: {
                        required: true
                    },
                    contractNum: {
                        required: true
                    },
                    /*    enterpriseTel: {
                     required: true
                     },
                     enterpriseAddress: {
                     required: true
                     },
                     income: {
                     required: true
                     },
                     //                 companyId: {
                     //                     checkSelected: true
                     //                 },
                     //                 deptId: {
                     //                     checkSelected: true
                     //                 },
                     //                 responsibleCmId: {
                     //                     checkSelected: true
                     //                 },
                     remark: {
                     required: true
                     },
                     creditCardQuota: {
                     required: true
                     },
                     creditCardNum: {
                     required: true
                     } */
                },
                messages: {
                    vehicleBrand: {
                        required: '车辆品牌不能为空！'
                    },
                    vehicleNo: {
                        required: '车辆号码不能为空！'
                    },
                    mileaged: {
                        required: '行驶里程不能为空!',
                    },
                    vehicleIdentification: {
                        required: '车架号不能为空！'
                    },
                    engineNo: {
                        required: '发动机号不能为空！'
                    },
                    displacement: {
                        required: '排量不能为空！'
                    },
                    engine: {
                        required: '发动机不能为空！'
                    },
                    price: {
                        required: '发票价不能为空！'
                    },
                    evaluatePrice: {
                        required: '评估价格不能为空！'
                    },
                    evaluateConclusion: {
                        required: '评估意见不能为空！'
                    },
                    purchaseDate: {
                        required: '购置日期不能为空！'
                    },
                    contractNum: {
                        required: '合同编号不能为空!'
                    },
                    /* enterpriseTel: {
                     required: '单位电话不能为空！'
                     },
                     enterpriseAddress: {
                     required: '单位地址不能为空！'
                     },
                     income: {
                     required: '月收入不能为空！'
                     },
                     remark: {
                     required: '备注不能为空！'
                     },
                     creditCardQuota: {
                     required: '信用卡额度不能为空，没有请填写0！'
                     },
                     creditCardNum: {
                     required: '信用卡张数不能为空，没有请填写0！'
                     }*/
                },
                submitHandler: function (form, event) {

                    var a=$("#purchaseDate").val();
                    if(a==null||a==""){

                        var txt = "<font color='red'>购置日期不能为空！</fron>"
                        $("#div1").html(txt);
                    }else{
                        $.ajax({
                            type: 'POST',
                            url: '${basePath}/admin/loan/vehicleAssessHandle',
                            data: $("#carForm").serializeArray(),
                            dataType: "text",
                            success: function (data) {
                                if (data == '0000') {
                                    $("#carForm").sisyphus().manuallyReleaseData();

                                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                                        if(document.referrer.indexOf("productList")>0){
                                            document.location.href =  document.referrer;
                                        }else{
                                            window.location.href = document.referrer;
                                        }

                                        return true;
                                    });
                                } else {
                                    layer.msg("操作失败!可能原因：" + data);
                                    return false;
                                }
                            }, error: function () {
                                layer.msg("未知错误!");
                                return false;
                            }
                        })
                    }
                }
            });

            $("#carForm").sisyphus({
                excludeFields:[$('input[name="evaluateby"]')[0],$('input[name="loanId"]')[0],$('input[name="taskId"]')[0]],
                autoRelease: false,
                onRestore: function() {
                    debugger;
                }
            });

        });
    </script>
    <style>
        .error {
            color: red;
        }
    </style>
</head>

<body>
<form id="carForm" action="javascript:;">
    <div class="col-lg-12">
        <div class="tools_bar ">
            <div class="bar_tit clearfix">
                <h2 class="pull-left">押品评估</h2>
            </div>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">合同编号信息</h3>
            </div>
            <div class="from_con clearfix">
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 合同编号</dt>
                    <dd>
                        <input type="text" class="form-control" name="contractNum" maxlength="30" value="${loanInfo.contractNum}"/>
                    </dd>
                </dl>

            </div>

        </div>
        <div class="from_box carinfo_from">
            <div class="from_tit clearfix">
                <h3 class="pull-left">基本信息</h3>
            </div>
            <div class="from_con clearfix">
                <dl class="dl-horizontal col-sm-4 dl-car-info">
                    <dt><i class="text-danger">*</i> 车身是否在有效期内</dt>
                    <dd>
                        <label class="radio-inline">
                            <input type="radio" name="isExamined" id="inlineRadio1" value="是" checked>
                            是 </label>
                        <label class="radio-inline">
                            <input type="radio" name="isExamined" id="inlineRadio2" value="否" >
                            否 </label>
                    </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 车辆商业全险是否购买</dt>
                    <dd>
                        <label class="radio-inline">
                            <input type="radio" name="isInsure" id="inlineRadio1" value="是" checked>
                            是 </label>
                        <label class="radio-inline">
                            <input type="radio" name="isInsure" id="inlineRadio2" value="否" >
                            否 </label>
                    </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 节假日是否驾驶车辆离省</dt>
                    <dd>
                        <label class="radio-inline">
                            <input type="radio" name="isProvince" id="inlineRadio1" value="是" checked>
                            是 </label>
                        <label class="radio-inline">
                            <input type="radio" name="isProvince" id="inlineRadio2" value="否">
                            否 </label>
                    </dd>
                </dl>
            </div>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">车辆信息</h3>
            </div>
            <div class="from_con clearfix">
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 车辆品牌</dt>
                    <dd>
                        <input type="text" class="form-control" name="vehicleBrand" maxlength="30" value="${loanInfo.guaranteeEvaluateInfo.vehicleBrand}"/>
                    </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 车辆型号</dt>
                    <dd>
                        <select class="form-control" id="vehicleModels" name="vehicleModels">
                            <option value="轿车" ${loanInfo.guaranteeEvaluateInfo.vehicleModels == '轿车' ? selected : ''}>轿车</option>
                            <option value="跑车" ${loanInfo.guaranteeEvaluateInfo.vehicleModels == '跑车' ? selected : ''}>跑车</option>
                            <option value="SUV" ${loanInfo.guaranteeEvaluateInfo.vehicleModels == 'SUV' ? selected : ''}>SUV</option>
                            <option value="MPV" ${loanInfo.guaranteeEvaluateInfo.vehicleModels == 'MPV' ? selected : ''}>MPV</option>
                            <option value="商用车" ${loanInfo.guaranteeEvaluateInfo.vehicleModels == '商用车' ? selected : ''}>商用车</option>
                            <option value="其他" ${loanInfo.guaranteeEvaluateInfo.vehicleModels == '其他' ? selected : ''}>其他</option>
                        </select>
                    </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 车牌号码</dt>
                    <dd>
                        <input type="text" value="${loanInfo.guaranteeEvaluateInfo.vehicleNo}" name="vehicleNo" class="form-control" maxlength="10" />
                    </dd>
                </dl>
            </div>
            <div class="from_con clearfix">
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 已行驶里程</dt>
                    <dd>
                        <div class="input_group" style=" width:160px;">
                            <input type="text" class="form-control" style="width:100%;" name="mileaged" value="${loanInfo.guaranteeEvaluateInfo.mileaged}" maxlength="7"
                                   onkeyup="value=value.replace(/[^\d.]/g,'')">
                            <span class="danwei">km</span></div>
                    </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 购置日期</dt>
                    <dd>
                        <div class="input-group date form_date" data-date=""
                             data-date-format="yyyy-mm"
                             data-link-field="purchaseDate"
                             data-link-format="yyyy-mm-dd" style="width:160px;">
                            <input class="form-control" type="text"
                                   value="<fmt:formatDate value="${loanInfo.guaranteeEvaluateInfo.purchaseDate}"  pattern="yyyy-MM-dd" />" readonly style="width:100%;">
                  <span class="input-group-addon"><span
                          class="glyphicon glyphicon-calendar"></span></span> </div>
                        <input type="text" hidden="hidden" id="purchaseDate"
                               name="purchaseDate"
                               value="<fmt:formatDate value="${loanInfo.guaranteeEvaluateInfo.purchaseDate}" pattern="yyyy-MM-dd"/>" />
                        <span id="div1"></span> </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 车架号</dt>
                    <dd>
                        <input type="text" class="form-control" name="vehicleIdentification" maxlength="30"
                               value="${loanInfo.guaranteeEvaluateInfo.vehicleIdentification}">
                    </dd>
                </dl>
            </div>
            <div class="from_con clearfix">
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 发动机号</dt>
                    <dd>
                        <input type="text" class="form-control" name="engineNo" maxlength="30"
                               onkeyup="value=value.replace(/[^\w\.\-\/]/ig,'')"
                               value="${loanInfo.guaranteeEvaluateInfo.engineNo}">
                    </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 变速箱</dt>
                    <dd>
                        <select class="form-control" name="indoor">
                            <option value="手动">手动</option>
                            <option value="自动">自动</option>
                        </select>
                    </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 排量</dt>
                    <dd>
                        <div class="input_group" style="width:160px">
                            <input type="text" class="form-control" name="displacement" maxlength="5"
                                   value="${loanInfo.guaranteeEvaluateInfo.displacement}"
                                   onkeyup="value=value.replace(/[^\d.]/g,'')">
                            <span class="danwei">L</span> </div>
                    </dd>
                </dl>
            </div>
            <div class="from_con clearfix">
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 车身结构</dt>
                    <dd>
                        <select class="form-control" name="indoor">
                            <option value="4门5座三厢">4门5座三厢</option>
                            <option value="5门5座两厢">5门5座两厢</option>
                            <option value="其他">其他</option>
                        </select>
                    </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 驱动轮</dt>
                    <dd>
                        <select class="form-control" name="configuration">
                            <option value="两驱" ${loanInfo.guaranteeEvaluateInfo.configuration == '两驱' ? selected : ''}>两驱</option>
                            <option value="四驱" ${loanInfo.guaranteeEvaluateInfo.configuration == '四驱' ? selected : ''}>四驱</option>
                        </select>
                    </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 颜色</dt>
                    <dd>
                        <select class="form-control"  name="color">
                            <option value="黑色" ${loanInfo.guaranteeEvaluateInfo.color == '黑色' ? selected : ''}>黑色</option>
                            <option value="白色" ${loanInfo.guaranteeEvaluateInfo.color == '白色' ? selected : ''}>白色</option>
                            <option value="灰色" ${loanInfo.guaranteeEvaluateInfo.color == '灰色' ? selected : ''}>灰色</option>
                            <option value="红色" ${loanInfo.guaranteeEvaluateInfo.color == '红色' ? selected : ''}>红色</option>
                            <option value="银色" ${loanInfo.guaranteeEvaluateInfo.color == '银色' ? selected : ''}>银色</option>
                            <option value="蓝色" ${loanInfo.guaranteeEvaluateInfo.color == '蓝色' ? selected : ''}>蓝色</option>
                            <option value="金色" ${loanInfo.guaranteeEvaluateInfo.color == '金色' ? selected : ''}>金色</option>
                            <option value="棕色" ${loanInfo.guaranteeEvaluateInfo.color == '棕色' ? selected : ''}>棕色</option>
                            <option value="橙色" ${loanInfo.guaranteeEvaluateInfo.color == '橙色' ? selected : ''}>橙色</option>
                            <option value="黄色" ${loanInfo.guaranteeEvaluateInfo.color == '黄色' ? selected : ''}>黄色</option>
                            <option value="紫色" ${loanInfo.guaranteeEvaluateInfo.color == '紫色' ? selected : ''}>紫色</option>
                            <option value="绿色" ${loanInfo.guaranteeEvaluateInfo.color == '绿色' ? selected : ''}>绿色</option>
                            <option value="褐色" ${loanInfo.guaranteeEvaluateInfo.color == '褐色' ? selected : ''}>褐色</option>
                            <option value="栗色" ${loanInfo.guaranteeEvaluateInfo.color == '栗色' ? selected : ''}>栗色</option>
                            <option value="米色" ${loanInfo.guaranteeEvaluateInfo.color == '米色' ? selected : ''}>米色</option>
                            <option value="银灰色" ${loanInfo.guaranteeEvaluateInfo.color == '银灰色' ? selected : ''}>银灰色</option>
                            <option value="青色" ${loanInfo.guaranteeEvaluateInfo.color == '青色' ? selected : ''}>青色</option>
                            <option value="香槟色" ${loanInfo.guaranteeEvaluateInfo.color == '香槟色' ? selected : ''}>香槟色</option>
                            <option value="咖啡色" ${loanInfo.guaranteeEvaluateInfo.color == '咖啡色' ? selected : ''}>咖啡色</option>
                            <option value="天山白" ${loanInfo.guaranteeEvaluateInfo.color == '天山白' ? selected : ''}>天山白</option>
                            <option value="其他色" ${loanInfo.guaranteeEvaluateInfo.color == '其他色' ? selected : ''}>其他色</option>
                        </select>
                    </dd>
                </dl>
            </div>
            <div class="from_con clearfix">
                <dl class="dl-horizontal col-sm-12">
                    <dt><i class="text-danger">*</i> 室内装置</dt>
                    <dd>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox1" name="indoor" value="智能钥匙">
                            智能钥匙 </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox2" name="indoor" value="真皮座椅 ">
                            真皮座椅 </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox3" name="indoor" value="腰部支撑 ">
                            腰部支撑 </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox4" name="indoor" value="电动座椅">
                            电动座椅 </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox5" name="darkLocks" value="暗锁">
                            暗锁 </label>
                    </dd>
                </dl>
            </div>
            <div class="from_con clearfix">
                <dl class="dl-horizontal col-sm-8">
                    <dt><i class="text-danger">*</i> 随车装置</dt>
                    <dd>
                        <label class="checkbox-inline">
                            <input type="checkbox"  value="工具" name="tool">
                            工具 </label>
                        <label class="checkbox-inline">
                            <input type="checkbox"  value="千斤" name="tool">
                            千斤 </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="备胎" name="tool">
                            备胎 </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="备胎罩" name="tool">
                            备胎罩 </label>
                        </td>
                    </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 发动机</dt>
                    <dd>

                        <select class="form-control" id="engine" name="engine" value="${loanInfo.guaranteeEvaluateInfo.engine}">
                            <option value="正常">正常</option>
                            <option value="异常">异常</option>
                        </select>
                    </dd>
                </dl>
            </div>
            <div class="from_con clearfix">
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 发票价</dt>
                    <dd>
                        <div class="input_group" style="width:160px">
                            <input type="text" class="form-control" name="price" style="width:100%;"  maxlength="5"
                                   value='<fmt:formatNumber value="${loanInfo.guaranteeEvaluateInfo.price}" type="number" pattern="#"/>'
                                   onkeyup="this.value=this.value.replace(/[^\d\.]/g,'')" />
                            <span class="danwei">万元</span> </div>
                    </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt><i class="text-danger">*</i> 购买方式</dt>
                    <dd>
                        <label class="radio-inline">
                            <input type="radio" name="buyTheWay" value="全款" checked>
                            全款 </label>
                        <label class="radio-inline">
                            <input type="radio" name="buyTheWay" value="按揭">
                            按揭 </label>
                    </dd>
                </dl>
                <dl class="dl-horizontal col-sm-4">
                    <dt> 机动车登记号码</dt>
                    <dd>
                        <input type="text" class="form-control" name="vehicleRegisterCode" maxlength="30"
                               value="${loanInfo.guaranteeEvaluateInfo.vehicleRegisterCode}">
                    </dd>
                </dl>
            </div>
        </div>
        <div id="img_div"></div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">车辆评估信息</h3>
            </div>
            <div class="from_con clearfix">
                <dl class="dl-horizontal col-sm-12">
                    <dt><i class="text-danger">*</i> 评估价格</dt>
                    <dd>
                        <div class="input_group" style="width:160px">
                            <input type="text" class="form-control" name="evaluatePrice" style="width:100%;"   maxlength="5"
                                   value='<fmt:formatNumber value="${loanInfo.guaranteeEvaluateInfo.evaluatePrice}" type="number" pattern="#"/>'
                                   onkeyup="this.value=this.value.replace(/[^\d\.]/g,'')" />
                            <span class="danwei">万元</span> </div>
                    </dd>
                </dl>
            </div>


            <div class="from_con clearfix">
                <dl class="dl-horizontal col-sm-12">
                    <dt><i class="text-danger">*</i> 评估意见</dt>
                    <dd>
          <textarea name="conclusion" cols="100" rows="3"  maxlength="50"
                    class="form-control" placeholder="请详细填写评估意见">${loanInfo.guaranteeEvaluateInfo.evaluateConclusion}</textarea>
                    </dd>
                </dl>
            </div>

        </div>
        <input type="hidden" class="form-control" name="evaluateby" value="${userId}">
        <input type="hidden" class="form-control" name="loanId" value="${loanInfo.uuid}" id="uuid">
        <input type="hidden" class="form-control" name="taskId" id="taskId" value="${taskId}">
        <div class="row" style="padding-bottom:20px;">
            <div class="col-sm-2 col-sm-offset-4"> <a class="btn btn-default btn-block" href="javascript:history.go(-1);">取消申请</a> </div>
            <div class="col-sm-2">
                <button type="submit" onclick="javascript:void(0)" class="btn btn-danger btn-block">提交评估</button>
            </div>
        </div>
    </div>
</form>
<script>

    /** 人车合照 */
    $('#up_img_WU_FILE_0').fileupload({
        dataType: 'json',
        done: function (e, data) {
            doneProcess(data, $('#imgShow_WU_FILE_0'));
        }
    });


    /** 车辆一 */
    $("#up_img_WU_FILE_1").fileupload({
        dataType: 'json',
        done: function (e, data) {
            doneProcess(data, $('#imgShow_WU_FILE_1'));
        }
    });

    /** 车辆二*/
    $("#up_img_WU_FILE_2").fileupload({
        dataType: 'json',
        done: function (e, data) {
            doneProcess(data, $('#imgShow_WU_FILE_2'));
        }
    });


    /** 车辆三*/
    $("#up_img_WU_FILE_3").fileupload({
        dataType: 'json',
        done: function (e, data) {
            doneProcess(data, $('#imgShow_WU_FILE_3'));
        }
    });
    /** 车辆四*/
    $("#up_img_WU_FILE_4").fileupload({
        dataType: 'json',
        done: function (e, data) {
            doneProcess(data, $('#imgShow_WU_FILE_4'));
        }
    });
    /** 暗锁位置*/
    $("#up_img_WU_FILE_5").fileupload({
        dataType: 'json',
        done: function (e, data) {
            doneProcess(data, $('#imgShow_WU_FILE_5'));
        }
    });



    function vehicleAssess() {
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loan/vehicleAssessHandle',
            data: $("#carForm").serializeArray(),
            dataType: "text",
            success: function (data) {
                if (data == '0000') {
                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        document.location.href = '/admin/loan/loanInfoList.html';
                        return true;
                    });
                } else {
                    layer.msg("操作失败!可能原因：" + data);
                    return false;
                }
            }, error: function () {
                layer.msg("未知错误!");
                return false;
            }
        })

    }


    $(function () {
        /* 加载附件 */
        $("#loan_attachment_div").load("${basePath}/admin/loan/getUploadLoanAttachment.html?loanId=${loanInfo.uuid}");
        /** 借款评审页面 */
        $("#loan_review_div").load("${basePath}/admin/loan//review/record/${loanInfo.uuid}.html")

        $("#reviewFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data);
            }
        });
    });
    var doneProcess = function (data) {
        $.each(data.result, function (index, file) {
            if (file.code == "0000") {
                layer.msg("上传成功！");
                /** 查询出借款附件 */
                $("#loan_attachment_div").load("${basePath}/admin/loan/getUploadLoanAttachment.html?loanId=${loanInfo.uuid}")
            } else {
                layer.msg(file.message);
            }
        });
    };

    function submitReview(processDefinitionId) {
        var reviewStatus = $("input[name='reviewStatus']").val();
        var loanId = $("#loanId").val();
        var conclusionObj = $("#conclusion");
        var conclusion = conclusionObj.val();

        var reviewStatusStr = "通过";
        if (reviewStatus == "rejected") {
            reviewStatusStr = "拒绝";
        }

        if (conclusion == null || conclusion == "") {
            layer.msg("评审意见不能为空！");
            conclusionObj.focus();
            return;
        }

        var dialogMsg = "你确定要" + reviewStatusStr + "此笔借款吗？";
        layer.confirm(dialogMsg, {icon: 3, title: '提示'}, function () {
            $.ajax({
                type: 'POST',
                url: '${basePath}/admin/loan/review.html',
                data:  $("#carForm").serializeArray(),
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                            document.location.href = '${basePath}/admin/module/moduleManageList.html';
                            return true;
                        });
                    } else {
                        layer.msg("操作失败!可能原因：" + data);
                        return false;
                    }
                }, error: function () {
                    layer.msg("系统错误!");
                    return false;
                }
            })
        });
    }
    var doneProcess = function (data, obj) {
        $.each(data.result, function (index, file) {
            if (file.code == "0000") {
                layer.msg("上传成功！");
                $(obj).attr("src",file.showFilePath);
                $(obj).next().attr("value",file.showFilePath);
                /** 查询出借款附件 */
            } else {
                if(file.code == "9999"){
                    layer.msg("不支持此类型的文件！");
                }
            }
        });

    };
</script>
<script src="${basePath}/js/loan/imageUpLoadTile.js"></script>
</body>
</html>
