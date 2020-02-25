package com.bw.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bw.bean.Brand;
import com.bw.bean.Goods;
import com.bw.bean.Type;

public interface UserMapper {
	public List<Goods> query(Goods g);
	public List<Type> selType();
	public List<Brand> selBrand();
	public int addGoods(Goods g);
	public int delOne(Integer id);
	public Integer delAll(@Param("id")String id);
	public Goods selOne(Integer id);
	public Integer up(Goods g);
}
