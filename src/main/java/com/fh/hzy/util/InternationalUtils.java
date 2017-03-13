package com.fh.hzy.util;

import org.springframework.web.servlet.ModelAndView;

import com.fh.service.slight.language.InternationalService;
import com.fh.util.PageData;

public class InternationalUtils {
	
	
	public static String getLanguage(InternationalService service, PageData pd)throws Exception{
		String result = "";
		String language = service.getLanguage(pd).getString("language");
		if(language.equals("1")){
			result = "zh_CN";
		}else if(language.equals("2")){
			result = "en_US";
		}
		System.out.println(result);
		return result;
	}
}
