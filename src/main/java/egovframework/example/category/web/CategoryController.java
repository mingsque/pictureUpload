package egovframework.example.category.web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.example.category.service.CategoryService;
import egovframework.example.category.service.CategoryVO;
import egovframework.example.cmmn.JsonUtil;
import egovframework.example.util.Function;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class CategoryController {
   
	@Resource(name = "categoryService")
	private CategoryService categoryService;
	
   @RequestMapping(value = "manage/category/index.do")
   public String initMain(CategoryVO param, 
		   ModelMap model) throws Exception {
      System.out.println("..;");
	   
	  ArrayList<CategoryVO> list =
			  categoryService.getCategoryList(param);
	  
	  ArrayList<CategoryVO> smallList =
			  categoryService.getSmallCategoryList(param);
	  
	  model.addAttribute("list",		   list);
	  model.addAttribute("smallList", smallList);
	  
      return "manage/category/index.manage";
   }
   
   @RequestMapping(value = "manage/category/insert.do")
   public String insertCategory(CategoryVO param, 
		   ModelMap model) throws Exception {
      
	  int seq_no = categoryService.insertCategory(param);
	  
      return "redirect:/manage/category/index.do";
   }
   
   @RequestMapping(value = "manage/category/smallInsert.do")
   public String insertSmallCategory(CategoryVO param, 
		   ModelMap model) throws Exception {
      
	  int seq_no = categoryService.insertSmallCategory(param);
	  
      return "redirect:/manage/category/index.do";
   }
   
   @RequestMapping(value = "manage/category/categoryDelete.do")
   public void categoryDelete(CategoryVO param,
		   HttpServletResponse response) {
	   try {
		   
		PrintWriter out = null;
		
		response.setCharacterEncoding("UTF-8");
		 
		out = response.getWriter();
		
		categoryService.deleteCategory(param.getSeq_No());
		
		out.write(Function.makeAlertRedirect("삭제되었습니다.", "/manage/category/index.do"));
		
	   } catch(Exception err) {
		   
		   
	   }
   }
   
   @RequestMapping(value = "manage/category/smallCategoryDelete.do")
   public void smallCategoryDelete(CategoryVO param,
		   HttpServletResponse response) {
	   try {
		   
		PrintWriter out = null;
		
		response.setCharacterEncoding("UTF-8");
		 
		out = response.getWriter();
		
		categoryService.deleteSmallCategory(param.getSeq_No());
		
		out.write(Function.makeAlertRedirect("삭제되었습니다.", "/manage/category/index.do"));
		
	   } catch(Exception err) {
		   
		   
	   }
   }
   
   @RequestMapping(value = "manage/category/categoryUpdate.do")
   public void categoryUpdate(CategoryVO param,
		   HttpServletResponse response) {
	   try {
		   
		   PrintWriter out = null;
		   
		   response.setCharacterEncoding("UTF-8");
		   
		   out = response.getWriter();
		   
		   categoryService.updateCategory(param);
		   
		   out.write(Function.makeAlertRedirect("저장되었습니다.", "/manage/category/index.do"));
		   
	   } catch(Exception err) {
		   
		   
	   }
   }
   @RequestMapping(value = "manage/category/smallCategoryUpdate.do")
   public void smallCategoryUpdate(CategoryVO param,
		   HttpServletResponse response) {
	   try {
		   
		   PrintWriter out = null;
		   
		   response.setCharacterEncoding("UTF-8");
		   
		   out = response.getWriter();
		   
		   categoryService.updateSmallCategory(param);
		   
		   out.write(Function.makeAlertRedirect("저장되었습니다.", "/manage/category/index.do"));
		   
	   } catch(Exception err) {
		   
		   
	   }
   }
   
   @RequestMapping(value = "manage/category/parentCate.do")
   public void parentCate(CategoryVO param,
		   HttpServletResponse response) {
	   try {
		   
		   PrintWriter out = null;
		   
		   response.setCharacterEncoding("UTF-8");
		   
		   out = response.getWriter();
		   
		   ArrayList<CategoryVO> list =
					  categoryService.getCategoryList(param);
		   
		   String option = ""; 
		   
		   for(CategoryVO data : list){
			   option += Function.makeSelectOption(data.getSeq_No(),
					   		data.getCategory_Name());
		   }
		   
		   out.write(option);
		   
	   } catch(Exception err) {
		   
		   
	   }
   }
   
   @RequestMapping(value = "/cateList.do", method = RequestMethod.POST)
	public void cateList(HttpServletResponse response) throws Exception {
	   
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		try{
			 CategoryVO vo = new CategoryVO();
			 
			 ArrayList<CategoryVO> list =
					  categoryService.getCategoryListUsr(vo);
			 
			 ArrayList<CategoryVO> list2 =
					 categoryService.getSmallCategoryListUsr(vo);
			
			resMap.put("result", "SUCCESS");
			resMap.put("list", list);
			resMap.put("smallList", list2);
			
		} catch(Exception e){
			resMap.put("result", "FAIL");
		}
		
		PrintWriter out = null;
		
		response.setCharacterEncoding("UTF-8");
		
		out = response.getWriter();
	 
		out.write(JsonUtil.HashMapToJson(resMap));
		
	}
   
}