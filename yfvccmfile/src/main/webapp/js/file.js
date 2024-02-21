
//查询id对应的图书信息，并将图书信息回显到编辑或借阅的窗口中
function findFileById(id) {
    var url = "/file/findById?id=" + id;
    // alert(url);
    // alert(2222222222222);
    $.get(url, function(res) {
        alert("hello1111");
        // console.log(res) // 这里的 res 是服务器返回的数据
        alert(res);
        alert("word");
        }
    );
}

function  deletefile() {
    var fileid = document.getElementById("fileid").getAttribute("value");
    var  projectname=document.getElementById("projectname").getAttribute("value");
    var mystr=confirm("确认删除");
    if(mystr==true){
      window.location.href=projectname+"/file/deleteById?fileid="+fileid;
    };
}

function checkPassword(){
    // var oldpassword = document.getElementById("oldpassword").getAttribute("value");
    var oldpassword = document.getElementById("oldpassword").value;
    var  check= document.getElementById("oldpassword").value;
    if(oldpassword!=check)
    var  projectname=document.getElementById("projectname").getAttribute("value");
    var url=projectname+"/updatepassword";
    $.ajax(
        {
            url:url,
            method:"post",
            data:
                {
                    oldpassword:oldpassword,
                },
            dataType:"json",
            success:function ()
            {
                console.log("登录成功");
            }
        })
}

var pageargs = {
    cur: 1,
    total: 0,
    len: 5,
    pagesize:10,
    gourl:"",
    targetId: 'pagination',
    callback: function (total) {
        var oPages = document.getElementsByClassName('page-index');
        for (var i = 0; i < oPages.length; i++) {
            oPages[i].onclick = function () {
                changePage(this.getAttribute('data-index'), pageargs.pagesize);
            }
        }
        var goPage = document.getElementById('go-search');
        goPage.onclick = function () {
            var index = document.getElementById('yeshu').value;
            if (!index || (+index > total) || (+index < 1)) {
                return;
            }
            changePage(index, pageargs.pagesize);
        }
    }
}
/**
 *图书查询栏的查询参数
 * name 图书名称
 * author 图书作者
 * press 图书出版社
 */
var bookVO={
    name:'',
    author:'',
    press:''
}
/**
 *借阅记录查询栏的查询参数
 * name 图书名称
 * borrower 借阅人
 */
var recordVO={
    bookname:'',
    borrower:''
}
//数据展示页面分页插件的页码发送变化时执行
function changePage(pageNo,pageSize) {
    pageargs.cur=pageNo;
    pageargs.pagesize=pageSize;
    document.write("<form action="+pageargs.gourl +" method=post name=form1 style='display:none'>");
    document.write("<input type=hidden name='pageNum' value="+pageargs.cur+" >");
    document.write("<input type=hidden name='pageSize' value="+pageargs.pagesize+" >");
    //如果跳转的是图书信息查询的相关链接，提交图书查询栏中的参数
    if(pageargs.gourl.indexOf("book")>=0){
        document.write("<input type=hidden name='name' value="+bookVO.name+" >");
        document.write("<input type=hidden name='author' value="+bookVO.author+" >");
        document.write("<input type=hidden name='press' value="+bookVO.press+" >");
    }
    //如果跳转的是图书记录查询的相关链接，提交图书记录查询栏中的参数
    if(pageargs.gourl.indexOf("record")>=0){
        document.write("<input type=hidden name='bookname' value="+recordVO.bookname+" >");
        document.write("<input type=hidden name='borrower' value="+recordVO.borrower+" >");
    }
    document.write("</form>");
    document.form1.submit();
    pagination(pageargs);
}

