<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.jy.moudles.${packageName}.dao.${objectName?cap_first}Dao">

	<resultMap id="BaseResultMap" type="com.jy.moudles.${packageName}.entity.${objectName?cap_first}">
        <id column="id" property="id" jdbcType="VARCHAR"/>
  		<#list fieldList as var>
		<result column="${var[0]}" property="${var[3]}" jdbcType="${var[1]?upper_case}"/>
		</#list>
		<result column="create_user" property="createUser" jdbcType="VARCHAR"/>
        <result column="create_date" property="createDate" jdbcType="TIMESTAMP"/>
        <result column="update_user" property="updateUser" jdbcType="VARCHAR"/>
        <result column="update_date" property="updateDate" jdbcType="TIMESTAMP"/>
    </resultMap>
    
    <sql id="Base_Column_List">
        id,<#list fieldList as var> ${var[0]},</#list> create_user, create_date, update_user, update_date
    </sql>
    
    <insert id="insert${objectName?cap_first}">
        INSERT INTO ${tableName?upper_case}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <if test="id != null">id,</if>
            <#list fieldList as var>
			<if test="${var[3]} != null">${var[0]},</if>
			</#list>
            <if test="createUser != null">create_user,</if>
            <if test="createDate != null">create_date,</if>
            <if test="updateUser != null">update_user,</if>
            <if test="updateDate != null">update_date,</if>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <if test="id != null">${r"#{"}id,jdbcType=VARCHAR${r"}"},</if>
            <#list fieldList as var>
			<if test="${var[3]} != null">${r"#{"}${var[3]}${r"}"},</if>
			</#list>
            <if test="createUser != null">${r"#{"}createUser,jdbcType=VARCHAR${r"}"},</if>
            <if test="createDate != null">${r"#{"}createDate,jdbcType=TIMESTAMP${r"}"},</if>
            <if test="updateUser != null">${r"#{"}updateUser,jdbcType=VARCHAR${r"}"},</if>
            <if test="updateDate != null">${r"#{"}updateDate,jdbcType=TIMESTAMP${r"}"},</if>
        </trim>
    </insert>
    
    <update id="update${objectName?cap_first}">
        update ${tableName?upper_case}
        <set>
        	 <#list fieldList as var>
			<if test="${var[3]} != null and '' != ${var[3]}">
				${var[0]} = ${r"#{"}${var[3]}${r"}"},
			</if>
			</#list>
            <if test="createUser != null and ''!=createUser">
                create_user = ${r"#{"}createUser,jdbcType=VARCHAR${r"}"},
            </if>
            <if test="createDate != null and ''!=createDate">
                create_date = ${r"#{"}createDate,jdbcType=TIMESTAMP${r"}"},
            </if>
            <if test="updateUser != null and ''!=updateUser">
                update_user = ${r"#{"}updateUser,jdbcType=VARCHAR${r"}"},
            </if>
            <if test="updateDate != null  and ''!=updateDate">
                update_date = ${r"#{"}updateDate,jdbcType=TIMESTAMP${r"}"},
            </if>
        </set>
        <where>
            <choose>
                <when test="id != null">
                    id = ${r"#{"}id${r"}"}
                </when>
            </choose>
        </where>
    </update>
    
    <select id="get${objectName?cap_first}ById" resultMap="BaseResultMap">
        SELECT
        <include refid="Base_Column_List"/>
        from `${tableName?upper_case}`
        WHERE id = ${r"#{"}id${r"}"}
    </select>
    
    <select id="query${objectName?cap_first}sFilter" resultMap="BaseResultMap">
        SELECT
        <include refid="Base_Column_List"/>
        from `${tableName?upper_case}`
        WHERE 1 = 1
        <#list fieldList as var>
			<if test="${var[3]} != null and '' != ${var[3]}">
				AND ${var[0]} = ${r"#{"}${var[3]}${r"}"}
			</if>
		</#list>
    </select>
    
    <delete id="delete${objectName?cap_first}ById" parameterType="java.lang.String">
        delete from `${tableName?upper_case}`
        where id = ${r"#{"}id${r"}"}
    </delete>
    
    <delete id="delete${objectName?cap_first}s" parameterType="java.lang.String">
        delete from `${tableName?upper_case}`
        where id IN 
        <foreach collection="list" item="id" index="index" separator="," open="(" close=")">
             ${r"#{"}id${r"}"}
        </foreach>
    </delete>
    
</mapper>