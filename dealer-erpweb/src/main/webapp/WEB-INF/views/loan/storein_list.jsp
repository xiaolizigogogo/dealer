<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible"
        content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Cache-Control" content="no-transform">
  <title>e车贷管理系统—押品评估</title>
  <%@include file="../common/taglibs.jsp"%>
    <link rel="stylesheet" href="${basePath}/css/lightbox.min.css">
    <script src="${basePath}/js/lightbox-plus-jquery.min.js"></script>
    <script src="${basePath}/js/jquery.js" ></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>
    <script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>

    <script src="${basePath}/js/loan/imageUpLoadTile.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ basePath}/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>

    

    <style>
    .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
  </style>
</head>
<body>
<input type="hidden" value=""  id="customer_id_hidden">
<div class="tools_bar col-lg-12">
  <div class="clearfix">
    <form class="form-inline pull-left" role="form">
      <div class="form-group">
        <label class="sr-only" for="txt_orderid">订单号</label>
        <input type="text" class="form-control" id="txt_orderid" placeholder="请输入订单号">
      </div>
      <button type="button" onclick="select()" class="btn btn-primary btn-search"><i class="fa fa-search"></i> 搜索</button>
    </form>
  </div>
  
</div>
<div class="list_box col-sm-12">
  <table  class="table table-bordered table-striped">
    <thead>
      <tr>
          <th>订单号</th>
          <th>客户姓名</th>
          <th>流程状态</th>
          <th>抵押方式</th>
          <th>客户经理</th>
          <th>团队经理</th>
          <th>生成时间</th>
          <th>操作</th>
      </tr>
    </thead>
    <tbody id="instocklist">
    </tbody>
  </table>
</div>
<div id="r-page"></div>
<div id="custom_modal" class="modal fade in "> </div>
<div id="order_modal" class="modal fade in"> </div>

<div id="in_product_modal" class="modal fade in">
    <div class="modal-header" id="header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">押品入库</h4>
    </div>
    <div class="modal-body" style="background:#eee;">
    <div class="from_box">
        <div class="from_tit clearfix">
        <h3 class="pull-left">基本信息</h3>
      </div>
        <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
            <dt>押品编号</dt>
            <dd>
            <input id="stockobjectnumber" type="text" class="form-control" size="50" readonly value="" />
          </dd>
          </dl>
        <dl class="dl-horizontal col-sm-4">
            <dt>客户姓名</dt>
            <dd>
            <input id="customer_name" type="text" class="form-control" size="50" readonly value="" />
          </dd>
          </dl>
      </div>
        <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
            <dt>订单编号</dt>
            <dd>
            <input id="orderid" type="text" class="form-control" size="50" readonly value="" />
          </dd>
          </dl>
        <dl class="dl-horizontal col-sm-4">
            <dt><i class="text-danger">*</i> 押品类型</dt>
            <dd>
            <select id="stockobjectkind"  class="form-control"readonly >
                <option>车</option>
              </select>
          </dd>
          </dl>
        <dl class="dl-horizontal col-sm-4">
            <dt><i class="text-danger">*</i> 抵押类型</dt>
            <dd>
            <select  class="form-control" readonly>
                <option>押车</option>
              </select>
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
            <dt>车牌号码</dt>
            <dd>
            <input id="vehicle_no" type="text" class="form-control " size="50" readonly value=""  />
          </dd>
          </dl>
        <dl class="dl-horizontal col-sm-4">
            <dt>车辆型号</dt>
            <dd>
            <input id="vehicleModels" type="text" class="form-control" size="50" readonly value="" />
          </dd>
          </dl>
        <dl class="dl-horizontal col-sm-4">
            <dt>颜色</dt>
            <dd>
            <input id="color" type="text" class="form-control" size="50" readonly value="" />
          </dd>
          </dl>
      </div>
        <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
            <dt>万公里数</dt>
            <dd>
            <input id="mileaged" type="text" class="form-control sml-control" size="50" readonly value=""   />
          </dd>
          </dl>
        <dl class="dl-horizontal col-sm-4">
            <dt><i class="text-danger">*</i> 方向盘锁号</dt>
            <dd>
            <input id="steeringlocknumber" type="text" class="form-control" size="50" />
          </dd>
          </dl>
        <dl class="dl-horizontal col-sm-4">
            <dt><i class="text-danger">*</i> 车轮锁号</dt>
            <dd>
            <input id="wheellocknumber" type="text" class="form-control" size="50" />
          </dd>
          </dl>
      </div>
        <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
            <dt><i class="text-danger">*</i> 停车位号</dt>
            <dd>
            <input id="parkspace" type="text" class="form-control" size="50"   />
          </dd>
          </dl>
        <dl class="dl-horizontal col-sm-4">
            <dt><i class="text-danger">*</i> 停车场</dt>
            <dd>
            <input id="parklot" type="text" class="form-control" />
          </dd>
          </dl>
      </div>
      </div>
    <div class="from_box">
        <div class="from_tit clearfix">
        <h3 class="pull-left">入库记录</h3>
      </div>
        <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
            <dt><i class="text-danger">*</i> 入库时间</dt>
            <dd>
            <div class="input-group date form_date" data-date=""
                             data-date-format="yyyy-mm-dd"
                             data-link-field="dateJoined"
                             data-link-format="yyyy-mm-dd" style="width:200px;">
                        <input id="instocktime" class="form-control" type="text" value="" readonly style="width:100%;" >
              <span class="input-group-addon"><span
                      class="glyphicon glyphicon-calendar"></span></span> </div>
            <input type="text" hidden="hidden" id="dateJoined" name="dateJoined" />
          </dd>
          </dl>
        <dl class="dl-horizontal col-sm-4">
            <dt><i class="text-danger">*</i> 入库人</dt>
            <dd>
            <input id="instockstuff" type="text" class="form-control" size="50" />
          </dd>
          </dl>
        <dl class="dl-horizontal col-sm-4">
            <dt><i class="text-danger">*</i> 停车场接收人</dt>
            <dd>
            <input id="instockparkerstuff" type="text" class="form-control" size="50" />
          </dd>
          </dl>
      </div>
      </div>
    <div class="from_box">
        <div class="from_tit clearfix">
        <h3 class="pull-left">处理意见</h3>
      </div>
        <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
            <dt><i class="text-danger">*</i> 处理意见</dt>
            <dd>
            <select id="reviewconclusion_instock" class="form-control" >
                <option>入库</option>
              </select>
          </dd>
          </dl>
        <dl class="dl-horizontal col-sm-8">
            <dt><i class="text-danger">*</i> 备注</dt>
            <dd>
            <textarea cols="168" rows="3" class="form-control" id="remark"
                                  name="remark" placeholder="其他信息请写入到备注栏中"></textarea>
          </dd>
          </dl>
      </div>
        <div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-12">
                <dt> 附件上传</dt>
                <dd>
                    <ul class="fj_list">
                        <li>
        
                            <p><i class="text-danger">*</i> 入库照片</p>
                            <a href="javascript:;" class="file">选择文件
                                <input type="file" name="" id="up_img_WU_FILE_0">
                            </a>
                            <p class="file_img"><img id="imgShow_WU_FILE_0" ></p>
                        </li>
                        <li>
                            <p> 停车位照片</p>
                            <a href="javascript:;" class="file">选择文件
                                <input type="file" name="" id="up_img_WU_FILE_1">
                            </a>
                            <p class="file_img"><img id="imgShow_WU_FILE_1" ></p>
                                          </li>
                        <li>
                            <p> 库管员与车合照</p>
                            <a href="javascript:;" class="file">选择文件
                                <input type="file" name="" id="up_img_WU_FILE_2">
                            </a>
                            <p class="file_img"><img id="imgShow_WU_FILE_2" ></p>
                        </li>
                                    </ul>
                </dd>
            </dl>
        </div>
    </div>
  </div>
    <div class="modal-footer">
        <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "colsediv(0)" class="btn btn-default btn-block">关闭</a> </p>
        <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "submitinstock()" class="btn btn-danger btn-block">提交入库</a> </p>
    </div>
</div>
<div id="in_product_modal2" class="modal fade in">
    <div class="modal-header" id="header1"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel5" style="font-size:16px;">押品入库</h4>
    </div>
    <div class="modal-body" style="background:#eee;">
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">基本信息</h3>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>押品编号</dt>
                        <dd id="stockobjectnumber_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>客户姓名</dt>
                        <dd id="customer_name_v"></dd>
                    </dl>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>订单编号</dt>
                        <dd id="orderid_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>押品类型</dt>
                        <dd id="stockobjectkind_v"></dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">车辆信息</h3>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>车牌号码</dt>
                        <dd id="vehicle_no_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>车辆型号</dt>
                        <dd id="vehicleModels_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>颜色</dt>
                        <dd id="color_v"></dd>
                    </dl>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>万公里数</dt>
                        <dd id="mileaged_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>方向盘锁号</dt>
                        <dd id="steeringlocknumber_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>车轮锁号</dt>
                        <dd id="wheellocknumber_v"></dd>
                    </dl>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>停车位号</dt>
                        <dd id="parkspace_v" ></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>停车场</dt>
                        <dd id="parklot_v"></dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">入库记录</h3>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>入库时间</dt>
                        <dd id="instocktime_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>入库人</dt>
                        <dd id="instockstuff_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>停车场接收人</dt>
                        <dd id="instockparkerstuff_v"></dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">处理意见</h3>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>处理意见</dt>
                        <dd id="remark_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>备注</dt>
                        <dd id="reviewconclusion_instock_v"></dd>
                    </dl>
                </div>

            </div>
        </div>
    </div>
    <div class="modal-footer">
        <p class="col-sm-2" style="padding-left:0px;"> <a  href = "javascript:void(0)" onclick = "colsediv(0)" class="btn btn-default btn-block">关闭</a> </p>
    </div>
</div>
<div id="qs_box" class="modal modal_sml fade in">
  <div class="modal-header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel1" style="font-size:16px;">提示</h4>
  </div>
  <div class="modal-body" >
    <p class="p_tip"><i class="fa fa-check-circle"></i> 此订单已被签收！</p>
    <div class="btn_list clearfix"><a class="btn btn-danger btn-sm" href="add.html" onclick = "colsediv(0)" >现在去评估</a><a class="btn btn-default btn-sm" href = "javascript:void(0)" onclick = "colsediv(0)" >暂不评估</a></div>
  </div>
</div>
<div id="hmd_box" class="modal modal_sml fade in">
  <div class="modal-header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel2" style="font-size:16px;">提示</h4>
  </div>
  <div class="modal-body" >
    <p class="p_tip"><i class="fa fa-question-circle"></i> 确认将此押品拉入黑名单么！</p>
    <div class="btn_list clearfix"><a class="btn btn-danger btn-sm" href="index.html" onclick = "colsediv(0)" >确认</a><a class="btn btn-default btn-sm" href = "javascript:void(0)" onclick = "colsediv(0)" >取消</a></div>
  </div>
</div>
<div id="fade2" class="black_overlayx"> </div>
</body>
<script src="${basePath}/js/tableutils.js"></script>
<script type="text/javascript">
    $(function() {
        init();
    });

    function init() {
        var orderNo = $("#txt_orderid").val();

        if (("" != orderNo && null != orderNo)) {
            onLoadDate(param());
        }else{
            onLoadDate(null);
        }
    }

    function onLoadDate(param) {
        var writetablefn = function (data)

        {
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
                loanStatusStr = "待电话核实";
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
            }else if (loanStatus == "urgeRepayment") {
                loanStatusStr = "还款催收";
            }else if (loanStatus == "detainCar") {
                loanStatusStr = "风控逾期处理";
            }else if (loanStatus == "fineSet") {
                loanStatusStr = "罚息处理";
            }else if (loanStatus == "advancedRepaymented") {
                loanStatusStr = "提前还款审核";
            }else if (loanStatus == "continueUpload") {
                loanStatusStr = "续借手续处理";
            }else if (loanStatus == "continueRepayment") {
                loanStatusStr = "续借还款审核";
            }else if (loanStatus == "lateProcessed") {
                loanStatusStr = "风控二次处理";
            } else if (loanStatus == "badLoanApplication") {
                loanStatusStr = "坏账归档处理";
            }else if (loanStatus == "continueLoan") {
                loanStatusStr = "借款展期续借";
            }else if (loanStatus == "detainedCarDispose") {
                loanStatusStr = "已拖车处理";
            }else if (loanStatus == "end") {
                loanStatusStr = "已完结";
            }else if(loanStatus == "saleRepayment"){
                loanStatusStr = "卖车还款";
            }else if(loanStatus == "detainedCarRepayment"){
                loanStatusStr = "还款提车";
            }else if(loanStatus == "vehicleNoSaleRepayment"){
                loanStatusStr = "还款不提车";
            }else if (loanStatus == "mortgage") {
                loanStatusStr = "待办理抵押";
            }else if (loanStatus == "instock") {
                loanStatusStr = "待办理入库";
            }else if (loanStatus == "mortgage_rejected"){
                loanStatusStr = "抵押失败";
            }else if (loanStatus == "dataReview_rejected"){
                loanStatusStr = "总部资料复核失败";
            }else if (loanStatus == "visiteCheck_rejected"){
                loanStatusStr = "线下上门核实失败";
            }

            var pledgeType = data.pledgeType;
            var pledgeTypeStr = "";
            if(pledgeType == "drivePledge"){
                pledgeTypeStr = "押证";
            }else if(pledgeType == "vehiclePledge"){
                pledgeTypeStr = "押车";
            }

            var jiaji = "";
            var states="no";
            if(data.state == "yes"){
                jiaji = "<i class='fa fa-bookmark text-success'></i>&nbsp;&nbsp;";
                states="yes";
            }

            var isImportant = "";
            if(data.isImportant == "1"){
                isImportant = "<i class='fa fa-star text-danger'></i>&nbsp;&nbsp;";
            }

            var caozuo;

            if(data.assignee != null && data.assignee != ""){
                if((loanStatus == "vehicleAssess")||
                        (loanStatus == "instock")){
                    caozuo =  "<td><a href='${basePath}/admin/todo?method=detail&taskId="+data.taskId+"'>处理</a></td>";
                }else if(loanStatus=="reuploadInformatin"){
                    caozuo="<td><a href='#' onclick='setCustomerIdHidden2(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.assignee+":"+data.loanStatus+":no  >处理</a></td>"
                }
                else{
                    caozuo="<td><a href='#' onclick='setCustomerIdHidden(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.assignee+":"+data.loanStatus+":no  >处理</a></td>"
                }
            }else{
                caozuo =  "<td><a id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'>签收</a></td>";
            }

            context = "<tr id="+data.uuid+":"+states+" onclick='setEditCustomer(this)'>"
                    + "<td>" +jiaji+ "<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.assignee+":"+data.loanStatus+":yes"
                    + " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" + data.orderid + "</a>" + "</td>"
                    + "<td>" + isImportant
                    + "<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.repId+":"+":"+data.customerId
                    + " onclick='getlenderdetails(this)' href='javascript:void(0);'>"
                    +data.customerName + "</a></td>"
                    + "<td>" + loanStatusStr + "</td>"
                    + "<td>" + pledgeTypeStr + "</td>"
                    + "<td>" + data.createBy + "</td>"
                    + "<td>" + data.principalName + "</td>"
                    + "<td>" + data.createdAt.substring(0,19) + "</td>"
                    + caozuo
                    + "</tr>";
            return context;
        };

        pageComm("${basePath}/admin/loan/queryinstocklist", param == null ? {} : param, writetablefn, "instocklist", 17);
        $("#txt_orderid").val(null);
    }
    function claim(obj) {
        var taskId = $(obj).attr("id");
        $.ajax({
            type: "POST",
            url: "/admin/todo?method=claim",
            dataType: "json",
            data: {
                taskId: taskId

            },
            success: function (data) {
                var data1 = eval(data);
                var code = data1.res;
                if (code) {
                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        select('claim');
                        return true;
                    });
                } else {
                    {
                        layer.msg("操作失败!");
                        return false;
                    }
                }
            },
            error: function () {
                layer.msg("未知错误!");
                return false;
            }

        });

    }
    function carinstock(obj){
        $("#customer_id_hidden").val($(obj).attr("id"));
        opendiv('in_product_modal');
        getdata();
    }
    function carinstockfulldata(obj){
        $("#customer_id_hidden").val($(obj).attr("id"));
        opendiv('in_product_modal2');
        getcompletedata();
    }
    var param = function() {
        return {
            "orderid" : $("#txt_orderid").val(),
        };
    };

    function select() {
        onLoadDate(param());
    }


    function setCustomerIdHidden(obj){
        $("#customer_id_hidden").val($(obj).attr("id"));
        $("#order_modal").load("/admin/loan/vieworderdetails.html");
        opendiv("order_modal");
    }

    //评估押品
    function productEdit(obj){
        window.location = "/admin/customer/vehicleAssess.html?uuid=" + $("#edit_customer_id").val();
    }

    function getdata(){
        var customer_id_hiddenstr = $("#customer_id_hidden").val();
        var strarray = customer_id_hiddenstr.split(":");
        var uuid = strarray[0];
        var orderid = strarray[1];
        $.ajax({
            url : "/admin/loan/queryStockInfoById?loanId=" + uuid +"&direction=in",
            type : "get",
            dataType : "json",
            success : function(data) {
                $("#customer_name").val(data.carstockinfo.customer_name);
                $("#orderid").val(data.carstockinfo.orderid);
                $("#vehicle_no").val(data.carstockinfo.vehicle_no);
                $("#vehicleModels").val(data.carstockinfo.vehicleModels);
                $("#color").val(data.carstockinfo.color);
                $("#mileaged").val(data.carstockinfo.mileaged);
                $("#stockobjectnumber").val(data.stockid);
            }})
    }
    function getcompletedata(){
        var customer_id_hiddenstr = $("#customer_id_hidden").val();
        var strarray = customer_id_hiddenstr.split(":");
        var uuid = strarray[0];
        var orderid = strarray[1];
        $.ajax({
            url : "/admin/loan/queryStockInfoByIdComplete?loanId=" + uuid,
            type : "get",
            dataType : "json",
            success : function(data) {
                $("#stockobjectnumber_v").html(data.carstockinfo.stockobjectnumber);
                $("#customer_name_v").html(data.carstockinfo.customer_name);
                $("#orderid_v").html(data.carstockinfo.orderid);
                $("#stockobjectkind_v").html(data.carstockinfo.stockobjectkind);
                $("#vehicle_no_v").html(data.carstockinfo.vehicle_no);
                $("#vehicleModels_v").html(data.carstockinfo.vehicleModels);
                $("#color_v").html(data.carstockinfo.color);
                $("#mileaged_v").html(data.carstockinfo.mileaged);
                $("#steeringlocknumber_v").html(data.carstockinfo.steeringlocknumber);
                $("#wheellocknumber_v").html(data.carstockinfo.wheellocknumber);
                $("#parkspace_v").html(data.carstockinfo.parkspace);
                $("#parklot_v").html(data.carstockinfo.parklot);
                $("#instocktime_v").html(data.carstockinfo.instocktime);
                $("#instockstuff_v").html(data.carstockinfo.instockstuff);
                $("#instockparkerstuff_v").html(data.carstockinfo.instockparkerstuff);
                $("#remark_v").html(data.carstockinfo.remark_instoke);
                $("#reviewconclusion_instock_v").html(data.carstockinfo.reviewconclusion_instock);
            }})
    }
    //提交入库信息
    function submitinstock(){
        //对用户的必填信息进行检查
        var steerlocknumber = $("#steeringlocknumber").val();
        if((steerlocknumber == "")|| (steerlocknumber == null)){
            layer.msg("方向盘锁号没有填写，请确认！");
            return false;
        }
        var wheellocknumber = $("#wheellocknumber").val();
        if((wheellocknumber == "")||(wheellocknumber == null)){
            layer.msg("车轮锁号没有填写，请确认！");
            return false;
        }
        var parkspace = $("#parkspace").val();
        if((parkspace == "")||(parkspace == null)){
            layer.msg("停车位编号没有填写，请确认！");
            return false;
        }
        var parklot = $("#parklot").val();
        if ((parklot == "")||(parklot == null)){
            layer.msg("停车场编号没有填写，请确认！");
            return false;
        }
        var instocktime = $("#instocktime").val();
        if ((instocktime == "")||(instocktime == null)){
            layer.msg("入库时间没有填写，请确认！");
            return false;
        }
        var instockstuff = $("#instockstuff").val();
        if((instockstuff == "")||(instockstuff == null)){
            layer.msg("入库人没有填写，请确认！");
            return false;
        }
        var instockparkerstuff = $("#instockparkerstuff").val();
        if ((instockparkerstuff == "")||(instockparkerstuff == null)){
            layer.msg("停车场接收人没有填写，请确认！");
            return false;
        }
        var remark = $("#remark").val();
        if((remark == "")||(remark == null)){
            layer.msg("备注信息请填写！");
            return false;
        }
        //做成参数，更新数据库内容。
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loan/saveinstockinfo.html',
            data: {
                "orderid":$("#orderid").val(),			//订单编号
                "stockobjectnumber": $("#stockobjectnumber").val(),   //押品编号
                "customer_name":$("#customer_name").val(),			//客户姓名
                "vehicle_no":$("#vehicle_no").val(),					//车牌号码
                "vehicleModels":$("#vehicleModels").val(),			//车辆型号
                "color":$("#color").val(),							//车辆颜色
                "mileaged":$("#mileaged").val(),						//行驶里程
                "steeringlocknumber":$("#steeringlocknumber").val(),		//方向盘锁号
                "wheellocknumber":$("#wheellocknumber").val(),		//车轮锁锁号
                "parkspace":$("#parkspace").val(),					//停车位号
                "parklot":$("#parklot").val(),						//停车场编号
                "instocktime":$("#instocktime").val(),				//入库时间
                "instockstuff":$("#instockstuff").val(),			//入库人
                "instockparkerstuff":$("#instockparkerstuff").val(),		//停车场接收人
                "remark":$("#remark").val(),							//备注信息
                "reviewconclusion_instock":$("#reviewconclusion_instock").find("option:selected").text(),		//评审意见
                "stockstatus":"1",										//入库状态
                "stockobjectkind":$("#stockobjectkind").find("option:selected").text()
            },
            dataType: "text",
            success: function (data) {
                if (data == "0000") {
                    layer.msg("入库数据保存成功!");
                    init();
                    colsediv(0);
                    clearFormData();
                    return true;
                } else {
                    layer.msg("入库数据保存失败!");
                    return false;
                }
            },
            error: function (e) {
                layer.msg("操作失败!可能原因：" + e);
                return false;
            }
        });

    }
    function clearFormData(){
        $("#steeringlocknumber").val("");
        $("#wheellocknumber").val("");
        $("#parkspace").val("");
        $("#parklot").val("");
        $("#instocktime").val("");
        $("#instockstuff").val("");
        $("#instockparkerstuff").val("");
        $("#remark").val("");
    }
</script>

</html>