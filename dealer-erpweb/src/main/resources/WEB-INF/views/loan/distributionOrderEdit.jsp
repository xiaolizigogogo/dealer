<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>卖钱翁金融网站后台管理-对接状态修改</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/jquery.validate.js"></script>

</head>

<div class="main-con">
    <div class="normal-area">
        <form class="form-inline clearfix" action="${basePath}/admin/distributionOrderController/edit" id="distributionForm" method="POST">

            <input type="text" hidden="hidden" name="id" value="${id}" id="uuid">
            <div class="con clearfix">
                <div class="row">

                    <div class="form-group col-md-3">
                        <label>对接状态:</label>
                        <select class="form-control" name="status">
                            <option value="8">
                                对接成功
                            </option>
                            <option value="7">
                                对接失败
                            </option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label>备注：</label>
                        <textarea cols="168" rows="3" class="form-control" id="remark"
                                  name="remark"></textarea>
                    </div>
                </div>
            <div class="btn-area">
                <button type="submit" class="btn btn-01" >保存</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>


