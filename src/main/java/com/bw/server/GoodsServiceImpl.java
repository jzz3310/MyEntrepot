package com.bw.server;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.bean.Brand;
import com.bw.bean.Goods;
import com.bw.bean.Type;
import com.bw.mapper.UserMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private UserMapper um;

	@Override
	public PageInfo<Goods> query(Goods g, Integer pageNum) {
		PageHelper.startPage(pageNum, 2);
		PageInfo<Goods> page = new PageInfo<Goods>(um.query(g));
		return page;
	}

	@Override
	public List<Type> selType() {
		return um.selType();
	}

	@Override
	public List<Brand> selBrand() {
		return um.selBrand();
	}

	@Override
	public int addGoods(Goods g) {
		return um.addGoods(g);
	}

	@Override
	public int delOne(Integer id) {
		return um.delOne(id);
	}

	@Override
	public Integer delAll(String id) {
		return um.delAll(id);
	}

	@Override
	public Goods selOne(Integer id) {
		return um.selOne(id);
	}

	@Override
	public Integer up(Goods g) {
		return um.up(g);
	}
	
	
	
	
}
