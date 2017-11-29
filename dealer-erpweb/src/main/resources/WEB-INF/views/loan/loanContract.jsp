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
    <link rel="stylesheet" type="text/css" href="${basePath}/css/contract.css"/>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.min.js"></script>
    <script language="JavaScript" type="text/javascript" charset="utf-8">
        $(function () {
            $("#loanAmount").text(atoc('${loanInfoWithBLOBs.loanMoney}'));

            // 借款的起止时间
            var oneDate = new Date('${oneTime}');
            oneDate.setHours(oneDate.getHours() + 2);
            var oneYear = oneDate.getFullYear();
            var oneMonth = oneDate.getMonth();
            var oneDay = oneDate.getDate();
            var oneCurrTime = oneYear + "年" + (oneMonth + 1) + "月" + oneDay + "日";
            $("#oneTime").html(oneCurrTime);//借款期限的起始日期
            $("#repayWayDate").html(oneCurrTime);//还款方式：等本等息的起始时间
            $("#repayWayDay").html((oneDay - 1) + "日");//还款方式：等本等息每月指定日期前返还

            $("#twoTime").html(oneCurrTime);//先息后本的起始时间
            $("#twoDay").html((oneDay - 1) + "日");//还款方式：先息后本每月指定日期前返还

            var date = new Date('${endTime}');
            date.setHours(date.getHours() + 2);
            var year = date.getFullYear();
            var month = date.getMonth();
            var day = date.getDate();
            var currTime = year + "年" + (month + 1) + "月" + day + "日";
            $("#endTime").html(currTime);//借款期限的截止日期
            $("#threeTime").html(currTime);//还款方式：先息后本截止时间

            var contractDate = new Date();
            contractDate.setHours(contractDate.getHours() + 2);
            var contractYear = contractDate.getFullYear();
            var contractMonth = contractDate.getMonth();
            var contractDay = contractDate.getDate();
            var contractCurrTime = year + "年" + (month + 1) + "月" + day + "日";
            $("#contractAwardDate").attr("value", contractCurrTime);//签订日期
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
        <h1>借款合同</h1>
        <p class="p3">合同编号:<input type="text" value="${loanInfoWithBLOBs.contractNum}" size="18"
                /></p>
        <p class="p2">
            <span class="span1">借款人（甲方）：</span><span class="text_input">
            ${loanInfoWithBLOBs.customerRegisterInfo.customerName}</span>身份证号码：<span
                class="text_input">${loanInfoWithBLOBs.idCard}</span>
        </p>
        <p class="p2"><span class="span1">出借人（乙方）：</span>
            <input type="text" value="王强" size="4"/>，
            身份证号码：<input type="text" value="36250219840608441X" size="18"/>
        </p>
        <p>
            甲、乙双方经协商一致，现就甲方向乙方借款一事达成本协议条款如下：
        </p>
        <p> 一、借款金额、用途、期限、利率：</p>
        <p>1.&nbsp;&nbsp;借款金额：人民币<span id="loanAmount"
                                             class="text_input"></span>（￥：<span
                class="text_input">${loanInfoWithBLOBs.loanMoney}</span>元）。
        </p>
        <p> 2.&nbsp;&nbsp;借款用途：<span
                class="text_input">${loanInfoWithBLOBs.loanPurpose}</span>，
        <p>
            3.&nbsp;&nbsp;借款期限：&nbsp;借款期限<span
                class="text_input">${loanInfoWithBLOBs.loanLimitTime}</span>个月，即：从
            <span class="text_input" id="oneTime"></span>起至<span class="text_input"
                                                                 id="endTime"></span>止。</p>
        <p> 4.&nbsp;&nbsp;借款利率：&nbsp;月利率为借款金额的<span
                class="text_input"><fmt:formatNumber value="${loanInfoWithBLOBs.loanRate/12}"
                pattern="#.00"/></span>%。</p>

        <p>上述利率标准须以甲方按照约定用途使用借款且按期还款为前提，若甲方挪用借款，则月利率须改按借
            款金额的<input type="text" value="" size="1" />%计算，若甲方迟延还款，则月利率须改按借款金额的<input type="text"
                                                                                      value=""
                                                                                      size="1"/>%计算。</p>
        <p> 二、借款担保：</p>
        <p>1.&nbsp;&nbsp;甲方承诺为切实履行本合同项下的全部债务、义务向乙方提供以下第<span class="text_input">（1）</span>种担保：
        </p>
        <p>（1）汽车抵押担保：车牌：<span
                class="text_input">${loanInfoWithBLOBs.guaranteeEvaluateInfo.vehicleNo}</span>
            车架号：<span
                    class="text_input">${loanInfoWithBLOBs.guaranteeEvaluateInfo.vehicleIdentification}</span>
            发动机号：<span class="text_input">${loanInfoWithBLOBs.guaranteeEvaluateInfo.engineNo}</span>
        <p>（2）房地产抵押担保：坐落于<span class="text_input">无</span>
            房产证号：<span class="text_input">无</span></p>
        <p>（3）第三方连带责任保证担保：担保人：<span class="text_input">无</span>身份证号码：<span
                class="text_input">无</span></p>
        <p>（4）其他形式的担保：<span class="text_input">无</span></p>
        <p>2.&nbsp;&nbsp;上述担保的各项手续须在乙方向甲方交付上述借款金额之前办妥。</p>
        <p>3.&nbsp;&nbsp;上述抵押担保或保证担保的范围包括：甲方在本合同项下的全部债务，包括但不限于：借款本金、利
            息、违约金、赔偿金和乙方为主张债权及实现抵押权所产生的全部费用（包括上门催收费用、诉讼受理费、仲裁费、保全费、执行费、律师费、
            公告费、拍卖费、过户费、评估费），等等。担保期限从借款期限（借款期限延长的，担保期限顺延）届满后满两年止。</p>
        <p>三、借款交付方式：</p>
        <p>上述借款由乙方通过银行转账方式或支付现金方式交付给甲方，若通过银行转账方式交付，则须将借款金额汇入甲方下述收款账户（乙方可以自行，亦可以委托第三方将上述借款本金交付给甲方）：</p>
        <p>开户名称：
            <input type="text" readonly
                   value="${loanInfoWithBLOBs.customerAccountInfo.accountName}"/></p>
        <p>开户银行：<input type="text" readonly
                       value="${loanInfoWithBLOBs.customerAccountInfo.bankName}"/></p>
        <p>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input type="text" readonly
                                                               value="${loanInfoWithBLOBs.customerAccountInfo.accountNum}"/></p>
        <p>四、还款付息方式： </p>
        <p>1.&nbsp;&nbsp;&nbsp;甲方选择按照以下第<span class="text_input">
            <c:if test="${loanInfoWithBLOBs.repayWay == 'AverageCapitalPlusInterest'}">(2)</c:if>
            <c:if test="${loanInfoWithBLOBs.repayWay == 'InterestRatesBefore'}">(1)</c:if>
            </span>种方式向乙方还本付息：
        <c:if test="${loanInfoWithBLOBs.repayWay == 'AverageCapitalPlusInterest'}">
            <p>（1）先息后本：自&nbsp;<span class="text_input">无</span>年<span class="text_input">无</span>月<span
                    class="text_input">无</span>日起，每月<span class="text_input">无</span>日前结清当月利息，<span
                    class="text_input">无</span>年<span class="text_input">无</span>月<span
                    class="text_input">无</span>日前一次性还清全部借款本息。 </p>
            <p>（2）等本等息：自<span class="text_input" id="repayWayDate"></span>起，每月<span
                    class="text_input" id="repayWayDay"></span>日前各偿还借款本金人民币
                <input type="text" value="" size="8" />元、利息人民币<input type="text" value=""
                                                                     size="8" />
                元（详见《还款计划说明》）。</p>
        </c:if>

        <c:if test="${loanInfoWithBLOBs.repayWay == 'InterestRatesBefore'}">
            <p>（1）先息后本：自<span class="text_input" id="twoTime"></span>起，每月<span class="text_input" id="twoDay"></span>
                日前结清当月利息，<span class="text_input" id="threeTime"></span>前一次性还清全部借款本息。</p>
            <p>（2）等本等息：自<span class="text_input">无</span>年<span class="text_input">无</span>月
                <span class="text_input">无</span>日起，每月<span class="text_input">无</span>日前各偿还借款本金人民币
                <span class="text_input">无</span>元、利息人民币<span class="text_input">无</span>元（详见《还款计划说明》）。</p>
        </c:if>
        <p>2.&nbsp;&nbsp;甲方须将上述应还本息汇入乙方下述收款账户：</p>
        <p>开户名称：<input type="text" value="王强" size="18" /></p>
        <p>开户银行：<input type="text" value="中国银行东莞市东城东昇支行" size="25" /></p>
        <p>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input type="text" value="6217 8570 0001 8487 486"
                                                               size="25" />
        </p>
        <p>五、提前解除合同</p>
        <p>1.&nbsp;&nbsp;出现下述情形之一时，乙方有权单方面提前解除本合同：
        <p>（1）本合同约定的担保手续未能在本合同签订之日起<input type="text" value="" size="2" />日内办妥的；</p>
        <p>（2）甲方未按照本合同约定的用途使用借款的；</p>
        <p>（3）甲方迟延支付任何金额的应付利息或迟延偿还任何金额的应还本金达到<input type="text" value="" size="1" />天的；</p>
        <p>（4）甲方未经乙方同意为第三方提供担保或处置重要资产影响偿债能力的；</p>
        <p>（5）甲方因拖欠债务被第三方起诉或申请仲裁的；</p>
        <p>（6）甲方提供的担保措施为汽车、房产抵押担保时，抵押人擅自处分（藏匿、质押、转让、抵押等）作为担保物的汽车、房产或该等汽车、房产因损坏而严重贬值；</p>
        <p>（7）甲方提供的担保措施为第三方保证担保时，保证人未经乙方同意为第三方提供担保或处置重要资产影响偿债能力或保证人因拖欠债务被第三方起诉或申请仲裁的；</p>
        <p>（8）甲方提供的担保措施为其他担保方式的，担保人的偿债能力降低、被起诉、被申请仲裁或担保财产、权利的价值贬值的；</p>
        <p>（9）出现了其他可能严重影响甲方归还上述借款本息的行为。</p>
        <p>（10）甲方迟延或者拒绝配合乙方升级、维护抵押车辆的gps系统达到2次的。</p>
        <p>2.&nbsp;&nbsp;乙方按照上述约定提前解除本合同的，甲方须一次性提前清偿全部未还、未付借款本息给乙方（利息及违约金须计至付清、还清全部本息当日）。</p>
        <p>六、特别约定</p>
        <p>1.&nbsp;&nbsp;借款期间，甲方应按乙方的要求，定期、如实向乙方报告财务状况并提供相关资料。</p>
        <p>2.&nbsp;&nbsp;借款期间，乙方有权委托、委派有关人员对甲方使用借款的情况核查。</p>
        <p>3.&nbsp;&nbsp;甲方提供的担保措施为汽车抵押担保的，抵押汽车需驶出省外的应提前向乙方申请。</p>
        <p>4.&nbsp;&nbsp;甲方拖欠借款本息时，乙方有权委托、委派有关人员上门催收。</p>
        <p>5.&nbsp;&nbsp;甲方拖欠借款本息或发生其他严重影响借款本息归还的情况时，乙方有权直接处分抵押物，处分手段包括但不限于：锁车、强制开回、拖车、看管、出售抵押车辆，强制腾空、评估、出售抵押房产，其他回收、处分方式。</p>
        <p>6.&nbsp;&nbsp;甲方需延期还款的，须在借款到期届满七天之前向乙方提交书面延期还款申请，乙方同意申请的，甲方须与乙方签订延期协议或重新签订借款合同。</p>
        <p>7.&nbsp;&nbsp;出现第五条第1款第（4）-（10）项所列情况时，甲方能够按照乙方的要求提供新的担保措施时，甲方可以不提前解除本合同。</p>
        <p>七、违约责任</p>
        <p>1.&nbsp;&nbsp;甲方迟延付息或迟延还本的，每迟延一天，须按借款总额的<span class="text_input">0.3</span>% 向乙方支付违约金。</p>
        <p>2.&nbsp;&nbsp;甲方因故要求提前还款的，须按照上述借款金额的<input type="text" value="" size="1" />%向乙方支付违约金。</p>
        <p>3.&nbsp;&nbsp;甲方违约造成乙方委托、委派有关人员上门催收的，每上门一次，甲方须赔偿乙方催收费（包括人工费、食宿费、路桥费、车辆损耗、油料损耗等费用）人民币
            <span class="text_input">1000</span>元（需跨省催收的，每次10000元）。</p>
        <p>4.&nbsp;&nbsp;甲方违约造成乙方提起诉讼的，乙方支付的全部诉讼受理费、仲裁费、公告费、保全费、执行费、律师费、评估费等费用均由甲方负责赔偿。</p>
        <p><span class="span1">八、争议处理</span></p>
        <p><span class="span1">甲、乙双方因履行本协议产生争议（含借款及担保事宜）无法协商解决的，均应提请清远仲裁委员会根据该会相关规则在东莞市仲裁，
            仲裁程序为简易程序书面审理，双方一致同意以下地址为仲裁送达地址：甲方的仲裁送达地址为：<input type="text" value="" size="35"
                    />，乙方的仲裁送达地址为：<input type="text" value="广东省东莞市东城区花园裕兴楼B座1701房" size="35"/>
            ，仲裁裁决是终局的，对各方当事人均有约束力。</span></p>
        <p>九、其他</p>
        <p>1.&nbsp;&nbsp;本合同自甲、乙双方共同签署后生效。</p>
        <p>2.&nbsp;&nbsp;本合同一式叁份，一份用于办理抵押登记手续，另两份由甲、乙双方各执一份。</p>
        <p class="p1">甲方：<input type="text" value="" size="25" />
            乙方:<input type="text" value="" size="25" />
        <p>
        <p class="p1">甲方配偶同意承担连带清偿责任签名：<input type="text" value="" size="20" /></p>
        <p class="p1">担保人姓名：<input type="text" value="" size="20" /></p>
        <p class="p3">签订日期：<input type="text" value="" size="20" id="contractAwardDate"
                                  readonly/></p>
        <p class="p3">签订地点：<input type="text" value="" size="20" /></p>
    </div>
</div>
</body>
</html>
