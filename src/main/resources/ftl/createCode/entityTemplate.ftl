package com.jy.moudles.${packageName}.entity;
<#list fieldList as var>
<#if var[4] == 'BigDecimal'>
import java.math.BigDecimal;
</#if>
<#if var[4] == 'Date'>
import java.util.Date;
</#if>
</#list>

import com.jy.common.entity.BaseEntity;

public class ${objectName?cap_first} extends BaseEntity{

	<#list fieldList as var>
	
	/**
	 * ${var[5]}
	 */
	private ${var[4]} ${var[3]};
	</#list>
	
	<#list fieldList as var>
	
	public ${var[4]} get${var[3]?cap_first}() {
		return ${var[3]};
	}

	public void set${var[3]?cap_first}(${var[4]} ${var[3]}) {
		this.${var[3]} = ${var[3]};
	}
	</#list>
	
}



