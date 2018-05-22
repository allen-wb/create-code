package com.example.createcode.entity;

import java.util.List;

/**
 * 生成代码信息
 * 
 * @author NancyJin
 *
 */
public class GenEntity {
	/**
	 * 生成表名称
	 */
	private String tableName;
	
	/**
	 * 生成对象名称
	 */
	private String objectName;
	
	/**
	 * 生成对象注释
	 */
	private String remark;
	
	/**
	 * 生成包名称
	 */
	private String packageName;
	
	private List<GenFiledsEntity> genFiledsEntities;

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public List<GenFiledsEntity> getGenFiledsEntities() {
		return genFiledsEntities;
	}

	public void setGenFiledsEntities(List<GenFiledsEntity> genFiledsEntities) {
		this.genFiledsEntities = genFiledsEntities;
	}
	
}
