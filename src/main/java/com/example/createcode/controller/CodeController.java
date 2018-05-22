package com.example.createcode.controller;

import com.example.createcode.common.utils.*;
import com.example.createcode.entity.GenEntity;
import com.example.createcode.entity.GenFiledsEntity;
import com.example.createcode.entity.PathEntity;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

/**
 * CREATE BY wb
 * TIME: 2018/5/22 9:17
 */
@Controller
public class CodeController {

    /**
     * 去代码生成器页面
     */
    @RequestMapping(value = "")
    public String initCreateCode(){
        return "tableManager";
    }

    /**
     * 生成代码
     */
    @RequestMapping(value = "createCode", method = RequestMethod.POST)
    public void createCode(HttpServletResponse response, @RequestBody GenEntity entity) throws Exception{
        // 表名称
        String tableName = entity.getTableName();
        // 对象名称
        String objectName = entity.getObjectName();

        String packageName = entity.getPackageName();

        List<String[]> fieldList = new ArrayList<>();
        for (GenFiledsEntity genEntity : entity.getGenFiledsEntities()) {
            String[] ss = new String[9];
            // 数据库字段
            ss[0] = genEntity.getColumnName();
            if (!"datetime".equalsIgnoreCase(genEntity.getColumnType())) {
                // 数据库类型
                ss[1] = genEntity.getColumnType().substring(0, (genEntity.getColumnType().indexOf("(")));
                // 数据库字段长度
//				ss[2] = genEntity.getColumnType().substring(genEntity.getColumnType().indexOf("("), genEntity.getColumnType().indexOf(")"));
                ss[2] = genEntity.getColumnType().replace(ss[1], "");
            } else {
                ss[1] = genEntity.getColumnType();
                ss[2] = "";
            }
            // 对象字段
            ss[3] = genEntity.getJavaProprety();
            // 对象类型
            ss[4] = genEntity.getJavaType();
            // 注释
            ss[5] = genEntity.getRemark();
            // 是否允许为空
            ss[6] = String.valueOf(genEntity.getRequired());
            // 默认值
            ss[7] = genEntity.getColumnDefault();
            // 无符号
            ss[8] = "0";
            fieldList.add(ss);
        }

        Map<String, Object> root = new HashMap<>(); // 创建数据模型
        root.put("fieldList", fieldList);
        root.put("packageName", packageName); // 包名
        root.put("objectName", objectName); // 类名
        root.put("objectNameLower", objectName.toLowerCase()); // 类名(全小写)
        root.put("objectNameUpper", objectName.toUpperCase()); // 类名(全大写)
        root.put("nowDate", new Date()); // 当前日期
        Map<String, String> map = System.getenv();
        String userName = map.get("USERNAME");// 获取用户名
        root.put("createUser", userName == null ? "1" : userName);
        root.put("tableName", tableName);

        FileDel.delFolder(PathUtil.getClasspath() + "code/" + packageName); // 生成代码前,先清空之前生成的代码

        String filePath = "code/" + packageName; // 存放路径
        String ftlPath = "createCode"; // ftl路径

        /* 生成controller */
        Freemarker.printFile("controllerTemplate.ftl", root, "/controller/"
                + firstLetterToUpper(objectName) + "Controller.java", filePath, ftlPath);
        /* 生成service */
        Freemarker.printFile("serviceTemplate.ftl", root, "/service/"
                + firstLetterToUpper(objectName) + "Service.java", filePath, ftlPath);
        /* 生成serviceImpl */
        Freemarker.printFile("serviceImplTemplate.ftl", root, "/service/impl/"
                + firstLetterToUpper(objectName) + "ServiceImpl.java", filePath, ftlPath);
        // 生成Entity
        Freemarker.printFile("entityTemplate.ftl", root, "/entity/"
                + firstLetterToUpper(objectName) + ".java", filePath, ftlPath);
        // 生成Dao
        Freemarker.printFile("daoTemplate.ftl", root, "/dao/"
                + firstLetterToUpper(objectName) + "Dao.java", filePath, ftlPath);
        /* 生成mybatis xml */
        Freemarker.printFile("mapperMysqlTemplate.ftl", root, "/mapper/" + firstLetterToUpper(objectName) + "MysqlMapper.xml",
                filePath, ftlPath);
//		Freemarker.printFile("mapperOracleTemplate.ftl", root, "code/"
//				+ packageName + "/mybatis_oracle/" + objectName + "Mapper.xml",
//				filePath, ftlPath);
        /* 生成SQL脚本 */
        Freemarker.printFile("mysql_SQL_Template.ftl", root, "/mysql数据库脚本/JY_"
                        + objectName.toUpperCase() + "_TAB.sql", filePath,
                ftlPath);
//		Freemarker.printFile("oracle_SQL_Template.ftl", root, "oracle数据库脚本/"
//				+ tabletop + objectName.toUpperCase() + ".sql", filePath,
//				ftlPath);
        /* 生成jsp页面 */
//		Freemarker.printFile("jsp_list_Template.ftl", root, "/jsp/"
//				+ packageName + "/" + objectName.toLowerCase() + "_list.jsp",
//				filePath, ftlPath);
//		Freemarker.printFile("jsp_edit_Template.ftl", root, "/jsp/"
//				+ packageName + "/" + objectName.toLowerCase() + "_edit.jsp",
//				filePath, ftlPath);
//		/* 生成说明文档 */
//		Freemarker.printFile("docTemplate.ftl", root, "说明.doc", filePath,
//				ftlPath);
        /* 生成的全部代码压缩成zip文件 */
        FileZip.zip(PathUtil.getClasspath() + "code/" + packageName,
                PathUtil.getClasspath() + "code/" + packageName + "/" + packageName + ".zip");
    }


    /**
     * 下载代码压缩包
     * @param pathEntity
     * @param response
     * @return
     */
    @RequestMapping(value = "downloadZip", method = RequestMethod.POST)
    @ResponseBody
    public void  downloadZip(@RequestBody PathEntity pathEntity, HttpServletResponse response) throws Exception{
        if(StringUtils.isNoneBlank(pathEntity.getPackageName())){
            File file = new File(PathUtil.getClasspath() + "code/" + pathEntity.getPackageName() + "/" + pathEntity.getPackageName() + ".zip");
            String filename = file.getName();
            FileDownload.fileDownload(response, file.getPath(), filename);
        }

    }


    private static String firstLetterToUpper(String str){
        char[] array = str.toCharArray();
        //ASCII a-z 范围为97-122
        if(array[0] > 96 && array[0] < 123 ){
            array[0] -= 32;
        }
        return String.valueOf(array);
    }


}
