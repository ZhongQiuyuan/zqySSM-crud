package com.atguigu.crud;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.EmployeeExample;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;


/**
 * @author zqy
 * @create 2021-11-12 11:27
 * 测试dao层的工作
 * 推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 * 1、导入Spring单元测试依赖
 * 2、@ContextConfiguration指定spring配置文件的位置
 * 3、直接autowired要使用的组件
 */


// @RunWith(SpringJUnit4ClassRunner.class)
// @ContextConfiguration(locations={"classpath:applicationContext.xml"})
// public class MapperTest {
//
//     @Autowired
//     DepartmentMapper departmentMapper;
//
//     @Autowired
//     EmployeeMapper employeeMapper;
//
//     @Autowired
//     SqlSession sqlSession;
//
//
//     /*
//      * Description: 测试DepartmentMapper
//      * @Param:
//      * @Return:
//      */
//
//     @Test
//     public void testCRUD01(){
//         // System.out.println(departmentMapper);
//         // 1.插入几个部门
//         departmentMapper.insertSelective(new Department(null,"开发部"));
//         departmentMapper.insertSelective(new Department(null,"测试部"));
//     }
//
//     @Test
//     public void testCRUD02(){
//         // 2.插入几个员工
//         employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@qq.com",1));
//     }
//
//     @Test
//     public void testCRUD03(){
//         // 3.批量插入员工，使用可以执行批量操作的sqlSession
//         EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//         for (int i = 0; i < 1000; i++) {
//             String uid = UUID.randomUUID().toString().substring(0, 5)+i;
//             mapper.insertSelective(new Employee(null,uid,"M",uid+"@qq.com",1));
//         }
//         System.out.println("批量插入完成");
//
//     }
//
//     @Test
//     public void testCRUD04(){
//         // 4.查询数据
//         List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
//         System.out.println(employees.get(0));
//     }
//
//     @Test
//     public void testCRUD05(){
//         // 4.查询数据
//         List<Employee> employees = employeeMapper.selectByExample(null);
//         System.out.println(employees.get(0));
//
//     }
//
//
// }
