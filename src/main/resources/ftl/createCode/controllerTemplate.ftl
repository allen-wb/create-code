package com.jy.moudles.${packageName}.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.jsonadpter.AsyncResponseData;
import com.jy.moudles.${packageName}.entity.${objectName?cap_first};
import com.jy.moudles.${packageName}.service.${objectName?cap_first}Service;

/** 
 * ${objectName}实现类
 *
 * 创建人：${createUser}
 * 创建时间：${nowDate?string("yyyy-MM-dd")}
 */
@Controller
@RequestMapping(value="/${objectName?lower_case}")
public class ${objectName?cap_first}Controller {
	
	@Autowired
	private ${objectName?cap_first}Service ${objectName?lower_case}Service;
	
	private static final Logger logger = LoggerFactory.getLogger(${objectName?cap_first}Controller.class);
	
	/**
	 * 新增${objectName?lower_case}对象
	 * 
	 * @param ${objectName?lower_case}
	 * @throws Exception
	 */
	@RequestMapping(value = "/save${objectName?cap_first}", method = RequestMethod.POST)
	@ResponseBody
	public AsyncResponseData.ResultData save${objectName?cap_first}(${objectName?cap_first} ${objectName?lower_case}) throws Exception{
		logger.info("新增${objectName?cap_first} Start");
		
		${objectNameLower}Service.insert${objectName?cap_first}(${objectName?lower_case});
		
		logger.info("新增${objectName?cap_first} End");
		return AsyncResponseData.getSuccess();
	}
	
	/**
	 * 修改${objectName?lower_case}对象
	 * 
	 * @param ${objectName?lower_case}
	 * @throws Exception
	 */
	@RequestMapping(value = "/update${objectName?cap_first}", method = RequestMethod.POST)
	@ResponseBody
	public AsyncResponseData.ResultData update${objectName?cap_first}(${objectName?cap_first} ${objectName?lower_case}) throws Exception{
		logger.info("修改${objectName?cap_first} Start");
		
		${objectNameLower}Service.update${objectName?cap_first}(${objectName?lower_case});
		
		logger.info("修改${objectName?cap_first} End");
		return AsyncResponseData.getSuccess();
	}
	
	/**
	 * 删除${objectName?lower_case}对象
	 * 
	 * @param ${objectName?lower_case}
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete${objectName?cap_first}", method = RequestMethod.POST)
	@ResponseBody
	public AsyncResponseData.ResultData delete${objectName?cap_first}(${objectName?cap_first} ${objectName?lower_case}) throws Exception{
		logger.info("删除${objectName?cap_first} Start");
		
		${objectNameLower}Service.delete${objectName?cap_first}ById(${objectName?lower_case}.getId());
		
		logger.info("删除${objectName?cap_first} End");
		return AsyncResponseData.getSuccess();
	}
	
	/**
	 * 获取${objectName?lower_case}对象
	 * 
	 * @param ${objectName?lower_case}
	 * @throws Exception
	 */
	@RequestMapping(value = "/query${objectName?cap_first}s", method = RequestMethod.POST)
	@ResponseBody
	public AsyncResponseData.ResultData query${objectName?cap_first}s(${objectName?cap_first} ${objectName?lower_case}) throws Exception{
		logger.info("获取${objectName?cap_first} Start");
		
		Map<String, Object> filter = new HashMap<String, Object>();
		
		List<${objectName?cap_first}> ${objectName?lower_case}s= ${objectNameLower}Service.query${objectName?cap_first}sFilter(filter);
		logger.info("获取${objectName?cap_first} End");
		
		return AsyncResponseData.getSuccess(${objectName?lower_case}s);
	}
	
	/**
	 * 根据ID获取${objectName?lower_case}对象
	 * 
	 * @param ${objectName?lower_case}
	 * @throws Exception
	 */
	@RequestMapping(value = "/get${objectName?cap_first}ById", method = RequestMethod.POST)
	@ResponseBody
	public AsyncResponseData.ResultData get${objectName?cap_first}ById(String id) throws Exception{
		logger.info("获取${objectName?cap_first} Start");
		
		${objectName?cap_first} ${objectName?lower_case} = new ${objectName?cap_first}();
		
		${objectName?lower_case} = ${objectNameLower}Service.get${objectName?cap_first}ById(id);
		
		logger.info("获取${objectName?cap_first} End");
		
		return AsyncResponseData.getSuccess(${objectName?lower_case});
	}
	
}
