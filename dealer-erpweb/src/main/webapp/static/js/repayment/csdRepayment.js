
var Csd_repayment=(function () {
    var _repayment_list={};

    _repayment_list.selectRepaymentList = function (data) {
        debugger;
        $.ajax({
            url:"/admin/order/queryRepayList",
            type:"post",
            contentType:"application/json",
            dataType:"json",
            data:JSON.stringify(data),
            success:function(data) {
                var html = "";
                if(data.success){
                    for(var i = 0; i < data.data.length(); i++){
                        html += "<td>" + data.data[i].orderId + "</td>";
                        html += "<td>" + data.data[i].carName + "</td>";
                        html += "<td>" + data.data[i].orderId + "</td>";
                        html += "<td>" + data.data[i].orderId + "</td>";
                        html += "<td>" + data.data[i].orderId + "</td>";
                        html += "<td>" + data.data[i].orderId + "</td>";
                    }
                }
            },
            error: errFunction
        });
    }
        return _repayment_list;
})(jQuery,Csd_repayment);

    function errFunction(XMLHttpRequest, textStatus, errorThrown) {
        console.error("xmlHttpRequestStatus : "+XMLHttpRequest.status);
        console.error("xmlHttpRequest : "+XMLHttpRequest.readyState);
        console.error("textStatus : "+textStatus);
        layer.msg("未知错误");
    };