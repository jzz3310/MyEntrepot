package com.bw.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.bw.bean.Brand;
import com.bw.bean.Goods;
import com.bw.bean.Type;
import com.bw.server.GoodsService;
import com.github.pagehelper.PageInfo;
import com.util.FileUtils;

@Controller
public class GoodsController {
	@Autowired
	private GoodsService gs;
	
	@RequestMapping("query")
	public String query(Goods g,@RequestParam(defaultValue="1")Integer pageNum,Model model){
		PageInfo<Goods> page = gs.query(g, pageNum);
		model.addAttribute("page", page);
		model.addAttribute("g", g);
		return "list";
	}
	
	@RequestMapping("selTb")
	@ResponseBody
	public HashMap<String, Object> selTb(){
		List<Brand> brands = gs.selBrand();
		List<Type> types = gs.selType();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("brands", brands);
		map.put("types", types);
		return map;
	}
	
	@RequestMapping("add")
	@ResponseBody
	public Integer add(Goods g,@RequestParam("imgfile")CommonsMultipartFile cmf) throws Exception{
		String path = FileUtils.upload(cmf);
		g.setG_imgurl(path);
		int result = gs.addGoods(g);
		return result;
	}
	
	@RequestMapping("lookImg")
	public void lookImg(String path,HttpServletRequest request,HttpServletResponse response){
		FileUtils.lookImg(path, request, response);
	}
	
	@RequestMapping("delOne")
	@ResponseBody
	public Integer delOne(Integer id){
		System.out.println(id);
		int result = gs.delOne(id);
		return result;
	}
	
	@RequestMapping("delAll")
	@ResponseBody
	public Integer delAll(String id){
		Integer result = gs.delAll(id);
		return result;
	}
	
	@RequestMapping("toup")
	public String toup(Integer id,Model model){
		Goods g = gs.selOne(id);
		model.addAttribute("g", g);
		return "up";
	}
	
	@RequestMapping("up")
	@ResponseBody
	public Integer up(Goods g,@RequestParam("imgfile")CommonsMultipartFile cmf) throws IllegalStateException, IOException{
		String path = FileUtils.upload(cmf);
		g.setG_imgurl(path);
		Integer result = gs.up(g);
		return result;
	}
	
}
