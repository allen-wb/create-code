package com.example.createcode.entity;

/**
 * 生成字段
 * 
 * @author NancyJin
 *
 */
public class GenFiledsEntity {
	/**
	 * 列名
	 */
	private String columnName;
	
	/**
	 * 备注
	 */
	private String remark;
	
	/**
	 * 类型
	 */
	private String columnType;
	
	/**
	 * 默认值
	 */
	private String columnDefault;
	
	/**
	 * java类型 0--String、1--int、2--Date、3--Bigdecimal
	 */
	private String javaType;
	
	/**
	 * java属性名称
	 */
	private String javaProprety;
	
	/**
	 * 是否是主键 0是；1否
	 */
	private int primaryKey;
	
	/**
	 * 是否允许为null 0是；1否
	 */
	private int required;
	
	/**
	 * 是否可插入 0是；1否
	 */
	private int insert;
	
	/**
	 * 是否可编辑 0是；1否
	 */
	private int edit;
	
	/**
	 * 是否显示在列表中 0是；1否
	 */
	private int list;
	
	/**
	 * 是否显示查询条件 0是；1否
	 */
	private int query;
	
	/**
	 * 查询类型 0 代表 【=】、1代表 【between】时间属性和数值范围 、2代表【like】
	 */
	private String queryType;

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getColumnType() {
		return columnType;
	}

	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}

	public String getColumnDefault() {
		return columnDefault;
	}

	public void setColumnDefault(String columnDefault) {
		this.columnDefault = columnDefault;
	}

	public String getJavaType() {
		return javaType;
	}

	public void setJavaType(String javaType) {
		this.javaType = javaType;
	}

	public String getJavaProprety() {
		return javaProprety;
	}

	public void setJavaProprety(String javaProprety) {
		this.javaProprety = javaProprety;
	}

	public int getPrimaryKey() {
		return primaryKey;
	}

	public void setPrimaryKey(int primaryKey) {
		this.primaryKey = primaryKey;
	}

	public int getRequired() {
		return required;
	}

	public void setRequired(int required) {
		this.required = required;
	}

	public int getInsert() {
		return insert;
	}

	public void setInsert(int insert) {
		this.insert = insert;
	}

	public int getEdit() {
		return edit;
	}

	public void setEdit(int edit) {
		this.edit = edit;
	}

	public int getList() {
		return list;
	}

	public void setList(int list) {
		this.list = list;
	}

	public int getQuery() {
		return query;
	}

	public void setQuery(int query) {
		this.query = query;
	}

	public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}
	
}
