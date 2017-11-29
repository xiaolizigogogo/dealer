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
            $("#chargedoffAt").html(oneCurrTime);

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

        <h1>抵押合同</h1>

        <p class="p3">合同编号:<input type="text" size="18" />${loanInfoWithBLOBs.guarantyNum}</p>

        <p class="p2">
            <span class="span1">借款人（甲方）：</span><span class="text_input">${loanInfoWithBLOBs.customerRegisterInfo.customerName}</span>身份证号码：
            <span class="text_input">${loanInfoWithBLOBs.idCard}</span>
        </p>

        <p class="p2"><span class="span1">出借人（乙方）：</span>
            <input type="text" value="王强" size="4" />，
            身份证号码：<input type="text" value="36250219840608441X" size="18" />
        </p>

        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;甲方以其拥有处分权的 机动车 作为抵押物，为切实履行其与乙方于<span id="chargedoffAt" class="text_input"></span>签订之编号为 ${loanInfoWithBLOBs.contractNum}的《借款合同》（下称“主合同”）项下的全部债务、责任提供抵押担保。
        </p>

        <p>&nbsp;&nbsp;&nbsp;&nbsp;基于上述事由，甲、乙双方经协商一致，特订立本合同。</p>

        <p>一、 抵押车辆的概况：</p>

        <p>1. 机动车登记证号码： ；</p>

        <p>2. 厂牌型号： 牌 型汽车；</p>

        <p>3. 品牌号码：${loanInfoWithBLOBs.guaranteeEvaluateInfo.vehicleBrand} ；</p>

        <p>4. 发动机号码：${loanInfoWithBLOBs.guaranteeEvaluateInfo.engineNo}；</p>

        <p>5. 车辆识别代号： 　　　　 。</p>

        <p>二、抵押车辆的价值：</p>

        <p>甲、乙双方一致同意抵押车辆的价值按照人民币 <span id="evaluatePrice" class="text_input"></span>计算。</p>

        <p>三、抵押担保的范围：</p>

        <p>抵押担保的范围为甲方在主合同项下的全部债务，包括但不限于：借款本金、利息、违约金、赔偿金和</p>

        <p>乙方为主张债权及实现抵押权所产生的全部费用（包括上门催收费用、诉讼受理费、仲裁费、保全费、</p>

        <p>执行费、律师费、公告费、拍卖费、过户费、评估费），等等。</p>

        <p>四、抵押担保的期限：</p>

        <p>1. 抵押担保的期限自本合同签订之日起至主合同约定的借款期限届满后满两年当日止。</p>

        <p>2. 甲方确认：主合同项下的借款期限延长的，上述抵押担保的期限亦自动顺延。</p>

        <p>五、抵押登记手续：</p>

        <p>1. 甲方须于签订本合同之日起 日内配合乙方办妥抵押车辆的登记手续，配合的方式包括：</p>

        <p>（1） 本人亲自到东莞市车辆管理所配合乙方办理抵押车辆的抵押登记手续；</p>

        <p>（2） 出具授权委托书，委托乙方或乙方指定的人员代表甲方办理抵押车辆的抵押登记手续。</p>

        <p>2. 上述抵押登记手续办妥的标志为：乙方取得了抵押车辆的抵押他项权证明文件。</p>

        <p>3. 办理上述抵押登记手续所需交纳的税、费由甲方承担。</p>

        <p>六、甲方的责任：</p>

        <p>1. 确保抵押车辆归甲方合法独立所有，不存在权属争议。</p>

        <p>2. 将抵押车辆的机动车登记证、车辆购置税凭证及商业保险的保险单的原件移交给乙方保管（保险受益人须批改为乙方）。</p>

        <p>3. 配合乙方为抵押车辆安装gps定位系统，在抵押期间确保不拆除、不损坏该定位系统并随时接受乙方的检查。</p>

        <p>4. 妥善保管及合理使用抵押车辆，未经乙方书面同意不得擅自处分（包括出租、出售、藏匿、抵押、质押等各种处分方式）抵押车辆。</p>

        <p>5. 在抵押车辆发生损坏或被盗、被抢时，及时通知乙方并配合乙方做好保险索赔工作（赔偿款须优先用于代债务人向甲方清偿债务）。</p>

        <p>6. 承担本合同约定的其他各项责任。</p>

        <p>七、乙方的责任：</p>

        <p>1.在甲方清偿完主合同项下的全部债务后，将抵押车辆的机动车登记证及商业保险的保险单原件交还给甲方（乙方须配合将保险受益人重新批改为甲方），并配合甲方注销抵押车辆的抵押登记手续及拆除抵押车辆的gps定位系统。</p>

        <p>2. 承担本合同约定的其他责任。</p>

        <p>八、抵押权的实现：</p>

        <p>1. 出现下列情形之一时，乙方有权处分抵押车辆并以所得到的价款优先受偿：</p>

        <p>（1）甲方拖欠应付利息及/或应还本金的；</p>

        <p>（2）乙方按照主合同的约定提前解除该合同的；</p>

        <p>（3）甲方未经乙方同意擅自处分抵押车辆的；</p>

        <p>（4）甲方被依法宣告解散或者破产的；</p>

        <p>（5）出现乙方有权处分抵押车辆的其他法定情形的。</p>

        <p>2. 乙方处分抵押车辆所得价款扣除乙方的全部债权金额后若有剩余的，剩余部分应交还给甲方，若不足，可就不足部分继续向甲方追偿。</p>

        <p>九、特别约定：</p>

        <p>1. 抵押期间，抵押车辆的价值因故贬损的，乙方有权要求甲方提供新的抵押物。</p>

        <p>2. 抵押期间，甲方经乙方书面同意可以处分抵押物，但所得价款须优先用于代债务人向乙方清偿债务。</p>

        <p>3. 抵押期间，乙方将主合同项下的债权转让给第三方的，乙方依据本合同所享有的抵押权一并转让给该第三方，甲方须无条件配合办理变更抵押登记手续。</p>

        <p>4. 甲方确认已经详细查阅过主合同的全部内容，且对该等内容没有异议。</p>

        <p>5. 本合同的效力独立于主合同，即使主合同无效，本合同仍然有效，乙方仍然有权要求甲方对甲方在主合同项下的全部债权继续承担抵押担保责任或赔偿责任。</p>

        <p>十、违约责任</p>

        <p>1. 甲、乙双方任何一方违反本合同的约定造成对方损失的，须足额赔偿对方全部损失。</p>

        <p>2. 因甲方违约造成乙方对甲方提起诉讼的，乙方所产生的诉讼受理费、保全费、执行费、律师费、公告费、评估费等均由甲方负责赔偿。</p>

        <p><span class="span1">十一、争议处理</span></p>

        <p><span class="span1">&nbsp;&nbsp;&nbsp;&nbsp;甲、乙双方因履行本协议产生争议无法协商解决的，均应提请清远仲裁委员会根据该会相关规则在
        东莞市仲裁，仲裁程序为简易程序书面审理，双方一致同意以下地址为仲裁送达地址：甲方的仲裁送达地址为：<input type="text" value="" size="40"
                    />，乙方的仲裁送达地址为：<input type="text" value="广东省东莞市东城区花园裕兴楼B座1701房" size="40" />
            ，仲裁裁决是终局的，对各方当事人均有约束力。</span></p>

        <p>十二、其他</p>

        <p>1.&nbsp;&nbsp;本合同自甲、乙双方共同签署后生效。</p>

        <p>2.&nbsp;&nbsp;本合同一式叁份，一份用于办理抵押登记手续，另两份由甲、乙双方各执一份。</p>

        <p class="p1">甲方（签章）：<input type="text" value="" size="25" />
            乙方（签章）:<input type="text" value="" size="25" />

        <p>

        <p class="p3">签订日期：<input type="text" value="" size="25" id="contractAwardDate"
                                  readonly /></p>

        <p class="p3">签订地点：<input type="text" value="" size="25" /></p>
    </div>
</div>
</body>

</html>
