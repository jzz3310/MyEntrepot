package com.bw.server;

import java.util.List;

import com.bw.bean.Brand;
import com.bw.bean.Goods;
import com.bw.bean.Type;
import com.github.pagehelper.PageInfo;

public interface GoodsService {
	public PageInfo<Goods> query(Goods g,Integer pageNum);
	public List<Type> selType();
	public List<Brand> selBrand();
	public int addGoods(Goods g);
	public int delOne(Integer id);
	public Integer delAll(String id);
	public Goods selOne(Integer id);
	public Integer up(Goods g);
}
