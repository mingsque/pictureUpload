package egovframework.example.main.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
   
   @RequestMapping(value = "main.do")
   public String initMain(ModelMap model) throws Exception {
      
      return "main/main.tiles";
   }
}