package egovframework.example.manage.web;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.manage.service.ManageService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class ManageController {
	
	@Resource(name = "manageService")
	private ManageService manageService;

	@RequestMapping(value = "/manage/productRegist.do")
	
	public String productRegist(ModelMap model) throws Exception {
		
		List<EgovMap> bikeCategoryList = manageService.selectBikeCategoryList();
		
		System.out.println("mangeController");
		System.out.println(bikeCategoryList);
		
		model.addAttribute("bikeCategoryList", bikeCategoryList);
		
		return "manage/product/regist.manage";				
	}
	
		
	
	
	
   
   @RequestMapping(value = {"/manage/main.do", "/manage/index.do"})
   public String initMain(ModelMap model) throws Exception {

      return "manage/main/main.manage";
   }
} 