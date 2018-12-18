layui.use(['form', 'layer'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer;
    $ = layui.jquery;

    //登录按钮事件
    form.on("submit(login)", function (data) {
        var loadIndex = layer.load(2, {shade: [0.3, '#333']});
        if ($('form').find('input[type="checkbox"]')[0].checked) {
            data.field.rememberMe = true;
        } else {
            data.field.rememberMe = false;
        }

/*        $.ajax({
            type:"POST",
            url:data.form.action,
            dataType:"json",
            contentType:"application/json",
            data:JSON.stringify(data.field),
            success:function(res){
                layer.close(loadIndex);
                if(res.success){
                    location.href = "/" + res.url;
                }else{
                    layer.msg(res.message);
                    $("#randImage").click();
                }
            }
        });*/

        $.post(data.form.action, data.field, function (res) {
            layer.close(loadIndex);
            if (res.success) {
                location.href = "/" + res.url;
            } else {
                layer.alert(res.message, {
                    closeBtn: 1    // 是否显示关闭按钮
                    ,anim:6
                    ,btn: ['确定并重新输入'] //按钮
                    ,yes:function(index){
                        // obj.del();
                        // layer.close(index);
                        $("#randImage").click();
                        location.reload()
                    }
                });
              /*  layer.msg(res.message);
                location.reload()
                // $("#randImage").click();*/
            }
        },'json');
        return false;
    });

    $("#regist").click(function () {
        location.href = "/toRegist";
      /*  $.post("/forwordRegist", {}, function (res) {
            // layer.close(loadIndex);
            layer.msg(res);
            if (res.success) {
                layer.msg(res);
                layer.msg(res.message);
            } else {
                layer.msg("请求失败!");
                layer.msg(res.message);
            }
        }, 'json');*/
    });

    $(document).ready(function () {
        getRequestAll();
    });
    $(document).on('keydown', function () {
        if (event.keyCode == 13) {
            $(".login_btn").click();
        }
    });

    var getRequestAll = function () {
        var loadIndex = layer.load(2, {shade: [0.3, '#333']});
        $.post("/admin/requestAll", {}, function (res) {
            layer.close(loadIndex);
          /*  $("#insertForm").append("<div class=\"layui-form-item\"><input class=\"layui-input\" name=\"identity\" placeholder=\"访问身份\" lay-verify=\"required\" type=\"text\" autocomplete=\"off\"></div>");
            $("#init").append("<option value=''>立刻有</option>");*/
            // layer.close(loadIndex);
           /* layer.msg(res.nameList);
            layer.msg(res.idList);
            layer.msg(res.message);
            layer.msg(idList);
            layer.msg(nameList);*/
            if(res.success()){
                $("#insertForm").append("<div class=\"layui-form-item\"><input class=\"layui-input\" name=\"identity\" placeholder=\"访问身份\" lay-verify=\"required\" type=\"text\" autocomplete=\"off\"></div>");

                $(".init").after("<option value='idList.get(i)'>nameList.get(i)</option>");
               /* for(var i=0;i<nameList.size();i++){
                    $(".init").after
                    $(".init").after("<option value='idList.get(i)'>nameList.get(i)</option>");
                }*/
            }
           /* if (res.success) {
                /!* var list=res.roleList;
                 for(var i=0;i<list.length;i++) {
                     var name = list[i].name;
                     var id = list[i].id;
                     layer.msg(id);
                     layer.msg(name);
                     $('option').append(" <b>Hello world!</b>");
                     // $("#first").append("<option value='2'>湿度</option>");
                     // $("#first").appendTo("<option value=id>name</option>");
                 }
                 layer.msg("请求成功!");
                 // layer.msg(res);*!/

                /!* $("#first").after(" <div class=\"layui-form-item\">\n" +
                     "            <input class=\"layui-input\" name=\"username\" placeholder=\"用户名\" lay-verify=\"required\" type=\"text\" autocomplete=\"off\">\n" +
                     "        </div>")*!/
                /!*$("#first").append("");
                $("#first").appendTo("<option value='2'>温度2</option>");*!/
            } else {
                layer.msg("请求失败!");
                layer.msg(res.message);
            }*/
        }, 'json');
    };

    form.on('select(selected)', function (data) {
       var valiTrue=true;
        if(1==data.value){
            valiTrue=false;
            layer.msg("请选择您的请求!");
        }
        // var loadSelect = layer.load(2, {shade: [0.3, '#333']});
        if(valiTrue){
            $.post("/admin/request", {id: data.value}, function (res) {
                // layer.close(loadIndex);
                $("#insertForm").empty();
                // layer.close(loadSelect);
                if (res.success) {
                    //身份输入框
                    if (res.role.identity != null && res.role.identity!="") {
                        // $("#insertForm01").after("<div class=\"layui-form-item\"><input class=\"layui-input\" name=\"identity\" placeholder=\"访问身份\" lay-verify=\"required\" type=\"text\" autocomplete=\"off\"></div>");
                        $("#insertForm").append("<div class=\"layui-form-item\"><input class=\"layui-input\" name=\"identity\" placeholder=\"访问身份\" lay-verify=\"required\" type=\"text\" autocomplete=\"off\"></div>");
                    }
                    //发起请求地址输入框
                    if (res.role.requestPlace != null && res.role.requestPlace!="") {
                        $("#insertForm").append("<div class=\"layui-form-item\"><input class=\"layui-input\" name=\"requestPlace\" placeholder=\"发起请求地址\" lay-verify=\"required\" type=\"text\" autocomplete=\"off\"></div>");
                    }
                    //年纪输入框
                    if (res.role.age != null &&res.role.age!="") {
                        $("#insertForm").append("<div class=\"layui-form-item\"><input class=\"layui-input\" name=\"age\" placeholder=\"年纪\" lay-verify=\"required\" type=\"text\" autocomplete=\"off\"></div>");
                    }
                    //电话输入框
                    if (null!=res.role.tel && ''!=res.role.tel) {
                        $("#insertForm").append("<div class=\"layui-form-item\"><input class=\"layui-input\" name=\"tel\" placeholder=\"电话号码\" lay-verify=\"required\" type=\"text\" autocomplete=\"off\"></div>");
                    }
                    //电话输入框
                    if (res.role.email != null && res.role.email!="") {
                        $("#insertForm").append("<div class=\"layui-form-item\"><input class=\"layui-input\" name=\"email\" placeholder=\"邮件地址\" lay-verify=\"required\" type=\"text\" autocomplete=\"off\"></div>");
                    }
                    //layer.close(loadIndex);

                } else {
                    layer.msg(res.message);
                }
            });
        }

    });

    $("#randImage").click(function () {
        this.src = "/getCaptcha?t=" + Math.random();
    });
});
