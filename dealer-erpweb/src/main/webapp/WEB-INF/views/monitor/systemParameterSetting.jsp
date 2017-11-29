<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>工作平台</title>
    <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}/css/common.css" />
    <script src="${basePath}/js/jquery.js"></script>
    <script>
        $(function() {
            $.ajax({
                async:false,
                type : 'POST',
                contentType : "application/json",
                url : "${basePath}/admin/setting/systemParameterSetting",//请求的action路径
              /*  error : function() {//请求失败处理函数
                    alertMessage("请求失败！",null);
                },*/
                success : function(data) {//请求成功后处理函数。
                    debugger;
                    var list="";
                    if (data!= null&&data.length>0){
                        for(var i = 0; i <data.length;i++){
                            list+=  "<div class='form-inline set-form'>"+
                                      "<div class='form-group'>"+
                                      "<label>"+data[i].dayRange+"天利率 ="+"</label>"+
                                      "<input type='text' class='form-control ' disabled='disabled' id='sysValue_1' name='sysValue' value="+data[i].rate+" style='width: 200px;' />" +
                                       "<label style='text-align: center; width: 100px;'>"+ "×" +"基准利率"+"</label>"+
                                      "<a href='javascript:void(0)' class='btn btn-danger w100 edit-btn' onclick='updateInfo("+data[i].id+","+data[i].dayRange+","+data[i].rate+")'>"+"修改"+"</a>"+"<a href='javascript:edit(2)' class='btn btn-danger btn-search w100 del-btn' id="+data[i].id+">"+"删除"+"</a>"+
                                      "</div>"+
                                      "</div>"
                        }
                        $("#record").html(list);
                    }
                }
            });
            debugger;
        $("#add-btn").click(function() {

            var index = layer.open({
                type: 2,
                title: '<h4>新增金融方案</h4>',
                content: '/admin/monitor/set_modal.jsp?urlType=add',
                area: ['770px', '300px']
            });
        })

        
            $(".del-btn").click(function(){
            var id=$(this).attr("id");
                layer.confirm('您确定要删除么？', {
                    btn: ['确认','取消'] //按钮
                }, function(){
                		
                	$.ajax({
           				url:"/admin/setting/delete/"+id,
                		type:"post",
                		dataType:"text",
                		success:function(data){
                			if(data==0000){
                				 layer.msg('删除成功！', {icon: 1});
                				 window.location.reload(); //刷新父页面
                			}
                			else{
                				layer.msg('删除失败！', {icon: 1});
                			}
                			
                		}
                	})
                });

            })



        });
                   function updateInfo(id,dayRange,rate){
                var index = layer.open({
                    type: 2,
                    title: '<h4>编辑金融方案</h4>',
                    content: '/admin/monitor/set_modal.jsp?urlType=update&id='+id+"&dayRange="+dayRange+"&rate="+rate,
                    area: ['770px', '300px']
                });
            }
    </script>

</head>

<body>
    <div class="from_box" >
        <div class="from_tit clearfix">
            <div class="pull-left" style="padding-top: 5px;">
                <h3>金融方案及利率逻辑设置</h3></div>
            <a class="btn btn-danger btn-sm" style="margin-left: 15px;" id="add-btn"> 新增金融方案</a>
        </div>
        <div id="record">

        </div>
    </div>
    <!--天数-->
    <input type="hidden" value=""  id="dayRange" />
    <!--利率  -->
    <input type="hidden" value=""  id="rate"/>
</div>
    <script src="${basePath}/js/jquery.min.js" ></script>
    <script src="${basePath}/js/layer/layer.js"></script>
    <script>


    </script>
</body>
</html>