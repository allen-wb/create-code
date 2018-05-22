package com.jy.moudles.${packageName}.dao;

import java.util.List;
import java.util.Map;

import com.jy.moudles.${packageName}.entity.${objectName?cap_first};
import com.jy.common.persistence.annotation.MyBatisDao;

/** 
 * ${objectName}数据接口
 * 创建人：${createUser}
 * 创建时间：${nowDate?string("yyyy-MM-dd")}
 */
@MyBatisDao
public interface ${objectName?cap_first}Dao {

	/**
	 * 新增${objectName}对象
	 *
	 * @param ${objectName}
	 */
	public void insert${objectName?cap_first}(${objectName?cap_first} ${objectName});
	
	/**
	 * 更新${objectName}对象
	 *
	 * @param ${objectName}
	 */
	public void update${objectName?cap_first}(${objectName?cap_first} ${objectName});
	
	/**
	 * 根据ID获取${objectName}对象
	 *
	 * @param id
	 */
	public ${objectName?cap_first} get${objectName?cap_first}ById(String id);
	
	/**
	 * 根据过滤条件获取${objectName}列表对象
	 *
	 * @param filter
	 */
	public List<${objectName?cap_first}> query${objectName?cap_first}sFilter(Map<String, Object> filter);
	
	/**
	 * 根据Id删除${objectName}列表对象
	 *
	 * @param id
	 */
	public void delete${objectName?cap_first}ById(String id);
	
	/**
	 * 根据Id集合批量删除${objectName}列表对象
	 *
	 * @param ids
	 */
	public void delete${objectName?cap_first}s(List<String> ids);
	
}



