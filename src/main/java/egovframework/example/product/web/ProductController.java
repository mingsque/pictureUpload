package egovframework.example.product.web;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.category.service.CategoryService;
import egovframework.example.category.service.CategoryVO;
import egovframework.example.cmmn.JsonUtil;
import egovframework.example.product.service.ProductService;
import egovframework.example.product.service.ProductVO;
import egovframework.example.util.FileManager;
import egovframework.example.util.Function;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class ProductController {
   
	@Resource(name = "productService")
	private ProductService productService;
	
   @RequestMapping(value = "manage/product/index.do")
   public String initMain(ModelMap model, 
		   ProductVO param) throws Exception {
     
	  ArrayList<ProductVO> productList = 
			  productService.getProductList(param);
	  
	  model.addAttribute("productList", productList);
	  
      return "manage/product/index.manage";
   }
   
   @RequestMapping(value = "manage/product/write.do")
   public String writePage(ModelMap model) throws Exception {
	   
	   return "manage/product/write.manage";
   }
   
   @RequestMapping(value = "manage/product/insert.do")
   public String insertProcess( MultipartHttpServletRequest request,
		   	ModelMap model) throws Exception {
	   
	   ProductVO param = new ProductVO();
	   
	   param = (ProductVO)FileManager.FileUpload(request,"product", param);

	   int r = productService.insertProduct(param);
	   
	   return "redirect:/manage/product/index.do";
   }
   
   @RequestMapping(value = "manage/product/read.do")
   public String readProduct( @Parameter int no,
		   ModelMap model) throws Exception {
	   
	   ProductVO param = productService.readProduct(no);
	   
	   model.addAttribute("productVO", param);
	   
	   return "manage/product/read.manage";
   }
   
   
}