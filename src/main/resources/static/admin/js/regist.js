layui.use(['form', 'layer'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer;
    $ = layui.jquery;

    //注册按钮事件
    form.on("submit(regist)", function (data) {
        var loadIndex = layer.load(2, {shade: [0.3, '#333']});
   /*     if ($('form').find('input[type="checkbox"]')[0].checked) {
            data.field.rememberMe = true;
        } else {
            data.field.rememberMe = false;
        }*/
        $.post(data.form.action, data.field, function (res) {
            layer.close(loadIndex);
            if (res.success) {
               /* layer.alert('用户属性信息注册完成,请联系管理员审核通过!', {
                    closeBtn: 1    // 是否显示关闭按钮
                    ,anim:6
                    ,btn: ['进入登录'] //按钮
                    ,yes:function(index){
                        location.href = "/"+res.url;

                    }
                });*/
                layer.alert('用户属性信息注册完成,请联系管理员审核通过!', {
                    skin: 'layui-layer-molv' //样式类名
                    ,closeBtn: 0
                }, function(){
                    location.href = "/"+res.url;
                  /*  layer.alert('偶吧深蓝style', {
                        skin: 'layui-layer-lan'
                        ,closeBtn: 0
                        ,anim: 4 //动画类型
                    });*/
                });
                //

            } else {
                layer.alert(res.message, {
                    skin: 'layui-layer-molv'
                    ,closeBtn: 1,
                    icon: 3, title: '提示'
                }, function(){
                    layer.close(layer.index);
                    $("#randImage").click();
                });

            }
        });
        return false;
    });

    $(document).on('keydown', function () {
        if (event.keyCode == 13) {
            $(".login_btn").click();
        }
    });

    $(".returnLogin").click(function(){
        location.href = "/toLogin";
    });

    var getRequestAll = function () {
        $.post("/admin/requestAll", {}, function (res) {
            layer.msg(res);
            layer.msg(res.message);
            if (res.success) {
            } else {
                layer.msg("请求失败!");
                layer.msg(res.message);
            }
        }, 'json');
    };
    $("#randImage").click(function () {
        this.src = "/getCaptcha?t=" + Math.random();
    });
});
