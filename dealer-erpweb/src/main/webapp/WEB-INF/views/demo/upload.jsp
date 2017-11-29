<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="basePath" value="<%= request.getContextPath() %>" />
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>jQuery File Upload Example</title>
    <link href="${basePath}/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="${basePath}/css/dropZone.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="${basePath}/js/layer/skin/layer.css" />
    <link rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css" />
    <link rel="stylesheet" href="${basePath}/css/jquery.fileupload.css" />

    <script src="${basePath}/js/jquery/jquery-1.9.1.min.js"></script>
    <script src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
    <script src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
    <script src="${basePath}/js/jquery/jquery.fileupload.js"></script>

    <!-- bootstrap just to have good looking page -->
    <script src="${basePath}/js/bootstrap.min.js"></script>

    <!-- 引入layer js -->
    <script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
    <script>
        $(function () {
            $('#fileupload').fileupload({
                dataType: 'json',

                done: function (e, data) {
                    layer.msg("上传成功！");
                    $("tr:has(td)").remove();
                    $.each(data.result, function (index, file) {
                        $("#uploaded-files").append(
                                $('<tr/>')
                                        .append($('<td/>').text(file.fileName))
                                        .append($('<td/>').text(file.fileSize))
                                        .append($('<td/>').text(file.fileType))
                                        .append($('<td/>').html("<a href='" + ${basePath} +"/admin/file/get/" + index + "'>Click</a>"))
                        );
                    });
                },

                progressall: function (e, data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    $('#progress .bar').css(
                            'width',
                            progress + '%'
                    );
                },

                dropZone: $('#dropZone')
            });
        });
    </script>
</head>

<body>
<h1>jQuery File Upload</h1>

<div style="width:500px;padding:20px">
        <label>身份证</label><input id="fileupload" type="file" class="btn btn-01" name="files[]"
               data-url="${basePath}/admin/file/upload.html"
               multiple>

    <div id="dropZone">Drop files here</div>
    <div id="progress">
        <div style="width: 100%;"></div>
    </div>

    <table id="uploaded-files">
        <tr>
            <th>File Name</th>
            <th>File Size</th>
            <th>File Type</th>
            <th>Download</th>
        </tr>
    </table>
</div>
</body>
</html>