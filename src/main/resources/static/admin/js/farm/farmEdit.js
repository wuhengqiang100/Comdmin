Array.prototype.contains = function ( needle ) {
    for (i in this) {
        if (this[i] == needle) return true;
    }
    return false;
};

layui.use(['form','jquery','layer'],function(){
    var form = layui.form,
        $ = layui.jquery,
        layer = layui.layer;


    $(".dontEdit").click(function(){
        parent.location.reload();
    });
    form.on("submit(editFarm)",function(data){
        if(data.field.id == null){
            layer.msg("农田ID不存在");
            return false;
        }

        var loadIndex = layer.load(2, {
            shade: [0.3, '#333']
        });
        $.ajax({
            type:"POST",
            url:"/admin/farm/user/edit",
            dataType:"json",
            contentType:"application/json",
            data:JSON.stringify(data.field),
            success:function(res){
                layer.close(loadIndex);
                if(res.success){
                    parent.layer.msg("农田编辑成功！",{time:1000},function(){
                        //刷新父页面
                        parent.location.reload();
                    });
                }else{
                    layer.confirm(res.message, {
                        skin: 'layui-layer-molv'
                        ,closeBtn: 1,
                        icon: 3, title: '提示',
                        btn: ['确定'] //按钮
                    }, function(){
                        layer.closeAll('dialog'); //关闭信息框
                        location.reload();
                    },function(){

                    });
                }
            }
        });
        return false;
    });

});