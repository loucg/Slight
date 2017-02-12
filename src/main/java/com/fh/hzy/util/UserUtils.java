package com.fh.hzy.util;

import com.fh.entity.system.User;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;

public class UserUtils {
	public static String getUserid(){
		User user = (User)Jurisdiction.getSession().getAttribute(Const.SESSION_USER);
		System.out.println("userid:"+user.getUSER_ID());
		return user.getUSER_ID();
	}
}
