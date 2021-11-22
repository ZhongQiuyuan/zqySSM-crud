package com.atguigu.crud;

import org.junit.Test;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zqy
 * @create 2021-11-11 19:48
 */
public class MBGStarter {

    // @Test
    // public void mbgTest(){
    //     try {
    //         List<String> warnings = new ArrayList<String>();
    //         boolean overwrite = true;
    //         ConfigurationParser cp = new ConfigurationParser(warnings);
    //         InputStream is = MBGStarter.class.getClassLoader().getResourceAsStream("mbg.xml");
    //         Configuration config = cp.parseConfiguration(is);
    //         DefaultShellCallback callback = new DefaultShellCallback(overwrite);
    //         MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
    //         myBatisGenerator.generate(null);
    //     } catch (IOException e) {
    //         e.printStackTrace();
    //     } catch (XMLParserException e) {
    //         e.printStackTrace();
    //     } catch (InvalidConfigurationException e) {
    //         e.printStackTrace();
    //     } catch (SQLException throwables) {
    //         throwables.printStackTrace();
    //     } catch (InterruptedException e) {
    //         e.printStackTrace();
    //     }
    //
    // }
}