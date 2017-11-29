<c:set var="basePath" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
<link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
<title>工作平台</title>

</head>

<body>
<div class="tools_bar col-lg-12">
  <div class="tj_box clearfix">
    <div class="col-sm-12 row">
      <div class="col-sm-2" >
        <ul>
          <li class="active"><a  id="link_dw">定位监控</a></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <ul>
          <li><a  id="link_tj">统计报表</a></li>
        </ul>
      </div>
      <div class="col-sm-2"
        <ul>
          <li><a id="link_sb">黑名单搜索</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>

<div class="list_box col-sm-12">
<iframe scrolling="auto" height="700" frameborder="0" width="100%" id="l_iframe" name="l_iframe" src="http://pageapi.gpsoo.net/third?method=jump&amp;page=monitor&amp;locale=zh-cn&amp;account=%E5%B9%B8%E7%A6%8F%E8%BD%A6%E9%98%9F&amp;target=%E5%B9%B8%E7%A6%8F%E8%BD%A6%E9%98%9F&amp;appkey=edd65491e9d50a61ca7d6684cee87a2b" marginwidth="0" marginheight="0"></iframe>
</div>
</body>
<script src="${basePath}/js/jquery.js" ></script>
<script>
$(function(){
    $("#link_dw").click(function(){
        $("#link_dw").parents($(".col-sm-12")).find('li').removeClass('active');
        window.location.reload();
        $("#link_dw").parent("li").addClass("active");
    });
  $("#link_tj").click(function(){
      $("#link_tj").parents($(".col-sm-12")).find('li').removeClass('active');
        $("#l_iframe").attr("src","http://pageapi.gpsoo.net/third?method=jump&page=report&locale=zh-cn&account=%E5%B9%B8%E7%A6%8F%E8%BD%A6%E9%98%9F&target=%E5%B9%B8%E7%A6%8F%E8%BD%A6%E9%98%9F&appkey=edd65491e9d50a61ca7d6684cee87a2b");
      $("#link_tj").parent("li").addClass("active");
  });
   $("#link_sb").click(function(){
       $("#link_sb").parents($(".col-sm-12")).find('li').removeClass('active');
        $("#l_iframe").attr("src","http://pageapi.gpsoo.net/third?method=jump&page=blacklist&locale=zh-cn&account=%E5%B9%B8%E7%A6%8F%E8%BD%A6%E9%98%9F&target=%E5%B9%B8%E7%A6%8F%E8%BD%A6%E9%98%9F&appkey=edd65491e9d50a61ca7d6684cee87a2b");
       $("#link_sb").parent("li").addClass("active");
   });
});

</script>
</html>
