package egovframework.example.login.web;

import java.io.File;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.SecureRandom;
import java.security.spec.RSAPublicKeySpec;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.login.service.LoginService;
import egovframework.example.login.service.UserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class LoginController {

	@Resource(name = "loginService")
	private LoginService loginService;
	
	public String generateState() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}
	
	@RequestMapping("naverLogin.do")
	public String naverLogin(HttpServletRequest request) throws Exception {	
		String state = generateState();
		
		HttpSession session = request.getSession(true);
		
		session.setAttribute("state", state);
		
		//https://nid.naver.com/oauth2.0/authorize?client_id={r14rSMxA9PqN4lYWKvmg}&response_type=code&redirect_uri={127.0.0.1/main.do}&state={state}
		return "";
	}
	
	@RequestMapping("login.do")
	public String login(HttpServletRequest request, ModelMap model) throws Exception {
	
		System.out.println("login.do");
		
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		
		generator.initialize(1024);
		
		KeyPair keyPair = generator.genKeyPair();
	
		HttpSession session = request.getSession(true);
		
		session.setAttribute("RSA_PRIVATE_KEY", keyPair.getPrivate());
		
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec)keyFactory.getKeySpec(keyPair.getPublic(), RSAPublicKeySpec.class);
		
		String publicKeyModulus	 = publicSpec.getModulus().toString(16);
	    String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
	    
	    System.out.println(publicKeyModulus);
	    System.out.println(publicKeyExponent);
	    
	    //model2에서 setAttribute하면 어캐되냐
	    String errorMessage = (String)session.getAttribute("error");
	   
	    model.addAttribute("RSAModulus", publicKeyModulus);
	    model.addAttribute("RSAExponent", publicKeyExponent);
	    
		return "login/login.tiles";
	}
	
	public static byte[] hexToByteArray(String hex) {
		if (hex == null || hex.length() % 2 != 0) {
			return new byte[] {};
		}

		byte[] bytes = new byte[hex.length() / 2];
		for (int i = 0; i < hex.length(); i += 2) {
			byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
			bytes[(int) Math.floor(i / 2)] = value;
		}
		return bytes;
	}

	@RequestMapping("loginAction.do")
	public String loginResult(
			HttpServletRequest request,
			@RequestParam(required=false, value="inputId") String id, 
			@RequestParam(required=false, value="inputPassword") String password,
			ModelMap model ) throws Exception {
		
		List<UserVO> userList = loginService.selectLoginResultList();
		UserVO user = null;
	
		System.out.println(id);
		System.out.println(password);
		
		HttpSession session = request.getSession(true);
		PrivateKey privateKey = (PrivateKey)session.getAttribute("RSA_PRIVATE_KEY");
		
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		
		byte[] encryptedBytesId = hexToByteArray(id);
		byte[] encryptedBytesPassword = hexToByteArray(password);
		
	    byte[] decryptedBytesId = cipher.doFinal(encryptedBytesId);
	    byte[] decryptedBytesPassword = cipher.doFinal(encryptedBytesPassword);
	    
	    id = new String(decryptedBytesId, "utf-8");
	    password = new String(decryptedBytesPassword, "utf-8");
		
		boolean idCheck 		= false,
				passwordCheck	= false;
		
		for (UserVO temp : userList) {
			
			idCheck = temp.getId().equals(id);
			
			if(idCheck == true){
				user = temp;
				passwordCheck = temp.getPassword().equals(password);
				break;
			}
		}
		
		String result = "";
		
		if ( idCheck == true && passwordCheck == true ) {
			session.setAttribute("name", user.getName());
			session.setAttribute("id", user.getId());
			
			session.setAttribute("error", "");
			
			result = "redirect:/main.do";
			
		} else if( idCheck == false ) {
			session.setAttribute("error", "해당하는 아이디가 없습니다.");
		
			result = "login/login.tiles";
		} else if( idCheck == true && passwordCheck == false ) {
			session.setAttribute("error", "패스워드가 틀렸습니다.");
			
			result = "login/login.tiles";
		} 
		
		return result;
		
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		session.invalidate();
	
		return "main/main.tiles";
	}
	
	@RequestMapping("register.do")
	public String register() {

		return "login/register.tiles";
	}

	@RequestMapping("modify.do")
	public String modify(HttpServletRequest request, ModelMap model) throws Exception {
		
		HttpSession session = request.getSession(false);
		String id;
		UserVO userInfo = null;
		
		if(session != null) {
			id = session.getAttribute("id").toString();
			userInfo = loginService.selectUserInfo(id);	
		}
		
		model.addAttribute("userInfo", userInfo);
		
		System.out.println(userInfo);
		
		return "login/modify.tiles";
	}

	//회원가입 userVO사용하였음.
	//뷰에서 올라오는 폼의 name과 vo의 변수명이 매칭되어야함
	//vo는 초기화가 가능하므로 null에 대한 처리를  vo에서 할 수 있을것
	@RequestMapping("registerAction.do")
	public String registerResult(MultipartHttpServletRequest request, ModelMap model)	throws Exception {
		//String filename = uservo.getProfile_picture();
		System.out.println("before");
		String path = "C:\\";
		File folder = new File(path, "myShoppingUpload");

		Map<String, String> param = new HashMap();
		
		Enumeration names = request.getParameterNames();
		
		while(names.hasMoreElements()){
			String name = names.nextElement().toString();
			System.out.println(name);
			System.out.println(request.getParameter(name));
			param.put(name, request.getParameter(name));
		}
		
		//폴더나 파일이 있는지 확인
		if (!folder.exists()) {
			try{

				folder.mkdir();
			} catch(Exception e){
				
				e.getStackTrace();
			}
		}
		MultipartFile file	= request.getFile("profile_picture");
		UUID uniqueCode		= UUID.randomUUID();
		String filename 	= uniqueCode + " " + file.getOriginalFilename();
		
		System.out.println("middle");
		try {
			
			File saveFile = new File(path, "myShoppingUpload\\"+filename);
			file.transferTo(saveFile);
			System.out.println(saveFile.getAbsolutePath());
		} catch(Exception e) {
			
			e.printStackTrace();
		}
		param.put("profile_picture","uploaded//" + filename);
		//System.out.println(uservo.toString());
		loginService.selectRegisterResultService(param);
		
		System.out.println("after");
		return "redirect:/login.do";
	}
	
	@RequestMapping("modifyAction.do")
	public String modifyResult(MultipartHttpServletRequest request,  ModelMap model) throws Exception {

		
		System.out.println("modifyAction");
		String path = "C:\\";
		File folder = new File(path, "myShoppingUpload");

		Map<String, String> param = new HashMap();
		Enumeration names = request.getParameterNames();
		
		while(names.hasMoreElements()){
			String name = names.nextElement().toString();
			System.out.println(name);
			System.out.println(request.getParameter(name));
			param.put(name, request.getParameter(name));
		}
		
		//폴더나 파일이 있는지 확인
		if (!folder.exists()) {
			try{

				folder.mkdir();
			} catch(Exception e){
				
				e.getStackTrace();
			}
		}
		
		System.out.println(request.getFile("profile_picture") + "======================");
		
		MultipartFile file	= request.getFile("profile_picture");
		
		param.put("profile_picture", null);
		
		if(!file.isEmpty()){
			UUID uniqueCode		= UUID.randomUUID();
			String filename 	= uniqueCode + " " + file.getOriginalFilename();
			
			try {
				
				File saveFile = new File(path, "myShoppingUpload\\"+filename);
				file.transferTo(saveFile);
				System.out.println(saveFile.getAbsolutePath());
			} catch(Exception e) {
				
				e.printStackTrace();
			}
			
			param.put("profile_picture","uploaded//" + filename);
		}
		
		loginService.updateUserInfo(param);
		
		return "redirect:/main.do";
	}


	@RequestMapping("idDuplicateCheck.do") 
	public void idDuplicateCheck(@RequestBody String reqParam,
								HttpServletRequest request,
								HttpServletResponse response) throws Exception {	
		//유저아이디
		List<EgovMap> userIdList = loginService.selectRegisterResultServiceList();

		boolean duplicateIdCheck = true;
		
		Map<String, Object> resMap = JsonUtil.JsonToMap(reqParam);;
			
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		for (EgovMap userid : userIdList) {

			if (userid.get("id").equals(resMap.get("id")) == true) {
				
				duplicateIdCheck = false;
			}
		}
				
		if (duplicateIdCheck == true) {
			resultMap.put("result", "SUCCESS");
		} else {
			resultMap.put("result", "FALSE");
		}
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.write(JsonUtil.HashMapToJson(resultMap));
	}	
}
