<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>发表新文章</title>
    <%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script type="text/javascript" src="static/scripts/jquery-1.7.2.js"></script>
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>发布新数据集</legend>
</fieldset>

<form class="layui-form" action="" lay-filter="dataset_create">
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <select name="category">
                <option value="-1" selected=""></option>
                <option value="表格">表格</option>
                <option value="图片">图片</option>
                <option value="视频">视频</option>
                <option value="文本">文本</option>
                <option value="音频">音频</option>
            </select>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">标签</label>
        <div class="layui-input-block" >
            <input type="checkbox" name="tag[mbjc]" title="目标检测">
            <input type="checkbox" name="tag[yyfg]" title="语义分割">
            <input type="checkbox" name="tag[txfl]" title="图像分类">
            <input type="checkbox" name="tag[fgqy]" title="风格迁移">
            <input type="checkbox" name="tag[znwd]" title="智能问答">
            <input type="checkbox" name="tag[sztp]" title="知识图谱">
            <input type="checkbox" name="tag[wbfy]" title="文本翻译">
        </div>
    </div>


    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">简介</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入简介" class="layui-textarea" name="intro"></textarea>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">链接</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入链接" class="layui-textarea" name="link"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="create_submit">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script src="layui/layui.js"></script>
<script>
    layui.use(['form','layer'], function(){
        var form = layui.form
        ,layer = layui.layer

        //监听提交
        form.on('submit(create_submit)', function(data){
            $.ajax({
                url: "datasetServlet?action=add&user_id=" +  "${sessionScope.user.user_id}",
                type: 'post',
                data: data.field,
                dataType:"text",
                success: function (result) {
                    console.log("result: " + result)
                    if (result == 'success') {
                        layer.msg('提交成功', {icon: 1});
                    } else {
                        layer.msg('提交失败', {icon: 2});
                    }
                }
            });
            return false;//阻止表单跳转){

        });
    });
</script>
</body>
</html>