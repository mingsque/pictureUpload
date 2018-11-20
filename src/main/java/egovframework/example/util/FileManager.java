package egovframework.example.util;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.util.Enumeration;
import java.util.Iterator;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileManager {
	/**
	 * FileUpload 
	 * 반환타입 무조건 VO 
	 * 멀티파트로 받아온 리퀘스트 에서 타입속성값 file 인 것만 열거형 인터페이스로 
	 * 정리하여 VO 에 set 해줘 전달.
	 * @param request
	 * @param folder
	 * @param obj
	 * @return
	 */
	public static Object FileUpload (MultipartHttpServletRequest request,
			String folder, Object obj) {
			
		Iterator<String> iter = request.getFileNames();
			
		while(iter.hasNext()){
			String key = iter.next();
			MultipartFile file1 = request.getFile(key);
			
			String filename 	 = file1.getOriginalFilename();
			String filename_save = System.currentTimeMillis()+"_"+filename;
			
			File savefile1 = new File( request.getRealPath("/upload") + "/"+folder+"/"+ filename_save);

			try {
				if(filename != null){
					file1.transferTo( savefile1 );
					org.apache.commons.beanutils.BeanUtils.setProperty(obj, key, filename_save);
				} else {
					org.apache.commons.beanutils.BeanUtils.setProperty(obj, key, "");
				}
			} catch(Exception e) {
			  System.out.println(e);
			}
		}
		
		Enumeration<String> enumer = request.getParameterNames();
		
		while(enumer.hasMoreElements()){
			String key	 = enumer.nextElement();
			String value = request.getParameter(key);
			try {
				org.apache.commons.beanutils.BeanUtils.setProperty(obj, key, value);
			} catch (Exception e){
				System.out.println(e);
			}
		}
		
		return obj;
		
	}
}
