package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.service.EmployeeService;
import com.atguigu.crud.vo.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zqy
 * @create 2021-11-12 21:39
 * 处理员工CRUD请求
 */

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    /*
     * Description: 查询所有员工
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue = "1") Integer pn,
                               @RequestParam(value="row",defaultValue = "5") Integer row){
        PageHelper.startPage(pn, 5);
        List<Employee> emps = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(emps, row);
        return Msg.success().add("pageInfo",pageInfo);
    }

    // @RequestMapping("/emps")
    // public String getEmps(@RequestParam(value="pn",defaultValue = "1") Integer pn,
    //                       @RequestParam(value="row",defaultValue = "5") Integer row,
    //                       Model model){
    //
    //     PageHelper.startPage(pn, 5);
    //     List<Employee> emps = employeeService.getAll();
    //     PageInfo pageInfo = new PageInfo(emps, row);
    //     model.addAttribute("pageInfo", pageInfo);
    //     return "list";
    // }

    /*
     * Description: 员工保存
     */
    @RequestMapping(value="/emps",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            // 如果校验有错误
            Map<String,Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println("错误的字段名:"+fieldError.getField());
                System.out.println("错误信息:"+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }

    /*
     * Description: 检查用户名是否重复
     */
    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkuser(@RequestParam(value="empName") String empName){
        boolean b = employeeService.checkUser(empName);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    /*
     * Description: 获取当前用户
     */
    @RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee emp = employeeService.getEmp(id);
        return Msg.success().add("emp", emp);
    }

    /*
     * Description: 员工更新方法
     */
    // 注意这里路径占位符要写成empId，才能将这个参数赋值给employee对象的empId属性
    @RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(@Valid Employee employee,BindingResult result){
        if(result.hasErrors()){
            // 如果校验有错误
            Map<String,Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            employeeService.updateEmp(employee);
            return Msg.success();
        }
    }

    /*
     * Description: 根据Id删除员工
     */
    // @RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
    // @ResponseBody
    // public Msg deleteEmpById(@PathVariable("id") Integer id){
    //     employeeService.deleteEmp(id);
    //     return Msg.success();
    // }

    /*
     * Description: 单个、批量删除员工
     */
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmpById(@PathVariable("ids") String ids){
        if(ids.contains("-")){
            String[] str_ids = ids.split("-");
            List<Integer> del_ids = new ArrayList<>();
            // 组装id到List
            for(String id : str_ids){
                del_ids.add(Integer.parseInt(id));
            }
            employeeService.deleteBatch(del_ids);
        }else{
            // 单个删除
            int id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Msg.success();
    }
}
