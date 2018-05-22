package com.jy.moudles.${packageName}.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.jy.common.utils.UUIDUtil;
import com.jy.moudles.${packageName}.dao.${objectName?cap_first}Dao;
import com.jy.moudles.${packageName}.entity.${objectName?cap_first};
import com.jy.moudles.${packageName}.service.${objectName?cap_first}Service;

/** 
 * ${objectName}业务实现类
 * 创建人：${createUser}
 * 创建时间：${nowDate?string("yyyy-MM-dd")}
 */
@Service
public class ${objectName?cap_first}ServiceImpl implements ${objectName?cap_first}Service {

	@Autowired
	private ${objectName?cap_first}Dao ${objectName}Dao;
	
	@Override
	public void insert${objectName?cap_first}(${objectName?cap_first} ${objectName}){
		${objectName}.setId(UUIDUtil.get32UUID());
		${objectName}Dao.insert${objectName?cap_first}(${objectName});
	}
	
	@Override
	public void update${objectName?cap_first}(${objectName?cap_first} ${objectName}){
		${objectName}Dao.update${objectName?cap_first}(${objectName});
	}
	
	@Override
	public ${objectName?cap_first} get${objectName?cap_first}ById(String id){
		return ${objectName}Dao.get${objectName?cap_first}ById(id);
	}
	
	@Override
	public List<${objectName?cap_first}> query${objectName?cap_first}sFilter(Map<String, Object> filter){
		return ${objectName}Dao.query${objectName?cap_first}sFilter(filter);
	}
	
	@Override
	public void delete${objectName?cap_first}ById(String id){
		${objectName}Dao.delete${objectName?cap_first}ById(id);
	}
	
	@Override
	public void delete${objectName?cap_first}s(List<String> ids){
		${objectName}Dao.delete${objectName?cap_first}s(ids);
	}
	
}

