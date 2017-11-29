<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style  type="text/css">
        body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #allmap{height:500px;width:100%;}
        #r-result{width:100%; font-size:14px;}
    </style>
 <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Vas0wvrF0seeC3BGVVulYunlatHm6xFe"></script>
    <title>城市名定位</title>
</head>
<body>
<div id="allmap" style="width:800px;height:600px"></div>
</body>
<script src="${basePath}/js/jquery.js"></script>

<script  type="text/javascript">
    $(function(){
       debugger;
        theLocation();
    });
// 百度地图API功能
var map = new BMap.Map("allmap");
map.centerAndZoom(new BMap.Point(116.331398,39.897445),11);
map.enableScrollWheelZoom(true);
// 用经纬度设置地图中心点
function theLocation(){
    debugger;
   var  longitude =getQueryString("longitude");
    var  latitude =getQueryString("latitude");
if(longitude!= "" && latitude != ""){
map.clearOverlays();
var new_point = new BMap.Point(longitude,latitude);
var marker = new BMap.Marker(new_point);  // 创建标注
map.addOverlay(marker);              // 将标注添加到地图中
map.panTo(new_point);
}

}
    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = location.search.substr(1).match(reg);
        if (r != null) return unescape(decodeURI(r[2])); return "";
    }
</script>
</html>
