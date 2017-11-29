<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="basePath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>全国交通违章查询</title>
<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/index.css"/>
</head>

<body>
<h3 class="page-header text-center">全国交通违章查询</h3>
<div class="wz_list clearfix">
  <div class="col-sm-6">
    <dl class="dl-horizontal">
      <dt>【直辖市】</dt>
      <dd><a href="https://bj.122.gov.cn/views/inquiry.html" target="_blank">北京</a><a href="http://www.tjits.cn/pop_newsite_index.asp" target="_blank">天津</a><a href="http://sh.122.gov.cn/" target="_blank">上海</a><a href="http://www.cqjg.gov.cn/jggov/72057594037927936/index.html" target="_blank">重庆</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.hbgajg.com/" target="_blank">【河北】</a></dt>
      <dd><a href="http://www.sjzgaj.gov.cn/" target="_blank">石家庄</a><a href="http://0312.weizhangwang.com/" target="_blank">保定</a><a href="http://www.tscg.gov.cn/" target="_blank">唐山</a><a href="http://0335.weizhangwang.com/" target="_blank">秦皇岛</a><a href="http://www.hsjtaq.gov.cn/" target="_blank">衡水</a><a href="http://www.czpolice.gov.cn/" target="_blank">沧州</a><a href="http://www.hdjj.com.cn/" target="_blank">邯郸</a><a href="http://www.xtjdcjsr.com/#wzcx" target="_blank">邢台</a><a href="http://www.cdjj.gov.cn/" target="_blank">承德</a><a href="http://0313.weizhangwang.com/" target="_blank">张家口</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://jjzd.nmgat.gov.cn/" target="_blank">【内蒙古】</a></dt>
      <dd><a href="http://www.btjj.gov.cn/" target="_blank">包头</a><a href="http://www.bsgajj.gov.cn/" target="_blank">巴彦淖尔</a><a href="http://www.wlcbga.gov.cn/" target="_blank">乌兰察布</a><a href="http://0477.weizhangwang.com/" target="_blank">鄂尔多斯</a><a href="http://www.alsgajj.gov.cn/" target="_blank">阿拉善盟</a><a href="http://www.whjjzd.com/" target="_blank">乌海</a><a href="http://0475.weizhangwang.com/" target="_blank">通辽</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://jljj.cn/" target="_blank">【吉林】</a></dt>
      <dd><a href="http://www.ccga.gov.cn/ga/1/tindex.shtml" target="_blank">长春</a><a href="http://www.spjjzd.com/" target="_blank">四平</a><a href="http://www.ybjg.gov.cn/" target="_blank">延边</a><a href="http://www.weizhang8.cn/jiaotongkuaixun/yanji/" target="_blank">延吉</a><a href="http://www.thjj.com.cn/" target="_blank">通化</a><a href="http://baishan.shangyici.com/" target="_blank">白山</a><a href="http://www.bcjjzd.com/" target="_blank">白城</a><a href="http://www.syjjzd.com/" target="_blank">松原</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.zeaer.com/jiangsu/" target="_blank">【江苏】</a></dt>
      <dd><a href="http://www.njcgs.com/" target="_blank">南京</a><a href="http://www.szjjzd.gov.cn/" target="_blank">苏州</a><a href="http://www.zjcgs.gov.cn/" target="_blank">镇江</a><a href="http://czjxj.czinfo.net/dzjccx.asp" target="_blank">常州</a><a href="http://www.wxga.gov.cn/jiaoguan/index.php" target="_blank">无锡</a><a href="http://www.yangzhou.gov.cn/qtyy/service/jtwz.jsp" target="_blank">扬州</a><a href="http://ntg.122.gov.cn/" target="_blank">南通</a><a href="http://www.tzpolice.gov.cn/" target="_blank">泰州</a><a href="http://www.xzjgw.com/" target="_blank">徐州</a><a href="http://suq.122.gov.cn/" target="_blank">宿迁</a><a href="http://lyg.122.gov.cn/" target="_blank">连云港</a><a href="http://gaj.huaian.gov.cn/" target="_blank">淮安</a><a href="http://www.ycga.gov.cn/default.php?mod=c&s=sscfe6a82" target="_blank">盐城</a><a href="http://www.ksjtcx.com/clwfcx.aspx?id=341" target="_blank">昆山</a><a href="http://0520.weizhangwang.com/" target="_blank">常熟</a><a href="http://www.pcauto.com.cn/zt/weizhang/zhangjiagang.html" target="_blank">张家港</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.ah122.cn/" target="_blank">【安徽】</a></dt>
      <dd><a href="http://www.hfjjzd.gov.cn/" target="_blank">合肥</a><a href="http://www.lajjzd.gov.cn/frmVehVio.aspx" target="_blank">六安</a><a href="http://jjzd.mas.gov.cn/" target="_blank">马鞍山</a><a href="http://www.whtppr.gov.cn/" target="_blank">芜湖</a><a href="http://0562.weizhangwang.com/" target="_blank">铜陵</a><a href="http://www.aqjj.gov.cn/" target="_blank">安庆</a><a href="http://www.hbjjzd.cn/" target="_blank">淮北</a><a href="http://www.ahhnjj.net/" target="_blank">淮南</a><a href="http://www.ahbzjj.cn/default.aspx" target="_blank">亳州</a><a href="http://www.ahczjj.gov.cn/" target="_blank">滁州</a><a href="http://www.szxx.com.cn/CheLiang/" target="_blank">宿州</a><a href="http://web.huangshan.gov.cn/JA122/HSJJ/" target="_blank">黄山</a><a href="http://www.xcjjzd.gov.cn:802/Main.aspx?fzjg=P" target="_blank">宣城</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://fj.122.gov.cn/" target="_blank">【福建】</a></dt>
      <dd><a href="http://jxj.fuzhou.gov.cn/" target="_blank">福州</a><a href="http://www.xmjj.gov.cn/xxfw/shouye.action" target="_blank">厦门</a><a href="http://www.qz122.gov.cn/" target="_blank">泉州</a><a href="http://www.fjput110.gov.cn/" target="_blank">莆田</a><a href="http://zzjjzd.zhangzhou.gov.cn/" target="_blank">漳州</a><a href="http://www.npjjzd.net/" target="_blank">南平</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://ha.122.gov.cn/" target="_blank">【河南】</a></dt>
      <dd><a href="http://www.zzcgs.com.cn/ywbl-id-839.aspx" target="_blank">郑州</a><a href="http://www.lyjjzd.com/" target="_blank">洛阳</a><a href="http://www.kfpolice.com/web/default.aspx" target="_blank">开封</a><a href="http://0372.weizhangwang.com/" target="_blank">安阳</a><a href="http://0393.weizhangwang.com/" target="_blank">濮阳</a><a href="http://www.hebijj.gov.cn/cxyw.jsp?fid=1" target="_blank">鹤壁</a><a href="http://0373.weizhangwang.com/" target="_blank">新乡</a><a href="http://www.jzga.gov.cn/wzcx/lookup.aspx" target="_blank">焦作</a><a href="http://www.xcgaj.gov.cn/" target="_blank">许昌</a><a href="http://www.zmdjj.gov.cn/" target="_blank">驻马店</a><a href="http://sqrb.com.cn/sqjj/sqwzcx.htm" target="_blank">商丘</a><a href="http://0394.weizhangwang.com/" target="_blank">周口</a><a href="http://0377.weizhangwang.com/" target="_blank">南阳</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.pazx888.com/" target="_blank">【湖南】</a></dt>
      <dd><a href="http://www.csjjcgs.cn/cswscgs/" target="_blank">长沙 </a> <a href="http://www.hnzzjj.gov.cn/wscgs/Serchwf.aspx" target="_blank">株洲 </a> <a href="http://www.xtsems.com/" target="_blank">湘潭</a> <a href="http://www.cdjjzd.gov.cn/" target="_blank">常德 </a> <a href="http://www.jtjc.gov.cn/home.jsp" target="_blank">益阳</a> <a href="http://www.hnhyjj.gov.cn/" target="_blank">衡阳 </a> <a href="http://www.cz110.gov.cn/" target="_blank">郴州</a> <a href="http://www.sysgajj.gov.cn/" target="_blank">邵阳 </a> <a href="http://so.jtjc.cn/city/yongzhou/" target="_blank">永州</a> <a href="http://gajj.zjj.gov.cn/govmach/gajj/" target="_blank">张家界 </a> <a href="http://www.hhjjzd.gov.cn/" target="_blank">怀化</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.gxjtaq.com/" target="_blank">【广西】</a></dt>
      <dd><a href="http://www.nncgs.com/html/zbhp/" target="_blank">南宁 </a> <a href="http://www.gl122.com/" target="_blank">桂林 </a> <a href="http://www.lz122.gov.cn/" target="_blank">柳州</a> <a href="http://222.83.228.154:8080/" target="_blank">贵港 </a> <a href="http://www.yljtaqw.com/" target="_blank">玉林</a> <a href="http://www.wz110.cn/" target="_blank">梧州 </a> <a href="http://lb122.com/" target="_blank">来宾</a> <a href="http://www.gxqzjj.cn/" target="_blank">钦州 </a> <a href="http://0770.weizhangwang.com/" target="_blank">防城港</a> <a href="http://hainanjj.gov.cn/" target="_blank">海南省</a> <a href="http://www.hkjxj.gov.cn/php/wei_zcx.php" target="_blank">海口</a> <a href="http://www.sanyaga.gov.cn/" target="_blank">三亚</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://gz.122.gov.cn/m/login?" target="_blank">【贵州】</a></dt>
      <dd><a href="http://jjzd.gygov.gov.cn/" target="_blank">贵阳 </a> <a href="http://jjzd.zunyi.gov.cn/" target="_blank">遵义</a> <a href="http://0853.weizhangwang.com/" target="_blank">安顺 </a> <a href="http://0858.weizhangwang.com/" target="_blank">六盘水</a> <a href="http://www.trjj.gov.cn/" target="_blank">铜仁</a> <a href="http://www.weizhangjilu.com/cheliang/" target="_blank">黔南州</a> <a href="http://220.163.43.26:8080/ynviowww/surveil/index" target="_blank">云南省</a> <a href="http://www.km122.cn/" target="_blank">昆明</a> <a href="http://www.hhjj.gov.cn/" target="_blank">红河</a> <a href="http://www.pecgs.com/index.asp" target="_blank">普洱 </a> <a href="http://www.dhjjxx.com/" target="_blank">德宏</a> <a href="http://www.qjjj.gov.cn/" target="_blank">曲靖 </a> <a href="http://www.zt122.cn/index" target="_blank">昭通</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.gsgajt.gov.cn/" target="_blank">【甘肃】</a></dt>
      <dd><a href="http://www.lz.gansu.gov.cn/" target="_blank">兰州</a> <a href="http://0943.weizhangwang.com/" target="_blank">白银</a> <a href="http://www.weizhang8.cn/jiaotongkuaixun/jinchang/" target="_blank">金昌</a> <a href="http://0934.weizhangwang.com/" target="_blank">庆阳 </a> <a href="http://www.pljg.gov.cn/" target="_blank">平凉</a> <a href="http://www.jqsgaj.gov.cn/" target="_blank">酒泉 </a> <a href="http://www.jygsgaj.gov.cn/" target="_blank">嘉峪关</a> <a href="http://www.tsjjw.gov.cn/" target="_blank">天水 </a> <a href="http://0930.weizhangwang.com/" target="_blank">临夏</a> </dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="https://nx.122.gov.cn/m/login?" target="_blank">【宁夏】</a></dt>
      <dd><a href="https://nx.122.gov.cn/m/login?" target="_blank">银川 </a> <a href="https://nx.122.gov.cn/m/login?" target="_blank">吴忠</a> <a href="https://nx.122.gov.cn/m/login?" target="_blank">中卫 </a> <a href="https://nx.122.gov.cn/m/login?" target="_blank">固原</a> <a href="https://nx.122.gov.cn/m/login?" target="_blank">石嘴山</a> </dd>
    </dl>
  </div>
  <div class="col-sm-6">
    <dl class="dl-horizontal">
      <dt>【特别行政区】</dt>
      <dd><a href="http://xianggang.weizhangwang.com/" target="_blank">香港</a><a href="https://www.fsm.gov.mo/webticket/tq_c.aspx" target="_blank">澳门</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://59.49.18.116:8008/sxwwpt_wai/" target="_blank">【山西】</a></dt>
      <dd><a href="http://www.tyjj.gov.cn/" target="_blank">太原</a><a href="http://www.dtjj.com.cn/" target="_blank">大同</a><a href="http://www.yqgabmfw.gov.cn/site/default.aspx" target="_blank">阳泉</a><a href="http://www.sxjzjj.com/" target="_blank">晋中</a><a href="http://www.sxxzjj.gov.cn/" target="_blank">忻州</a><a href="http://www.szgabmfw.gov.cn/site/default.aspx" target="_blank">朔州</a><a href="http://www.jc122.com/" target="_blank">晋城</a><a href="http://cz.sxgajj.gov.cn/" target="_blank">长治</a><a href="http://lf.sxgajj.gov.cn/" target="_blank">临汾</a><a href="http://yc.sxgajj.gov.cn/" target="_blank">运城</a><a href="http://ll.sxgajj.gov.cn/" target="_blank">吕梁</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.lnjj.gov.cn/" target="_blank">【辽宁】</a></dt>
      <dd><a href="http://www.sygajj.gov.cn/" target="_blank">沈阳</a><a href="http://www.lnjj.gov.cn/" target="_blank">抚顺</a><a href="http://0410.weizhangwang.com/" target="_blank">铁岭</a><a href="http://0412.weizhangwang.com/" target="_blank">鞍山</a><a href="http://0419.weizhangwang.com/" target="_blank">辽阳</a><a href="http://www.bxgaggfwpt.gov.cn/" target="_blank">本溪</a><a href="http://www.dlutc.gov.cn/" target="_blank">大连</a><a href="http://www.ykjj.gov.cn/" target="_blank">营口</a><a href="http://www.dd122.com/pages/xxcx.asp" target="_blank">丹东</a><a href="http://www.jzgajx.com/homepart/default2.aspx" target="_blank">锦州</a><a href="http://0429.weizhangwang.com/" target="_blank">葫芦岛</a><a href="http://www.zgcy.gov.cn/jtwzcx/JTWZ.aspx" target="_blank">朝阳</a><a href="http://0427.weizhangwang.com/" target="_blank">盘锦</a><a href="http://218.24.200.244/" target="_blank">阜新</a><a href="http://15tianqi.cn/weizhang/haicheng/" target="_blank">海城</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://jljj.cn/" target="_blank">【黑龙江】</a></dt>
      <dd><a href="http://auto.dbw.cn/hrbjj/" target="_blank">哈尔滨</a><a href="http://gaj.daqing.gov.cn/ecdomain/framework/dqgaj/opjpkadoiecpbboajkdhjjbakdgbpfib.jsp" target="_blank">大庆</a><a href="http://0452.weizhangwang.com/" target="_blank">齐齐哈尔</a><a href="http://0468.weizhangwang.com/" target="_blank">鹤岗</a><a href="http://0453.weizhangwang.com/" target="_blank">牡丹江</a><a href="http://www.qthjj.gov.cn/" target="_blank">七台河</a><a href="http://0458.weizhangwang.com/" target="_blank">绥化</a><a href="http://www.hljjj.gov.cn:8081/Home/Wfcx" target="_blank">佳木斯</a><a href="http://www.sysjj.cn/" target="_blank">双鸭山</a><a href="http://0457.weizhangwang.com/" target="_blank">大兴安岭</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.zjsgat.gov.cn:8080/was/portals/car_lllegal_query.jsp" target="_blank">【浙江】</a></dt>
      <dd><a href="http://www.hzti.com/service/qry/peccancy.aspx?type=2&node=248" target="_blank">杭州</a><a href="http://wscgs.sxga.gov.cn/" target="_blank">绍兴</a><a href="http://wf.nbjj.gov.cn/" target="_blank">宁波</a><a href="http://www.police.zhoushan.gov.cn/interaction_wfsearch.aspx" target="_blank">舟山</a><a href="http://www.jhga.gov.cn/" target="_blank">金华</a><a href="http://0570.weizhangwang.com/" target="_blank">衢州</a><a href="http://www.wzsjj.cn/" target="_blank">温州</a><a href="http://0576.weizhangwang.com/" target="_blank">台州</a><a href="http://lsga.lishui.gov.cn/clwzcx.html" target="_blank">丽水</a><a href="http://www.hzgaj.gov.cn/" target="_blank">湖州</a><a href="http://jjzd.jxgaj.gov.cn/" target="_blank">嘉兴</a><a href="http://www.ywga.gov.cn/" target="_blank">义乌</a><a href="http://www.weizhang8.cn/zhejiang/xiaoshan.htm" target="_blank">萧山</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.jxhld.gov.cn/" target="_blank">【江西】</a></dt>
      <dd><a href="http://ncjj.nc.gov.cn/" target="_blank">南昌</a><a href="http://www.jjjj.com.cn/page/index.php" target="_blank">九江</a><a href="http://www.gzjjdd.com/xb/" target="_blank">赣州</a><a href="http://www.jagajj.gov.cn/" target="_blank">吉安</a><a href="http://www.jxycjj.gov.cn/" target="_blank">宜春</a><a href="http://www.xyga.gov.cn/web/index.php" target="_blank">新余</a><a href="http://www.jxfzgaj.gov.cn/" target="_blank">抚州</a><a href="http://www.ytnews.cn/zhuanti/ytjj/" target="_blank">鹰潭</a><a href="http://www.srjxj.com/home.asp" target="_blank">上饶</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.sdwscgs.com:9080/zdwz/" target="_blank">【山东】</a></dt>
      <dd><a href="http://www.jnjj.com/" target="_blank">济南</a><a href="http://www.qdznjt.com/vehicleViolation" target="_blank">青岛</a><a href="http://www.ytjj.gov.cn/html/" target="_blank">烟台</a><a href="http://221.2.145.164:9080/wscgsxxcx/jdcwfcx.do" target="_blank">威海</a><a href="http://www.zbjj.gov.cn/" target="_blank">淄博</a><a href="http://www.wfjj.com/" target="_blank">潍坊</a><a href="http://www.rz110.gov.cn/" target="_blank">日照</a><a href="http://www.lyjj.net/index.html" target="_blank">临沂</a><a href="http://www.taga.gov.cn/" target="_blank">泰安</a><a href="http://222.134.200.57:9080/wscgs/home.jsp" target="_blank">莱芜</a><a href="http://www.sdzzjj.com/" target="_blank">枣庄</a><a href="http://0537.weizhangwang.com/" target="_blank">济宁</a><a href="http://0546.weizhangwang.com/" target="_blank">东营</a><a href="http://www.gpsoo.net/tool/tool_wzcx.html" target="_blank">滨州</a><a href="http://www.lcwscgs.com/wscgs/home.jsp" target="_blank">聊城</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.hbsjg.gov.cn/hubeijiaoguan/" target="_blank">【湖北】</a></dt>
      <dd><a href="http://www.whjg.gov.cn/" target="_blank">武汉</a> <a href="http://hg.hbgat.gov.cn/" target="_blank">黄冈 </a> <a href="http://hsjj.hsdcw.com/?p=se" target="_blank">黄石 </a> <a href="http://0711.weizhangwang.com/" target="_blank">鄂州</a> <a href="http://www.jzjtgl.com/index.jsp" target="_blank">荆州 </a> <a href="http://0727.weizhangwang.com/" target="_blank">荆门</a> <a href="http://www.hbxgjj.com/" target="_blank">孝感 </a> <a href="http://0722.weizhangwang.com/" target="_blank">随州</a> <a href="http://www.xfwfcx.com/" target="_blank">襄阳 </a> <a href="http://www.syjg.gov.cn/" target="_blank">十堰</a> <a href="http://ycjj.yichang.gov.cn/traffic/index" target="_blank">宜昌</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.gdga.gov.cn/" target="_blank">【广东】</a></dt>
      <dd><a href="http://www.gzjd.gov.cn/cgs/html/hall/index.html" target="_blank">广州 </a> <a href="http://www.fsgajj.cn/fsjj/wsfwdt/wzxx/sel_transgress.aspx" target="_blank">佛山 </a> <a href="http://www.gdzq110.gov.cn/" target="_blank">肇庆</a> <a href="http://www.stc.gov.cn/" target="_blank">深圳 </a> <a href="http://www.dgjj.gov.cn/" target="_blank">东莞 </a> <a href="http://www.hzapi.com/" target="_blank">惠州</a> <a href="http://www.zhcgs.gov.cn/query/wf" target="_blank">珠海 </a> <a href="http://www.gdzs110.gov.cn/main/index.htm" target="_blank">中山 </a> <a href="http://www.jmjgj.gov.cn/" target="_blank">江门</a> <a href="http://www.yjga.gov.cn/" target="_blank">阳江 </a> <a href="http://www.gdzj110.gov.cn/outside/wsfw/kjtd/" target="_blank">湛江 </a> <a href="http://0668.weizhangwang.com/" target="_blank">茂名 </a> <a href="http://www.yfga.gov.cn/yfga/index.jsp?topid=009001059" target="_blank">云浮</a> <a href="http://gdst110.gov.cn/" target="_blank">汕头 </a> <a href="http://www.cztp.gov.cn/" target="_blank">潮州 </a> <a href="http://www.zeaer.com/guangdong/jieyang/" target="_blank">揭阳</a> <a href="http://www.gdhy110.gov.cn/cms/index.htm" target="_blank">河源 </a> <a href="http://www.mzga.gov.cn/home/" target="_blank">梅州</a> <a href="http://www.qyga.gov.cn/" target="_blank">清远 </a> <a href="http://www.zeaer.com/guangdong/shaoguan/" target="_blank">韶关 </a> <a href="http://www.gdsw110.cn/" target="_blank">汕尾</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.zeaer.com/sichuan/" target="_blank">【四川】</a></dt>
      <dd><a href="http://www.cdjg.gov.cn/index.aspx" target="_blank">成都</a> <a href="http://www.dyjj.gov.cn/" target="_blank">德阳</a> <a href="http://www.myjtaq.com/newsmore.asp?ClassID=29" target="_blank">绵阳</a> <a href="http://www.sclzjj.gov.cn/" target="_blank">泸州 </a> <a href="http://www.scybjj.gov.cn/" target="_blank">宜宾</a> <a href="http://www.lssjj.cn/lsjjw/index.html" target="_blank">乐山 </a> <a href="http://www.lsjj.gov.cn/html/cgs/" target="_blank">凉山</a> <a href="http://www.zg122.gov.cn/index/" target="_blank">自贡 </a> <a href="http://www.zeaer.com/sichuan/neijiang/" target="_blank">内江</a> <a href="http://www.gajjedd.gov.cn/" target="_blank">广安 </a> <a href="http://www.scdzjj.gov.cn/" target="_blank">达州</a> <a href="http://ncsjj.gov.cn/" target="_blank">南充 </a> <a href="http://www.bz122.gov.cn/" target="_blank">巴中</a> <a href="http://www.scgyjj.gov.cn/" target="_blank">广元 </a> <a href="http://0812.weizhangwang.com/" target="_blank">攀枝花</a></dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://sn.122.gov.cn/" target="_blank">【陕西】</a></dt>
      <dd><a href="http://www.xianjj.com/" target="_blank">西安</a> <a href="http://www.xyjjzd.gov.cn/" target="_blank">咸阳 </a> <a href="http://0917.weizhangwang.com/" target="_blank">宝鸡 </a> <a href="http://0913.weizhangwang.com/" target="_blank">渭南</a> <a href="http://www.tc122.com/html/2013/chaxun_0805/937.html" target="_blank">铜川 </a> <a href="http://www.yajjzd.com/" target="_blank">延安 </a> <a href="http://www.yulinga.gov.cn/" target="_blank">榆林</a> <a href="http://www.akjjzd.gov.cn/" target="_blank">安康 </a> <a href="http://www.hzcgs.cn/" target="_blank">汉中</a> </dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://xinjiang.weizhangwang.com/" target="_blank">【新疆】</a></dt>
      <dd><a href="http://www.wlmqjj.gov.cn/10000/" target="_blank">乌鲁木齐</a> <a href="http://www.xjylcar.com/" target="_blank">伊犁</a> <a href="http://0990.weizhangwang.com/" target="_blank">克拉玛依</a> <a href="http://0996.weizhangwang.com/" target="_blank">巴音郭楞</a> </dd>
    </dl>
    <dl class="dl-horizontal">
      <dt><a href="http://www.qhbang.com/weizhang/" target="_blank">【青海】</a></dt>
      <dd><a href="http://wx.kunlunpai.cn/policemodule/index.do?method=vehicle" target="_blank">西宁</a> <a href="http://hainanjj.gov.cn/" target="_blank">海南</a> </dd>
    </dl>
  </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</html>
