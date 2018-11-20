package egovframework.example.util;

public class Function {

	public static String makeAlertRedirect(String alertMsg, String redirectUrl){
		
		String str = "<script>"
						+ "alert('"+alertMsg+"');"
						+ "location.href='"+redirectUrl+"';"
					+ "</script>";
		return str;
	}
	
	public static String makeSelectOption(int value, String key){
		
		String str = "";
		
		str += "<option value='"+value+"'>"+key+"</option>";
		
		return str;
	}
	
	public static String rootPath() {
		
		String path = Function.class.getResource("").getPath();
		
		return path;
	}
}
