$(function(){
    //清空按钮
    $("#clear").click(function(){
            $("#oldPassword").val("");
            $("#newPassword").val("");
            $("#reNewPassword").val("");
            $("#errorMsg").text("");
            $("#successMsg").text("");
            $("#save").attr("disabled",false);
            $("#save").attr("style","margin-right:30px;width: 60px;  height:30px;opacity:1");
        }
    );

    //保存按钮
    $("#save").click(function(){
            var  projectname=document.getElementById("projectname").getAttribute("value");
            var url=projectname+"/updatepassword";
            // alert(url);
            var oldPassword = $("#oldPassword").val();
            var newPassword = $("#newPassword").val().trim();
            var reNewPassword = $("#reNewPassword").val().trim();
            var password=/(?!^[0-9]+$)(?!^[A-z]+$)(?!^[_*&^%$#@!?=+<>]+$)(?!^[^A-z0-9]+$)^.{6,16}$/;
            if (oldPassword == "") {
                $("#errorMsg").text("旧密码不能为空！");
            }else if (newPassword == "") {
                $("#errorMsg").text("新密码不能为空！");
            }else if (reNewPassword == "") {
                $("#errorMsg").text("确认新密码不能为空！");
            }else if (newPassword != reNewPassword) {
                $("#errorMsg").text("新密码必须一致！");
            }else if (!password.exec(newPassword)) {
            $("#errorMsg").text("密码必须为6-16位的字母、数字或符号任意两种的组合!");
            }else{
                // alert("----"+url);
                $.ajax(
                    {
                        url:url,
                        method:"post",
                        data:
                            {
                                oldpassword: oldPassword,
                                newpassword: newPassword
                            },
                        dataType: 'text',
                        success: function (data) {
                            if(data == 1){
                                $("#errorMsg").text("密码错误");
                                $("#successMsg").text("");
                            }else if(data == 2){
                                alert("密码修改成功！");
                                $("#successMsg").text("密码修改成功");
                                $("#errorMsg").text("");
                            }else if(data == 3){
                                $("#errorMsg").text("尚未登录，登录后再修改");
                            }
                        },
                        error: function (msg) {
                            alert( "-----------");
                            $("#successMsg").text("");
                            $("#errorMsg").text("密码修改失败，请联系管理员！");
                        }
                    })
            }

                // $.ajax({
                //     url: "../user/savePwd",
                //     type: "POST",
                //     // contentType: "application/json; charset=utf-8",
                //     data: {
                //         userCode: userCode,
                //         oldPassword: oldPassword,
                //         newPassword: newPassword
                //     },
                //     dataType: 'text',
                //     success: function (data) {
                //         if(data == 1){
                //             console.log("密码修改成功！");
                //             $("#errorMsg").text("");
                //             $("#successMsg").text("密码修改成功，请重新登陆！");
                //             $("#save").attr("disabled",true);
                //             $("#save").attr("style","margin-right:30px;width: 60px;  height:30px;opacity:0.5");
                //         } else if (data == 3){
                //             $("#successMsg").text("");
                //             $("#errorMsg").text("输入的旧密码错误！");
                //         } else if (data == 4){
                //             $("#successMsg").text("");
                //             $("#errorMsg").text("当前用户不存在，请重新登录！");
                //         } else {
                //             $("#successMsg").text("");
                //             $("#errorMsg").text("密码修改失败，请联系管理员！");
                //         }
                //     },
                //     error: function (msg) {
                //         $("#successMsg").text("");
                //         $("#errorMsg").text("密码修改失败，请联系管理员！");
                //     }
                // })

        }
    );
})

