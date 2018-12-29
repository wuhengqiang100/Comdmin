layui.use(['layer', 'form', 'laytpl', 'table'], function () {
    var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form,
        laytpl = layui.laytpl,
        table = layui.table,
        t;              //表格变量
    //监听工具条
    table.on('tool(messageList)', function (obj) {
        var data = obj.data;
        if (obj.event === 'edit') {
            var editIndex = layer.open({
                title: "编辑消息",
                type: 2,
                content: "/admin/user/message/edit?id=" + data.id,
                success: function (layero, index) {
                    setTimeout(function () {
                        layer.tips('点击此处返回消息列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500);
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function () {
                layer.full(editIndex);
            });
            layer.full(editIndex);
        }
        if (obj.event === "read") {
            layer.confirm("你确定已经查看该消息么？", {
                    skin: 'layui-layer-molv'
                    , closeBtn: 1,
                    icon: 3, title: '提示', btn: ['是的,我确定', '我再想想']
                },
                function () {
                    $.get("/admin/user/message/read", {"id": data.id}, function (res) {
                        if (res.success) {
                            layer.msg("该消息已查看", {time: 1000}, function () {
                                table.reload('message-table', t);
                            });
                        } else {
                            layer.msg(res.message);
                        }
                    });
                }, function () {
                    layer.closeAll("dialog");
                }
            )
        }
        if (obj.event === "del") {
            layer.confirm("你确定要删除该消息么？", {
                    skin: 'layui-layer-molv'
                    , closeBtn: 1,
                    icon: 3, title: '提示', btn: ['是的,我确定', '我再想想']
                },
                function () {
                    $.post("/admin/user/message/delete", {"id": data.id}, function (res) {
                        if (res.success) {
                            layer.msg("删除成功", {time: 1000}, function () {
                                table.reload('message-table', t);
                            });
                        } else {
                            layer.msg(res.message);
                        }
                    });
                }, function () {
                    layer.closeAll("dialog");
                }
            )
        }
    });
    t = {
        elem: '#message-table',
        even: true,
        url: '/admin/user/message/list',
        method: 'post',
        page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
            //,curr: 5 //设定初始在第 5 页
            groups: 6, //只显示 1 个连续页码
            first: "首页", //显示首页
            last: "尾页", //显示尾页
            limits: [3, 10, 20, 30]
        },
        width: $(parent.window).width() - 223,
        cols: [[
            {type: 'checkbox'},
            /* {field:'id',        title: 'ID'  ,width: '4%' },*/
            {field: 'title', title: '消息标题', width: '10%'},
            {field: 'content', title: '消息内容', width: '20%'},
            {field: 'messageType', title: '消息类型', width: '8%'},
            {field: 'createDate', title: '创建时间', width: '16%', templet: '<div>{{ layui.laytpl.toDateString(d.createDate) }}</div>', unresize: true},
            {field: 'createName', title: '发送人', width: '8%'},
            {field: 'remarks', title: '备注', width: '8%'},
            {field: 'isLook', title: '状态', width: '10%', templet: '#formatLock'},
            {title: '操作', fixed: 'right', align: 'center', toolbar: '#messageBar'}
        ]]/*,
        done: function () {
            $("[data-field='id']").css('display','none');
        }*/
    }
    table.render(t);

    var active = {
        addMessage: function () {
            addIndex = layer.open({
                title: "发送消息",
                type: 2,
                content: "/admin/user/message/add",
                success: function (layero, addIndex) {
                    setTimeout(function () {
                        layer.tips('点击此处返回消息列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500);
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function () {
                layer.full(addIndex);
            });
            layer.full(addIndex);
        },//批量已读
        lookSome: function () {
            var checkStatus = table.checkStatus('message-table'),
                data = checkStatus.data;
            if (data.length > 0) {
                console.log(JSON.stringify(data));
                layer.confirm("你确定已经查看过这些消息？", {
                        skin: 'layui-layer-molv'
                        , closeBtn: 1,
                        icon: 3, title: '提示', btn: ['是的,我确定', '我再想想']
                    },
                    function () {
                        var deleteindex = layer.msg('更新中，请稍候', {icon: 16, time: false, shade: 0.8});
                        $.ajax({
                            type: "POST",
                            url: "/admin/user/message/readSome",
                            dataType: "json",
                            contentType: "application/json",
                            data: JSON.stringify(data),
                            success: function (res) {
                                layer.close(deleteindex);
                                if (res.success) {
                                    layer.msg("更新成功", {time: 1000}, function () {
                                        // parent.reload();
                                        parent.location.reload();
                                        // parent.layer.reload();
                                        // table.reload('message-table', t);
                                    });
                                } else {
                                    layer.msg(res.message);
                                }
                            }
                        });
                    },function(){

                    }
                )
            } else {
                layer.msg("请选择需要更新状态的消息", {time: 1000});
            }
        },
        //批量删除
        deleteSome: function () {
            var checkStatus = table.checkStatus('message-table'),
                data = checkStatus.data;
            if (data.length > 0) {
                console.log(JSON.stringify(data));
                layer.confirm("你确定要删除这些消息么？", {
                        skin: 'layui-layer-molv'
                        , closeBtn: 1,
                        icon: 3, title: '提示', btn: ['是的,我确定', '我再想想']
                    },
                    function () {
                        var deleteindex = layer.msg('删除中，请稍候', {icon: 16, time: false, shade: 0.8});
                        $.ajax({
                            type: "POST",
                            url: "/admin/user/message/deleteSome",
                            dataType: "json",
                            contentType: "application/json",
                            data: JSON.stringify(data),
                            success: function (res) {
                                layer.close(deleteindex);
                                if (res.success) {
                                    layer.msg("删除成功", {time: 1000}, function () {
                                        table.reload('message-table', t);
                                    });
                                } else {
                                    layer.msg(res.message);
                                }
                            }
                        });
                    }
                )
            } else {
                layer.msg("请选择需要删除的消息", {time: 1000});
            }
        }
    };
    $('.layui-inline .layui-btn').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    //搜索
    form.on("submit(searchForm)", function (data) {
        table.reload('message-table', {
            page: {curr: 1},
            where: data.field
        });
        return false;
    });
});