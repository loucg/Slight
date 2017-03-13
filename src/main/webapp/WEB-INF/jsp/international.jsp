<%@page import="java.util.Properties"%>  
<%@page import="java.io.FileInputStream"%>  
<%@page import="java.io.FileNotFoundException" %>
<%@page import="java.io.IOException" %>
<% 
//国际化
	String language = (String)session.getAttribute("session_language"); 
	Properties properties = new Properties();
	try {
		FileInputStream fis = new FileInputStream(this.getClass().getClassLoader().getResource("/").getPath()+"slight_"+language+".properties");
		try {
			properties.load(fis);
			fis.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("没找到");
	} 
	
	String app_explain = properties.getProperty("app_explain");
	String enter_contact_address_here = properties.getProperty("enter_contact_address_here");
	String invalid = properties.getProperty("invalid");
	String circuit_breaker = properties.getProperty("circuit_breaker");
	String please_upload_xls_file = properties.getProperty("please_upload_xls_file");
	String open_light = properties.getProperty("open_light");
	String please_type_device_name = properties.getProperty("please_type_device_name");
	String arrears = properties.getProperty("arrears");
	String power_rate = properties.getProperty("power_rate");
	String total_time = properties.getProperty("total_time");
	String wait_start_use = properties.getProperty("wait_start_use");
	String divide_group_setting = properties.getProperty("divide_group_setting");
	String address = properties.getProperty("address");
	String road_light_open_faliue = properties.getProperty("road_light_open_faliue");
	String app_list = properties.getProperty("app_list");
	String repair_register = properties.getProperty("repair_register");
	String over_temperature = properties.getProperty("over_temperature");
	String strategy_name = properties.getProperty("strategy_name");
	String please_enter_standard_name = properties.getProperty("please_enter_standard_name");
	String account_infomation = properties.getProperty("account_infomation");
	String strategy = properties.getProperty("strategy");
	String please_choose_device_type = properties.getProperty("please_choose_device_type");
	String please_enter_app_explain = properties.getProperty("please_enter_app_explain");
	String please_choose_charactor = properties.getProperty("please_choose_charactor");
	String test = properties.getProperty("test");
	String function_Brief = properties.getProperty("function_Brief");
	String status = properties.getProperty("status");
	String normal = properties.getProperty("normal");
	String cancel = properties.getProperty("cancel");
	String group_explain = properties.getProperty("group_explain");
	String odd = properties.getProperty("odd");
	String odd_and_even_day = properties.getProperty("odd_and_even_day");
	String please_enter_strategy_name = properties.getProperty("please_enter_strategy_name");
	String gateway = properties.getProperty("gateway");
	String menber_number = properties.getProperty("menber_number");
	String company_location = properties.getProperty("company_location");
	String lamp_short = properties.getProperty("lamp_short");
	String device_name = properties.getProperty("device_name");
	String make_sure_adjust_brightness = properties.getProperty("make_sure_adjust_brightness");
	String road_light_has_shut_status = properties.getProperty("road_light_has_shut_status");
	String log_name = properties.getProperty("log_name");
	String choose = properties.getProperty("choose");
	String smart_divide_group_by_odd_and_even = properties.getProperty("smart_divide_group_by_odd_and_even");
	String total = properties.getProperty("total");
	String device_number = properties.getProperty("device_number");
	String none = properties.getProperty("none");
	String strategy_adjust = properties.getProperty("strategy_adjust");
	String device_group_number = properties.getProperty("device_group_number");
	String edit = properties.getProperty("edit");
	String strategy_manage = properties.getProperty("strategy_manage");
	String committing = properties.getProperty("committing");
	String gateway_name = properties.getProperty("gateway_name");
	String this_group_can_not_divide_by_power = properties.getProperty("this_group_can_not_divide_by_power");
	String reset_password = properties.getProperty("reset_password");
	String power_rate_factor = properties.getProperty("power_rate_factor");
	String enter_the_department_here = properties.getProperty("enter_the_department_here");
	String type = properties.getProperty("type");
	String jiebu = properties.getProperty("jiebu");
	String longitude = properties.getProperty("longitude");
	String add_strategy = properties.getProperty("add_strategy");
	String brightness_level = properties.getProperty("brightness_level");
	String road_light_brightness_update_success = properties.getProperty("road_light_brightness_update_success");
	String temporary_no_data = properties.getProperty("temporary_no_data");
	String phone_number = properties.getProperty("phone_number");
	String gateway_or_circuit_breaker_exception = properties.getProperty("gateway_or_circuit_breaker_exception");
	String enter_new_password = properties.getProperty("enter_new_password");
	String open_road = properties.getProperty("open_road");
	String explain_item = properties.getProperty("explain_item");
	String please_choose = properties.getProperty("please_choose");
	String effective = properties.getProperty("effective");
	String please_enter_vendor = properties.getProperty("please_enter_vendor");
	String short_circuit = properties.getProperty("short_circuit");
	String group_member = properties.getProperty("group_member");
	String phone = properties.getProperty("phone");
	String contact_address = properties.getProperty("contact_address");
	String enter_old_password = properties.getProperty("enter_old_password");
	String make_sure_divider_group_by_odd_and_even = properties.getProperty("make_sure_divider_group_by_odd_and_even");
	String superior_department = properties.getProperty("superior_department");
	String functional_classification = properties.getProperty("functional_classification");
	String please_enter_company_name = properties.getProperty("please_enter_company_name");
	String please_enter_repire_explain = properties.getProperty("please_enter_repire_explain");
	String LOGO = properties.getProperty("LOGO");
	String company = properties.getProperty("company");
	String enter_the_department_name_here = properties.getProperty("enter_the_department_name_here");
	String please_choose_a_statistical_type = properties.getProperty("please_choose_a_statistical_type");
	String road_light_brightness_update_faliue = properties.getProperty("road_light_brightness_update_faliue");
	String no_relevant_data = properties.getProperty("no_relevant_data");
	String road_light_shut_down_faliue = properties.getProperty("road_light_shut_down_faliue");
	String please_enter_register = properties.getProperty("please_enter_register");
	String brightness_value = properties.getProperty("brightness_value");
	String repair_time = properties.getProperty("repair_time");
	String even = properties.getProperty("even");
	String print_voltage = properties.getProperty("print_voltage");
	String statistical_type = properties.getProperty("statistical_type");
	String visitor = properties.getProperty("visitor");
	String blockout_time = properties.getProperty("blockout_time");
	String deadline = properties.getProperty("deadline");
	String name = properties.getProperty("name");
	String smart_divide_group_by_power = properties.getProperty("smart_divide_group_by_power");
	String english = properties.getProperty("english");
	String make_sure = properties.getProperty("make_sure");
	String please_choose_picture = properties.getProperty("please_choose_picture");
	String brightness_percent = properties.getProperty("brightness_percent");
	String enter_position_here = properties.getProperty("enter_position_here");
	String enter_company_contact_here = properties.getProperty("enter_company_contact_here");
	String enter_email_here = properties.getProperty("enter_email_here");
	String energy_status = properties.getProperty("energy_status");
	String modify = properties.getProperty("modify");
	String please_enter_phone = properties.getProperty("please_enter_phone");
	String shut_down_light = properties.getProperty("shut_down_light");
	String menber_list = properties.getProperty("menber_list");
	String make_sure_divider_open_light = properties.getProperty("make_sure_divider_open_light");
	String lamp_open_circuit = properties.getProperty("lamp_open_circuit");
	String up_and_down_electricity = properties.getProperty("up_and_down_electricity");
	String gateway_status = properties.getProperty("gateway_status");
	String shut_down = properties.getProperty("shut_down");
	String function_key = properties.getProperty("function_key");
	String please_choose_the_superior_department = properties.getProperty("please_choose_the_superior_department");
	String summary = properties.getProperty("summary");
	String add_divide_group = properties.getProperty("add_divide_group");
	String start_time = properties.getProperty("start_time");
	String super_manager = properties.getProperty("super_manager");
	String account_manage = properties.getProperty("account_manage");
	String unregister_mobile = properties.getProperty("unregister_mobile");
	String password = properties.getProperty("password");
	String make_sure_divider_group_by_power = properties.getProperty("make_sure_divider_group_by_power");
	String end_time = properties.getProperty("end_time");
	String charactor = properties.getProperty("charactor");
	String enter_company_name_here = properties.getProperty("enter_company_name_here");
	String please_choose_fault_type = properties.getProperty("please_choose_fault_type");
	String maintenance_man = properties.getProperty("maintenance_man");
	String normal_cutoff_device = properties.getProperty("normal_cutoff_device");
	String belong_gateway = properties.getProperty("belong_gateway");
	String over_voltage = properties.getProperty("over_voltage");
	String operate = properties.getProperty("operate");
	String export_to_excel = properties.getProperty("export_to_excel");
	String light_standard = properties.getProperty("light_standard");
	String single_light_controller = properties.getProperty("single_light_controller");
	String light_ratio = properties.getProperty("light_ratio");
	String department_description = properties.getProperty("department_description");
	String gateway_location = properties.getProperty("gateway_location");
	String schedule_adjust_brightness = properties.getProperty("schedule_adjust_brightness");
	String work_status = properties.getProperty("work_status");
	String group_name = properties.getProperty("group_name");
	String enter_function_key_here = properties.getProperty("enter_function_key_here");
	String please_type_device_number = properties.getProperty("please_type_device_number");
	String kick_delete = properties.getProperty("kick_delete");
	String repair_instructions = properties.getProperty("repair_instructions");
	String vendor = properties.getProperty("vendor");
	String no_permission = properties.getProperty("no_permission");
	String integration_power = properties.getProperty("integration_power");
	String gateway_anomaly = properties.getProperty("gateway_anomaly");
	String none_this_department_is_top = properties.getProperty("none_this_department_is_top");
	String wrong_search = properties.getProperty("wrong_search");
	String location = properties.getProperty("location");
	String change = properties.getProperty("change");
	String time = properties.getProperty("time");
	String make_sure_shut_down_light = properties.getProperty("make_sure_shut_down_light");
	String road_light_open_success = properties.getProperty("road_light_open_success");
	String number = properties.getProperty("number");
	String position = properties.getProperty("position");
	String delete = properties.getProperty("delete");
	String abnormal_lamp = properties.getProperty("abnormal_lamp");
	String not_divide_group = properties.getProperty("not_divide_group");
	String keck_delete_app_group = properties.getProperty("keck_delete_app_group");
	String manager = properties.getProperty("manager");
	String comment = properties.getProperty("comment");
	String success_delete = properties.getProperty("success_delete");
	String voltage = properties.getProperty("voltage");
	String download_wrong_please_refresh = properties.getProperty("download_wrong_please_refresh");
	String electricity_time = properties.getProperty("electricity_time");
	String date = properties.getProperty("date");
	String road_light_has_open_status = properties.getProperty("road_light_has_open_status");
	String up_electricity_time = properties.getProperty("up_electricity_time");
	String total_days = properties.getProperty("total_days");
	String exception = properties.getProperty("exception");
	String blockout = properties.getProperty("blockout");
	String repair_result = properties.getProperty("repair_result");
	String month = properties.getProperty("month");
	String company_name = properties.getProperty("company_name");
	String circle_select = properties.getProperty("circle_select");
	String enter_company_location_here = properties.getProperty("enter_company_location_here");
	String electricity_set = properties.getProperty("electricity_set");
	String set_up_and_down_electricity_time = properties.getProperty("set_up_and_down_electricity_time");
	String stop_mobile = properties.getProperty("stop_mobile");
	String add_app_select = properties.getProperty("add_app_select");
	String enter_function_values_here = properties.getProperty("enter_function_values_here");
	String road_light_exception = properties.getProperty("road_light_exception");
	String time_for_24hour = properties.getProperty("time_for_24hour");
	String ex_24_hours = properties.getProperty("ex_24_hours");
	String this_strategy_not_assign_app_group = properties.getProperty("this_strategy_not_assign_app_group");
	String search_get_device = properties.getProperty("search_get_device");
	String strate_control = properties.getProperty("strate_control");
	String enter_function_Brief_here = properties.getProperty("enter_function_Brief_here");
	String time_and_brightness_2 = properties.getProperty("time_and_brightness_2");
	String reset = properties.getProperty("reset");
	String make_sure_up_and_down_electricity_for_select_device = properties.getProperty("make_sure_up_and_down_electricity_for_select_device");
	String save = properties.getProperty("save");
	String undervoltage = properties.getProperty("undervoltage");
	String this_group_can_not_divide_odd_and_even = properties.getProperty("this_group_can_not_divide_odd_and_even");
	String userinfo = properties.getProperty("userinfo");
	String please_choose_department = properties.getProperty("please_choose_department");
	String coordinate = properties.getProperty("coordinate");
	String energy_consumption = properties.getProperty("energy_consumption");
	String pole = properties.getProperty("pole");
	String pole_number = properties.getProperty("pole_number");
	String new_password = properties.getProperty("new_password");
	String self_prepare = properties.getProperty("self_prepare");
	String please_choose_brightness = properties.getProperty("please_choose_brightness");
	String download_model = properties.getProperty("download_model");
	String fault_type = properties.getProperty("fault_type");
	String please_choose_status = properties.getProperty("please_choose_status");
	String standard = properties.getProperty("standard");
	String please_upload_picture_format_file = properties.getProperty("please_upload_picture_format_file");
	String please_choose_language = properties.getProperty("please_choose_language");
	String brightness_adjust = properties.getProperty("brightness_adjust");
	String latitude = properties.getProperty("latitude");
	String chinese = properties.getProperty("chinese");
	String please_choose_if_display_LOGO = properties.getProperty("please_choose_if_display_LOGO");
	String if_display_LOGO = properties.getProperty("if_display_LOGO");
	String please_enter_time_for_24hour = properties.getProperty("please_enter_time_for_24hour");
	String modify_information = properties.getProperty("modify_information");
	String old_password = properties.getProperty("old_password");
	String no = properties.getProperty("no");
	String enter_function_classification_here = properties.getProperty("enter_function_classification_here");
	String add_group_member2 = properties.getProperty("add_group_member2");
	String add_group_member1 = properties.getProperty("add_group_member1");
	String sensor_standard = properties.getProperty("sensor_standard");
	String enter_phone_number_here = properties.getProperty("enter_phone_number_here");
	String enter_person_name_here = properties.getProperty("enter_person_name_here");
	String exception_description = properties.getProperty("exception_description");
	String road_light_status = properties.getProperty("road_light_status");
	String serial_number = properties.getProperty("serial_number");
	String choose_strategy = properties.getProperty("choose_strategy");
	String search_seccess_please_look_light_list2_on_left = properties.getProperty("search_seccess_please_look_light_list2_on_left");
	String app_group_has_assigned = properties.getProperty("app_group_has_assigned");
	String registrant = properties.getProperty("registrant");
	String department_name = properties.getProperty("department_name");
	String please_enter_pole_number = properties.getProperty("please_enter_pole_number");
	String jump_to_strategy_control_page = properties.getProperty("jump_to_strategy_control_page");
	String make_sure_delete_picture = properties.getProperty("make_sure_delete_picture");
	String person_name = properties.getProperty("person_name");
	String please_enter_contact = properties.getProperty("please_enter_contact");
	String search2 = properties.getProperty("search2");
	String control_strategy = properties.getProperty("control_strategy");
	String search1 = properties.getProperty("search1");
	String voltage_exception = properties.getProperty("voltage_exception");
	String add2 = properties.getProperty("add2");
	String make_sure_adjust_strategy = properties.getProperty("make_sure_adjust_strategy");
	String add1 = properties.getProperty("add1");
	String company_contact = properties.getProperty("company_contact");
	String road_light_shut_down_success = properties.getProperty("road_light_shut_down_success");
	String please_choose_xls_file = properties.getProperty("please_choose_xls_file");
	String you_have_no_permission = properties.getProperty("you_have_no_permission");
	String remind_infomation = properties.getProperty("remind_infomation");
	String day = properties.getProperty("day");
	String yes = properties.getProperty("yes");
	String repire_debug = properties.getProperty("repire_debug");
	String system = properties.getProperty("system");
	String circuit_breaker_abnormality = properties.getProperty("circuit_breaker_abnormality");
	String please_enter_company_location = properties.getProperty("please_enter_company_location");
	String gateway_number = properties.getProperty("gateway_number");
	String enter_this_log_name_here = properties.getProperty("enter_this_log_name_here");
	String time_and_brightness = properties.getProperty("time_and_brightness");
	String function_value = properties.getProperty("function_value");
	String search_device_not_exist_or_wrong = properties.getProperty("search_device_not_exist_or_wrong");
	String language = properties.getProperty("language");
	String please_enter_department_name = properties.getProperty("please_enter_department_name");
	String return1 = properties.getProperty("return1");
	String device_combination = properties.getProperty("device_combination");
	String import_from_excel = properties.getProperty("import_from_excel");
	String please_choose_company = properties.getProperty("please_choose_company");
	String email = properties.getProperty("email");
	String add_app_group = properties.getProperty("add_app_group");
	String road_light_list_2 = properties.getProperty("road_light_list_2");
	String road_light_list_1 = properties.getProperty("road_light_list_1");
	String device_type = properties.getProperty("device_type");
	String exception_status = properties.getProperty("exception_status");
	String temperature = properties.getProperty("temperature");
	String power_standard = properties.getProperty("power_standard");
	String importt = properties.getProperty("importt");



%>