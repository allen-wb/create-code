package com.example.createcode.common.utils;


public class PublicUtil {

	public static String getPorjectPath() {
		String nowpath = "";
		nowpath = System.getProperty("user.dir") + "/";
		return nowpath;
	}
}