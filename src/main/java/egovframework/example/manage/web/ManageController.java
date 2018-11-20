package egovframework.example.manage.web;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManageController {
   
   @RequestMapping(value = {"/manage/main.do", "/manage/index.do"})
   public String initMain(ModelMap model) throws Exception {

      return "manage/main/main.manage";
   }
} 