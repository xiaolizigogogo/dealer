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

        $(function() {
          $("#loanAmount").attr("value", (atoc('${loanInfoWithBLOBs.loanMoney}')));

            if(${loanInfoWithBLOBs.chargedoffAt != null}){
                var oneDate = new Date('${loanInfoWithBLOBs.chargedoffAt}');
            }else{
                var oneDate = new Date('${loanInfoWithBLOBs.createdAt}');
            }
            oneDate.setHours(oneDate.getHours() + 2);
            var oneYear = oneDate.getFullYear();
            var oneMonth = oneDate.getMonth();
            var oneDay = oneDate.getDate();
            var oneCurrTime = oneYear + "年" + (oneMonth + 1) + "月" + oneDay + "日";
            $("#chargedoffAt").attr("value", oneCurrTime);
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
        <h1>借款收据</h1>
        <p>本人<input type="text" value="${loanInfoWithBLOBs.customerRegisterInfo.customerName}" size="25" />
            已收到<input type="text"  value="" size="25" />(下称“出借人”）依据其与本人于
            <input type="text" id="chargedoffAt" value="" size="25" />签订之编号YGJKD
            <input type="text" value="" size="25" />号《借款合同》的约定交付给本人的借款本金￥
            <input type="text" value="${loanInfoWithBLOBs.chargedofMoney}" size="25" />元（大写人民币：
            <input type="text" id="loanAmount" value="" size="25" />）整，其中：</p>
        <p>人民币<input type="text" value="" size="25" />元由出借人于
            <input type="text" value="" size="25" />以现金方式交付给本人，人民币
            <input type="text" value="" size="25" />元由出借人于
            <input type="text" value="" size="25" />以银行转账方式支付给本人。</p>
        <p>特立此据为凭。</p>
        <p class="p3">借款人：<input type="text" value="" size="25" /></p>
        <p class="p3"><input type="text" value="" size="25" /></p>
    </div>
</div>
</body>
</html>
