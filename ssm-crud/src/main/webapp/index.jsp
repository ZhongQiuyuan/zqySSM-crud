<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
<%--修改员工时的模态框--%>
<!-- Modal -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <%--头部以及x按钮--%>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改员工</h4>
            </div>
            <div class="modal-body">
                <%--添加员工信息的表单--%>
                <form class="form-horizontal" id="update_emp_form">
                    <%--表单项--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">EmpName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_update_input" placeholder="empName@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <%--部门提交部门id即可--%>
                            <select class="form-control" name="dId" id="dept_update_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <%--关闭及保存按钮--%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn" >更新</button>
            </div>
        </div>
    </div>
</div>


<%--添加员工时的模态框--%>
<!-- Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <%--头部以及x按钮--%>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工添加</h4>
            </div>
            <div class="modal-body">
                <%--添加员工信息的表单--%>
                <form class="form-horizontal" id="add_emp_form">
                    <%--表单项--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">EmpName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <%--显示错误提示信息--%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_add_input" placeholder="empName@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <%--部门提交部门id即可--%>
                            <select class="form-control" name="dId" id="dept_add_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <%--关闭及保存按钮--%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn" >保存</button>
            </div>
        </div>
    </div>
</div>



<%--搭建显示页面--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--新增/删除 按钮 offset到右边的位置--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check_all"/>
                        </th>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                <%--表单员工信息数据--%>
                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">
        </div>
        <%--分页条--%>
        <div id="page_nav_area">
        </div>

    </div>
</div>


<script type="text/javascript">
    <%--=========================查询--页面加载后直接显示第一页、跳转到某一页=======================--%>
    //1、页面加载完成后，直接去发送一个ajax请求，要到分页数据
    $(function(){
        to_page(1);
    })

    //跳转到某一页toPage
    var totalPages;
    var curPage;
    function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/emps",
            data:{"pn":pn},
            type:"GET",
            dataType:"json",
            // 请求成功后的回调函数。参数：由服务器返回，并根据dataType参数进行处理后的数据；描述状态的字符串。
            success:function (result){
                // 1、解析并显示员工数据
                build_emps_table(result.dataMap.pageInfo.list);
                // 2、解析并显示分页信息数据
                build_page_info(result.dataMap.pageInfo);
                // 3、解析并显示分页条数据
                build_page_nav(result.dataMap.pageInfo);
                totalPages = result.dataMap.pageInfo.pages;
                curPage = result.dataMap.pageInfo.pageNum;
            }
        })
    }

    <%--=========================查询--解析显示员工表和分页导航=======================--%>

    //2、解析显示员工表方法
    function build_emps_table(emps){
        // 先清空当前表格数据
        $("#emps_table tbody").empty();
        $.each(emps,function(index,item){
            // 把每个员工的信息整体构建一个<tr>
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>")
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var departmentTd = $("<td></td>").append(item.department.deptName);
            // 按钮
            /*
             <button class="btn btn-primary btn-sm">
             <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
             编辑
             </button>
             */
            var editBtn = $("<button></button>")
                .addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            // 为编辑按钮添加一个自定义的属性，表示当前员工id
            editBtn.attr("emp-id",item.empId);
            var deleteBtn = $("<button></button>")
                .addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            // 为删除按钮添加一个自定义的属性，表示当前员工id
            deleteBtn.attr("emp-id",item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn)
            $("<tr></tr>")
                .append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(departmentTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        })

    }

    //3、解析显示分页信息方法
    function build_page_info(pageInfo){
        // 清空之前的数据
        $("#page_info_area").empty();
        // 添加现有数据
        $("#page_info_area").append("当前第"+pageInfo.pageNum+"页，总"+pageInfo.pages+"页，总"+pageInfo.total+"条记录");
    }

    //4、解析显示分页条方法,绑定单击事件
    function build_page_nav(pageInfo){
        // 清空之前的数据
        $("#page_nav_area").empty();
        // page_nav_area
        var ul = $("<ul></ul>").addClass("pagination");
        //首页和上一页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(pageInfo.hasPreviousPage == false){
            // 判断是否有上一页
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            // 绑定单击事件
            firstPageLi.click(function(){
                to_page(1);
            })
            prePageLi.click(function(){
                to_page(pageInfo.prePage);
            })
        }
        ul.append(firstPageLi).append(prePageLi);
        //遍历中间页码
        $.each(pageInfo.navigatepageNums,function(index,item){
            // 当前页码高亮
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            })
            ul.append(numLi);
        })
        //下一页和末页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(pageInfo.hasNextPage == false){
            // 判断是否有下一页
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            // 绑定单击事件
            nextPageLi.click(function(){
                to_page(pageInfo.nextPage);
            })
            lastPageLi.click(function(){
                to_page(pageInfo.pages);
            })
        }
        ul.append(nextPageLi).append(lastPageLi);
        //创建导航条, 显示到页面上
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }


    <%--=========================新增--弹出模态框=======================--%>

    // 点击新增按钮弹出模态框，为新增按钮绑定单击事件
    $("#emp_add_modal_btn").click(function (){
        // 重置表单内容，用的是dom对象不是jquery对象
        $("#add_emp_form")[0].reset();
        // 重置表单样式
        resetForm("#add_emp_form");

        // 发送ajax请求，查出部门信息，显示在部门列表
        getDepts("#dept_add_select");
        $("#empAddModal").modal({
            backdrop:"static"
        })
    })

    // 获取部门信息的方法
    function getDepts(ele){
        // 清空下拉列表
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function (result){
                // "dataMap":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}
                $.each(result.dataMap.depts,function (index,item){
                    var optionEle = $("<option></option>").append(item.deptName).attr("value",item.deptId);
                    optionEle.appendTo(ele);
                })
            }
        })
    }

    <%--=========================新增--保存事件=======================--%>

    //点击"保存"按钮，提交表单数据
    $("#emp_save_btn").click(function (){
        // 模态框中填写的表单数据提交给服务器
        // 判断校验是否成功
        if("success"!=$("#emp_save_btn").attr("empName_va") || "success"!=$("#emp_save_btn").attr("email_va")){
            return false;
        }
        // 发送ajax请求保存员工
        $.ajax({
            url:"${APP_PATH}/emps",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            dataType: "json",
            success:function (result){
                if(result.errorCode.value!="00000"){
                    //保存不成功
                    //{"errorCode":{"value":"A0400","desc":"用户请求参数错误"},"dataMap":{"errorFields":{"empName":"用户名必须是2-5位中文或者6-16位英文和数字的组合"}}}
                    //有哪个字段的信息就显示哪个字段
                    if(undefined!=result.dataMap.errorFields.empName){
                        //显示用户名的错误信息
                        show_validate_msg("#empName_add_input","error",result.dataMap.errorFields.empName);
                        $("#emp_save_btn").attr("empName_va","error");
                    }
                    if(undefined!=result.dataMap.errorFields.email){
                        //显示邮箱的错误信息
                        show_validate_msg("#email_add_input","error",result.dataMap.errorFields.email);
                        $("#emp_save_btn").attr("email_va","error");
                    }
                }else{
                    // 员工保存成功
                    // 1.关闭模态框
                    $("#empAddModal").modal("hide");
                    // 2.来到最后一页，显示刚保存的数据
                    to_page(totalPages+1);
                }

            }
        })
    })

    <%--=========================新增--表单数据校验=======================--%>

    //用户名输入框内容改变，检查用户名是否合法，发送ajax请求校验用户名是否重复
    $("#empName_add_input").change(function (){
        // 重置用户名输入框样式
        resetForm($("#empName_add_input").parent()[0]);
        // 1、拿到要校验的数据，使用正则表达式
        var empName = $("#empName_add_input").val();
        // 正则表达式：数字字母或者中文
        var regName = /(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]+$)/;
        if(!regName.test(empName)){
            show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字的组合");
            $("#emp_save_btn").attr("empName_va","error");
        }else{
            // 发送ajax请求校验用户名是否重复
            $.ajax({
            url:"${APP_PATH}/checkuser",
                type:"GET",
                data:{"empName":this.value},
            success:function (result){
                //{"errorCode":{"value":"00000","desc":"一切正确"},"dataMap":{}}
                if(result.errorCode.value=="00000"){
                    // 返回正确的状态码则显示校验正确
                    show_validate_msg("#empName_add_input","success","");
                    $("#emp_save_btn").attr("empName_va","success");
                }else{
                    show_validate_msg("#empName_add_input","error","该员工姓名已存在");
                    $("#emp_save_btn").attr("empName_va","error");
                }
            }
            })
        }
    })

    //邮箱输入框内容改变，检查邮箱是否合法
    $("#email_add_input").change(function () {
        // 重置邮箱输入框样式
        resetForm($("#email_add_input").parent()[0]);
        // 2、校验邮箱
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_add_input","error","邮箱格式不正确");
            $("#emp_save_btn").attr("email_va","error");
        }else {
            show_validate_msg("#email_add_input","success","");
            $("#emp_save_btn").attr("email_va","success");
        }
    })


    // 展示校验信息
    function show_validate_msg(ele,status,msg){
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else{
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    // 判断当前保存按钮是否该被禁用
    function disableSaveBtn(){
        if("success"==$("#emp_save_btn").attr("empName_va") && "success"==$("#emp_save_btn").attr("email_va")){
            // 取消禁用保存按钮
            $("#emp_save_btn").prop("disabled", false);
        }else { //无效时禁用按钮
            $("#emp_save_btn").prop("disabled", true);
        }
    }


    <%--=========================新增--表单重置=======================--%>

    // 重置表单样式，避免重复添加样式
    function resetForm(select){
        $(select).removeClass("has-error has-success");
        $(select).find("*").removeClass("has-error has-success");
        $(select).find(".help-block").text("");
    }

    <%--=========================修改--为编辑按钮绑定单击事件=======================--%>
    //点击"编辑"按钮, 弹出"修改员工"模态框
    //因为编辑按钮是未来创建的, 所以需要委托给#emps_table
    $("#emps_table").on("click",".edit_btn",function(){
        // 重置表单内容，用的是dom对象不是jquery对象
        $("#update_emp_form")[0].reset();
        // 重置表单样式
        resetForm("#update_emp_form");
        // 1、发送ajax请求，查出部门信息，显示在部门列表
        getDepts("#dept_update_select");
        // 2、查出员工信息，显示员工信息
        getEmp($(this).attr("emp-id"));
        // 3、把员工的id传递给员工的更新按钮
        $("#emp_update_btn").attr("emp-id",$(this).attr("emp-id"))
        $("#empUpdateModal").modal({
            backdrop:"static"
        })


    })

    // 获取当前员工信息
    function getEmp(id){
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function (result){
                //{"errorCode":{"value":"00000","desc":"一切正确"},"dataMap":{"emp":{"empId":1,"empName":"Jerry","gender":"M","email":"Jerry@qq.com","dId":1,"department":null}}}
                var empData = result.dataMap.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal #dept_update_select").val([empData.dId]);

            }
        })
    }

    <%--=========================修改--为更新按钮绑定单击事件=======================--%>

    $("#emp_update_btn").click(function (){
        // 验证邮箱是否合法
        if($("#emp_update_btn").attr("email_va")=="error"){
            return false;
        }else {
            // 发送ajax请求保存更新结果
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("emp-id"),
                type:"PUT",
                data:$("#update_emp_form").serialize(),
                success:function (result){
                    if(result.errorCode.value!="00000"){
                        // 更新失败
                        if(undefined!=result.dataMap.errorFields.email){
                            //显示邮箱的错误信息
                            show_validate_msg("#email_update_input","error",result.dataMap.errorFields.email);
                            $("#emp_update_btn").attr("email_va","error");
                        }
                    }else{
                        // 员工修改成功
                        // 1.关闭模态框
                        $("#empUpdateModal").modal("hide");
                        // 2.回到当前页面，显示刚修改的数据
                        to_page(curPage);
                    }
                }
            })
        }
    })

    <%--=========================修改--检查表单信息是否合法=======================--%>

    //更新时，邮箱输入框内容改变，检查邮箱是否合法
    $("#email_update_input").change(function () {
        // 重置邮箱输入框样式
        resetForm($("#email_update_input").parent()[0]);
        // 2、校验邮箱
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_update_input","error","邮箱格式不正确");
            $("#emp_update_btn").attr("email_va","error");
        }else {
            show_validate_msg("#email_update_input","success","");
            $("#emp_update_btn").attr("email_va","success");
        }
    })


    <%--=========================删除--单个删除=======================--%>
    $(document).on("click",".delete_btn",function (){
        // 1、弹出确认是否删除对话框
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if(confirm("确认是否删除【"+empName+"】吗？")){
            // 确认删除,发送ajax请求删除
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("emp-id"),
                type:"DELETE",
                success:function (){
                    alert("删除成功");
                    to_page(curPage);
                }
            })
        }
    })

    <%--=========================删除--批量删除=======================--%>

    //完成全选/全不选功能
    $("#check_all").click(function (){
        //attr获取checked是undefined;
        //attr修改和获取自定义属性的值；
        //prop修改和读取dom原生属性的值
        $(".check_item").prop("checked",$("#check_all").prop("checked"));
    })

    //选择所有.check_item后，#check_all也会自动选上
    $(document).on("click",".check_item",function (){
        //判断当前选择的元素是否是所有元素
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked",flag);
    })

    // 点击删除按钮后将选中的员工删除
    $("#emp_delete_all_btn").click(function (){
        var empNames = "";
        var del_idstr = "";
        $.each($(".check_item:checked"),function (){
            //this
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
        })
        empNames = empNames.substr(0,empNames.length-1);
        del_idstr = del_idstr.substr(0,del_idstr.length-1);
        if(confirm("确认删除【"+empNames+"】吗")){
            // 确认则发送ajax请求
            $.ajax({
                url:"${APP_PATH}/emp/"+del_idstr,
                type:"DELETE",
                success:function (){
                    alert("删除成功");
                    to_page(curPage);
                }
            })
        }
    })

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>