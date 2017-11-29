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
    <title>e车贷管理系统</title>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/contract.css" />
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.min.js"></script>
    <script language="JavaScript" type="text/javascript" charset="utf-8">
    </script>
    <script language="JavaScript" type="text/javascript" charset="utf-8">

        $(function () {
            $("#evaluatePrice").text((atoc('${loanInfoWithBLOBs.guaranteeEvaluateInfo.evaluatePrice *10000}')));

            if (${loanInfoWithBLOBs.chargedoffAt != null}) {
                var oneDate = new Date('${loanInfoWithBLOBs.chargedoffAt}');
            } else {
                var oneDate = new Date('${loanInfoWithBLOBs.createdAt}');
            }
            oneDate.setHours(oneDate.getHours() + 2);
            var oneYear = oneDate.getFullYear();
            var oneMonth = oneDate.getMonth();
            var oneDay = oneDate.getDate();
            var oneCurrTime = oneYear + "年" + (oneMonth + 1) + "月" + oneDay + "日";
            $("#chargedoffAt").html( oneCurrTime);
        });

        /**
         * 将阿拉伯数字的金额转为中文
         * @param numberValue 需要转化的金额
         * @returns {string}
         */
        function atoc(numberValue) {
            var numberValue = new String(Math.round(numberValue * 100)); // 数字金额
            var chineseValue = ""; // 转换后的汉字金额
            var String1 = "零壹贰叁肆伍陆柒捌玖"; // 汉字数字
            var String2 = "万仟佰拾亿仟佰拾万仟佰拾元角分"; // 对应单位
            var len = numberValue.length; // numberValue 的字符串长度
            var Ch1; // 数字的汉语读法
            var Ch2; // 数字位的汉字读法
            var nZero = 0; // 用来计算连续的零值的个数
            var String3; // 指定位置的数值
            if (len > 15) {
                //alert("超出计算范围");
                return "";
            }
            if (numberValue == 0) {
                chineseValue = "零元整";
                return chineseValue;
            }

            String2 = String2.substr(String2.length - len, len); // 取出对应位数的STRING2的值
            for (var i = 0; i < len; i++) {
                String3 = parseInt(numberValue.substr(i, 1), 10); // 取出需转换的某一位的值
                if (i != (len - 3) && i != (len - 7) && i != (len - 11) && i != (len - 15)) {
                    if (String3 == 0) {
                        Ch1 = "";
                        Ch2 = "";
                        nZero = nZero + 1;
                    }
                    else if (String3 != 0 && nZero != 0) {
                        Ch1 = "零" + String1.substr(String3, 1);
                        Ch2 = String2.substr(i, 1);
                        nZero = 0;
                    }
                    else {
                        Ch1 = String1.substr(String3, 1);
                        Ch2 = String2.substr(i, 1);
                        nZero = 0;
                    }
                }
                else { // 该位是万亿，亿，万，元位等关键位
                    if (String3 != 0 && nZero != 0) {
                        Ch1 = "零" + String1.substr(String3, 1);
                        Ch2 = String2.substr(i, 1);
                        nZero = 0;
                    }
                    else if (String3 != 0 && nZero == 0) {
                        Ch1 = String1.substr(String3, 1);
                        Ch2 = String2.substr(i, 1);
                        nZero = 0;
                    }
                    else if (String3 == 0 && nZero >= 3) {
                        Ch1 = "";
                        Ch2 = "";
                        nZero = nZero + 1;
                    }
                    else {
                        Ch1 = "";
                        Ch2 = String2.substr(i, 1);
                        nZero = nZero + 1;
                    }
                    if (i == (len - 11) || i == (len - 3)) { // 如果该位是亿位或元位，则必须写上
                        Ch2 = String2.substr(i, 1);
                    }
                }
                chineseValue = chineseValue + Ch1 + Ch2;
            }

            if (String3 == 0) { // 最后一位（分）为0时，加上“整”
                chineseValue = chineseValue + "整";
            }

            return chineseValue;
        }
    </script>
</head>

<body>
<div class="container">
    <div class="contract">
        <h1>机动车质押合同</h1>

        <p class="p3">合同编号:<input type="text" size="18" value="${loanInfoWithBLOBs.pledgeNum}"/></p>

        <p class="p2">
            <span class="span1">甲方（出质人、借款人）：</span><span  class="text_input">${loanInfoWithBLOBs.customerRegisterInfo.customerName}</span>
            身份证号码：<span class="text_input">${loanInfoWithBLOBs.idCard}</span>
        </p>

        <p class="p2"><span class="span1">乙方（质权人、出借人）：</span>
            <input type="text" value="" size="4" />，
            身份证号码：<input type="text" value="" size="18" />
        </p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;甲、乙双方本着平等互利原则，遵循国家有关法律和行政法规，协商一致，订立本合同。</p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;第一条 为切实履行甲方与乙方于<span id="chargedoffAt" class="text_input"></span>签订之编号为${loanInfoWithBLOBs.contractNum}
            的《借款合同》（下称“主合同”），甲方自愿提供质押物为该主合同项下甲方的全部债务、责任提供质押担保。</p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;第二条 甲方提供的质押物为机动车，车辆概况为：（厂牌型号）：<span class="text_input">${loanInfoWithBLOBs.guaranteeEvaluateInfo.vehicleBrand}
        </span> ，车牌号：<span class="text_input">${loanInfoWithBLOBs.guaranteeEvaluateInfo.vehicleNo}</span> ，发动机号：<span class="text_input">${loanInfoWithBLOBs.guaranteeEvaluateInfo.engineNo}</span>
            ，车架号：<span class="text_input">${loanInfoWithBLOBs.guaranteeEvaluateInfo.vehicleIdentification}</span> ，质押
       车辆作价人民币（大写）<span id="evaluatePrice" class="text_input"></span>。</p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;第三条 甲方保证该质押车辆属本人所有，在质押前未将该质押车辆转让、出租、抵押、质押、担保及保全等，无任何经济纠纷。</p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;第四条 主合同约定借款金额人民币（大写） 元整，借款期限自 年 月 日至 年 月 日，甲方应按主合同约定按时还本付息。<span class="span1">甲方迟延支付任何金额的应付利息或迟</span></p>

        <p class="span1">延偿还任何金额的应还本金达5天的，乙方可终止合同并按规定处置质押物。</p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;第五条
            甲方应于本合同签订当日将质押车辆交由乙方质押，同时甲方应随车移交：___套车辆钥匙、车辆登记证原件、行驶证原件、保险单（含交强险、商业险）、完税证明、购车发票。在质押期间甲方不得将质押物及暂管物品挂失、转让或质押。<span class="span1">质押期间，甲方应按每月450 元的标准向乙方支付保管费。</span></p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;第六条
            甲方保证在合同约定的借款期限内偿还借款，如甲方不能按期偿还借款的，乙方有权处置质押物或委托当地拍卖行拍卖。乙方处置质押物所得款项，除收回借款本金、利息、违约金、催收费用以及扣除处置质押物所需费用外，剩余部分退还甲方，不足部分有权向甲方继续追偿。</p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;第七条
            甲方承诺声明：甲方违约的，乙方可处置质押物，一旦质押物被乙方按合同处置，甲方应无</p>

        <p></p>条件、无偿配合乙方办理过户手续。</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;第八条 质押担保的范围：</p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;质押担保的范围为甲方在主合同项下的全部债务，包括但不限于：借款本金、利息、违约金、赔偿金和乙方为主张债权及处置质押物所产生的全部费用（包括上门催收费用、诉讼受理费、仲裁费、保全费、执行费、律师费、公告费、拍卖费、过户费、评估费），等等。</p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;第九条 质押担保的期限：</p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;质押担保的期限自本合同签订之日起至主合同约定的借款期限届满后两年止。甲方确认：主合同项下的借款期限延长的，上述质押担保的期限亦自动顺延。</p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;第十条 争议解决：</p>
        <p><span
            class="span1">&nbsp;&nbsp;&nbsp;&nbsp;甲、乙双方因履行本协议产生争议无法协商解决的，均应提请清远仲裁委员会根据该会相关规则在东莞市仲裁，仲裁程序为简易程序书面审理，双方一致同意以下地址为仲裁送达地址：甲方的仲裁送达地址为：<input type="text" value="" size="40"/>，乙方的仲裁送达地址为：<input type="text" value=""
                                                                    size="40" />
            ，仲裁裁决是终局的，对各方当事人均有约束力。</span></p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;第十一条 本合同一式三份。甲乙双方各持一份。有关登记部门一份。</p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;第十二条 本合同经甲、乙双方签字、盖章后生效。</p>

        <p class="p1">甲方（签章）：<input type="text" value="" size="20" />
            乙方（签章）:<input type="text" value="" size="20" />
        <p>
        <p class="p1">签订日期：<input type="text" value="" size="20" />签订地点：<input type="text"
                                                                              value="" size="20"
            /></p>
    </div>
</div>
</body>
</html>
