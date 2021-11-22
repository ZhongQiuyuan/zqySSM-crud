package com.atguigu.crud;

import com.atguigu.crud.bean.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.context.WebApplicationContext;

import java.util.HashMap;
import java.util.List;

/**
 * @author zqy
 * @create 2021-11-14 16:17
 */

// @RunWith(SpringJUnit4ClassRunner.class)
// @WebAppConfiguration // 可以获取web的ioc容器，即SpringMVC的ioc容器
// @ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springMVC.xml"})
// public class MvcTest {
//     // 传入SpringMVC的ioc
//     @Autowired
//     WebApplicationContext context;
//     // 虚拟mvc请求，获取处理结果
//     MockMvc mockMvc;
//
//     @Before
//     public void initMockMvc(){
//         mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
//     }
//
//     @Test
//     public void testPage() throws Exception {
//         MultiValueMap<String,String> params = new LinkedMultiValueMap<String,String>();
//         params.add("pn", "5");
//         params.add("row", "5");
//         // 模拟请求，拿到返回值
//         MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").params(params))
//                 .andReturn();
//         // 请求成功后，请求域中会有pageInfo，我们可以取出pageInfo进行验证
//         MockHttpServletRequest request = mvcResult.getRequest();
//         PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
//         System.out.println("当前页码："+pageInfo.getPageNum());
//         System.out.println("总页码："+pageInfo.getPages());
//         System.out.println("总记录数："+pageInfo.getTotal());
//         System.out.println("在页面需要连续显示的页码：");
//         int[] nums = pageInfo.getNavigatepageNums();
//         for (int i : nums){
//             System.out.print(" "+i);
//         }
//         System.out.println("");
//
//         // 获取员工数据
//         List<Employee> list = pageInfo.getList();
//         for (Employee employee : list) {
//             System.out.println("ID："+employee.getEmpId()+"==>Name:"+employee.getEmpName());
//         }
//
//
//     }
// }
