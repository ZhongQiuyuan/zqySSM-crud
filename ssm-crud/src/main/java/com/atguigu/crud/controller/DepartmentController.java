package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.service.DepartmentService;
import com.atguigu.crud.vo.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author zqy
 * @create 2021-11-15 19:52
 * 处理和部门有关的请求
 */

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        // 查出的所有部门信息
        List<Department> depts = departmentService.getDepts();
        return Msg.success().add("depts", depts);
    }
}
