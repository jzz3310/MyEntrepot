package com.bw.bean;

import java.io.Serializable;

public class Goods implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer g_id;
	private String g_name;
	private String g_nick;
	private Integer t_id;
	private Integer b_id;
	private Integer g_size;
	private Double g_price;
	private Integer g_num;
	private String g_label;
	private String g_imgurl;
	private String t_name;
	private String b_name;
	private Double start;
	private Double end;
	public Integer getG_id() {
		return g_id;
	}
	public void setG_id(Integer g_id) {
		this.g_id = g_id;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getG_nick() {
		return g_nick;
	}
	public void setG_nick(String g_nick) {
		this.g_nick = g_nick;
	}
	public Integer getT_id() {
		return t_id;
	}
	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}
	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public Integer getG_size() {
		return g_size;
	}
	public void setG_size(Integer g_size) {
		this.g_size = g_size;
	}
	public Double getG_price() {
		return g_price;
	}
	public void setG_price(Double g_price) {
		this.g_price = g_price;
	}
	public Integer getG_num() {
		return g_num;
	}
	public void setG_num(Integer g_num) {
		this.g_num = g_num;
	}
	public String getG_label() {
		return g_label;
	}
	public void setG_label(String g_label) {
		this.g_label = g_label;
	}
	public String getG_imgurl() {
		return g_imgurl;
	}
	public void setG_imgurl(String g_imgurl) {
		this.g_imgurl = g_imgurl;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	
	public Double getStart() {
		return start;
	}
	public void setStart(Double start) {
		this.start = start;
	}
	public Double getEnd() {
		return end;
	}
	public void setEnd(Double end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "Goods [g_id=" + g_id + ", g_name=" + g_name + ", g_nick=" + g_nick + ", t_id=" + t_id + ", b_id=" + b_id
				+ ", g_size=" + g_size + ", g_price=" + g_price + ", g_num=" + g_num + ", g_label=" + g_label
				+ ", g_imgurl=" + g_imgurl + ", t_name=" + t_name + ", b_name=" + b_name + ", start=" + start + ", end="
				+ end + "]";
	}
	
	
}
