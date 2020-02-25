package com.bw.bean;

import java.io.Serializable;

public class Brand implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer b_id;
	private String b_name;
	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	@Override
	public String toString() {
		return "Brand [b_id=" + b_id + ", b_name=" + b_name + "]";
	}
	
}
