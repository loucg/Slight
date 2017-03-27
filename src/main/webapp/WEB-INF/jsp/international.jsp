<%@page import="java.util.Properties"%>  
<%@page import="java.io.FileInputStream"%>  
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.IOException"%>
<% 
//国际化
	String local = (String)session.getAttribute("session_language"); 
	Properties properties = new Properties();
	try {
		FileInputStream fis = new FileInputStream(this.getClass().getClassLoader().getResource("/").getPath()+"slight_"+local+".properties");
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
		System.out.println("can not find file");
	} 
	
	String integration_power = properties.getProperty("integration_power");
	String bigest_electricity = properties.getProperty("bigest_electricity");
	String wait_start_use = properties.getProperty("wait_start_use");
	String please_enter_name = properties.getProperty("please_enter_name");
	String userinfo = properties.getProperty("userinfo");
	String make_sure = properties.getProperty("make_sure");
	String no_relevant_data = properties.getProperty("no_relevant_data");
	String add2 = properties.getProperty("add2");
	String old_password = properties.getProperty("old_password");
	String add1 = properties.getProperty("add1");
	String shut_down = properties.getProperty("shut_down");
	String please_enter_repair_person = properties.getProperty("please_enter_repair_person");
	String device_number = properties.getProperty("device_number");
	String department_name = properties.getProperty("department_name");
	String abnormal_lamp = properties.getProperty("abnormal_lamp");
	String single_light_controller = properties.getProperty("single_light_controller");
	String effective = properties.getProperty("effective");
	String open_light = properties.getProperty("open_light");
	String gateway_anomaly = properties.getProperty("gateway_anomaly");
	String no_permission = properties.getProperty("no_permission");
	String temperature = properties.getProperty("temperature");
	String make_sure_choose_data = properties.getProperty("make_sure_choose_data");
	String road_light_status = properties.getProperty("road_light_status");
	String time_is_null = properties.getProperty("time_is_null");
	String standard = properties.getProperty("standard");
	String import_from_excel = properties.getProperty("import_from_excel");
	String summary = properties.getProperty("summary");
	String light_standard = properties.getProperty("light_standard");
	String strategy_adjust = properties.getProperty("strategy_adjust");
	String device_type = properties.getProperty("device_type");
	String please_enter_department_name = properties.getProperty("please_enter_department_name");
	String operate = properties.getProperty("operate");
	String please_choose_file = properties.getProperty("please_choose_file");
	String make_sure_delete2_data = properties.getProperty("make_sure_delete2_data");
	String status_list = properties.getProperty("status_list");
	String please_choose_picture = properties.getProperty("please_choose_picture");
	String test = properties.getProperty("test");
	String stop_mobile = properties.getProperty("stop_mobile");
	String latitude = properties.getProperty("latitude");
	String charactor = properties.getProperty("charactor");
	String account_infomation = properties.getProperty("account_infomation");
	String position = properties.getProperty("position");
	String gateway_name = properties.getProperty("gateway_name");
	String vendor = properties.getProperty("vendor");
	String please_enter_0_180_number = properties.getProperty("please_enter_0_180_number");
	String up_electricity_time = properties.getProperty("up_electricity_time");
	String enter_email_here = properties.getProperty("enter_email_here");
	String device_group_number = properties.getProperty("device_group_number");
	String LOGO = properties.getProperty("LOGO");
	String lamp_short = properties.getProperty("lamp_short");
	String group_explain = properties.getProperty("group_explain");
	String repire_debug = properties.getProperty("repire_debug");
	String visitor = properties.getProperty("visitor");
	String password = properties.getProperty("password");
	String brightness_adjust = properties.getProperty("brightness_adjust");
	String english = properties.getProperty("english");
	String company_location = properties.getProperty("company_location");
	String undervoltage = properties.getProperty("undervoltage");
	String enter_the_department_name_here = properties.getProperty("enter_the_department_name_here");
	String make_sure_delete_picture = properties.getProperty("make_sure_delete_picture");
	String phone = properties.getProperty("phone");
	String enter_phone_number_here = properties.getProperty("enter_phone_number_here");
	String status = properties.getProperty("status");
	String language1 = properties.getProperty("language1");
	String fault_list = properties.getProperty("fault_list");
	String yes = properties.getProperty("yes");
	String add_group_member2 = properties.getProperty("add_group_member2");
	String add_group_member1 = properties.getProperty("add_group_member1");
	String unregister_mobile = properties.getProperty("unregister_mobile");
	String contact_address = properties.getProperty("contact_address");
	String odd_and_even_day = properties.getProperty("odd_and_even_day");
	String brightness_is_null = properties.getProperty("brightness_is_null");
	String add_app_group = properties.getProperty("add_app_group");
	String account_manage = properties.getProperty("account_manage");
	String type = properties.getProperty("type");
	String welcome = properties.getProperty("welcome");
	String please_enter_group_explain = properties.getProperty("please_enter_group_explain");
	String up_and_down_time_not_equal = properties.getProperty("up_and_down_time_not_equal");
	String none_this_department_is_top = properties.getProperty("none_this_department_is_top");
	String return1 = properties.getProperty("return1");
	String please_enter_company_name = properties.getProperty("please_enter_company_name");
	String please_enter_summry = properties.getProperty("please_enter_summry");
	String set_up_and_down_electricity_time = properties.getProperty("set_up_and_down_electricity_time");
	String success_delete = properties.getProperty("success_delete");
	String add_device = properties.getProperty("add_device");
	String modify = properties.getProperty("modify");
	String you_have_not_choose_anything = properties.getProperty("you_have_not_choose_anything");
	String road_light_total_power = properties.getProperty("road_light_total_power");
	String enter_function_values_here = properties.getProperty("enter_function_values_here");
	String multiple_delete_app_group = properties.getProperty("multiple_delete_app_group");
	String gateway_number = properties.getProperty("gateway_number");
	String please_choose_brightness = properties.getProperty("please_choose_brightness");
	String log_name = properties.getProperty("log_name");
	String make_sure_reset_password = properties.getProperty("make_sure_reset_password");
	String this_strategy_not_assign_app_group = properties.getProperty("this_strategy_not_assign_app_group");
	String road_light_open_faliue = properties.getProperty("road_light_open_faliue");
	String make_sure_delete1_data = properties.getProperty("make_sure_delete1_data");
	String total = properties.getProperty("total");
	String statistical_type = properties.getProperty("statistical_type");
	String pole = properties.getProperty("pole");
	String strategy_name = properties.getProperty("strategy_name");
	String please_type_device_name = properties.getProperty("please_type_device_name");
	String please_choose_if_display_LOGO = properties.getProperty("please_choose_if_display_LOGO");
	String brightness_level = properties.getProperty("brightness_level");
	String circle_select = properties.getProperty("circle_select");
	String time_repeat = properties.getProperty("time_repeat");
	String search_type = properties.getProperty("search_type");
	String modify_strategy = properties.getProperty("modify_strategy");
	String road_light_brightness_update_success = properties.getProperty("road_light_brightness_update_success");
	String please_enter_group_name = properties.getProperty("please_enter_group_name");
	String function_Brief = properties.getProperty("function_Brief");
	String device_number2 = properties.getProperty("device_number2");
	String please_enter_strategy_name = properties.getProperty("please_enter_strategy_name");
	String multiple_add_app_group = properties.getProperty("multiple_add_app_group");
	String bigest_voltage = properties.getProperty("bigest_voltage");
	String over_temperature = properties.getProperty("over_temperature");
	String please_choose_excel = properties.getProperty("please_choose_excel");
	String menber_number = properties.getProperty("menber_number");
	String device_name = properties.getProperty("device_name");
	String not_divide_group = properties.getProperty("not_divide_group");
	String system = properties.getProperty("system");
	String gateway = properties.getProperty("gateway");
	String this_group_can_not_divide_odd_and_even = properties.getProperty("this_group_can_not_divide_odd_and_even");
	String please_choose_end_time = properties.getProperty("please_choose_end_time");
	String road_light_shut_down_success = properties.getProperty("road_light_shut_down_success");
	String please_choose = properties.getProperty("please_choose");
	String blockout = properties.getProperty("blockout");
	String exception_status = properties.getProperty("exception_status");
	String please_choose_status = properties.getProperty("please_choose_status");
	String group_name = properties.getProperty("group_name");
	String time = properties.getProperty("time");
	String change = properties.getProperty("change");
	String device_combination = properties.getProperty("device_combination");
	String strate_control = properties.getProperty("strate_control");
	String make_sure_divider_open_light = properties.getProperty("make_sure_divider_open_light");
	String road_light_open_success = properties.getProperty("road_light_open_success");
	String over_voltage = properties.getProperty("over_voltage");
	String add_device_tips = properties.getProperty("add_device_tips");
	String please_choose_the_superior_department = properties.getProperty("please_choose_the_superior_department");
	String time_and_brightness_2 = properties.getProperty("time_and_brightness_2");
	String edit = properties.getProperty("edit");
	String smart_divide_group_by_power = properties.getProperty("smart_divide_group_by_power");
	String department_description = properties.getProperty("department_description");
	String repair_self = properties.getProperty("repair_self");
	String smart_divide_group_by_odd_and_even = properties.getProperty("smart_divide_group_by_odd_and_even");
	String function = properties.getProperty("function");
	String email_type_not_correct = properties.getProperty("email_type_not_correct");
	String device_counter = properties.getProperty("device_counter");
	String no = properties.getProperty("no");
	String delete_app_device = properties.getProperty("delete_app_device");
	String person_name = properties.getProperty("person_name");
	String control_strategy = properties.getProperty("control_strategy");
	String download_model = properties.getProperty("download_model");
	String avg_power_factor = properties.getProperty("avg_power_factor");
	String gateway_or_circuit_breaker_exception = properties.getProperty("gateway_or_circuit_breaker_exception");
	String name = properties.getProperty("name");
	String make_sure_divider_group_by_power = properties.getProperty("make_sure_divider_group_by_power");
	String exception_description = properties.getProperty("exception_description");
	String download_wrong_please_refresh = properties.getProperty("download_wrong_please_refresh");
	String email = properties.getProperty("email");
	String please_enter_vendor = properties.getProperty("please_enter_vendor");
	String self_prepare = properties.getProperty("self_prepare");
	String please_choose_a_statistical_type = properties.getProperty("please_choose_a_statistical_type");
	String energy_consumption = properties.getProperty("energy_consumption");
	String comment = properties.getProperty("comment");
	String pole2 = properties.getProperty("pole2");
	String make_sure_divider_group_by_odd_and_even = properties.getProperty("make_sure_divider_group_by_odd_and_even");
	String please_enter_register = properties.getProperty("please_enter_register");
	String repair_result = properties.getProperty("repair_result");
	String coordinate = properties.getProperty("coordinate");
	String gateway_status = properties.getProperty("gateway_status");
	String explain_item = properties.getProperty("explain_item");
	String please_choose_language = properties.getProperty("please_choose_language");
	String month = properties.getProperty("month");
	String manager = properties.getProperty("manager");
	String importt = properties.getProperty("importt");
	String time_and_brightness_at_most_12 = properties.getProperty("time_and_brightness_at_most_12");
	String enter_new_password = properties.getProperty("enter_new_password");
	String location = properties.getProperty("location");
	String make_sure_delete_app_group = properties.getProperty("make_sure_delete_app_group");
	String repair_time = properties.getProperty("repair_time");
	String strategy = properties.getProperty("strategy");
	String function_key = properties.getProperty("function_key");
	String pole_number2 = properties.getProperty("pole_number2");
	String please_choose_xls_file = properties.getProperty("please_choose_xls_file");
	String repair_instructions = properties.getProperty("repair_instructions");
	String phone_number = properties.getProperty("phone_number");
	String normal = properties.getProperty("normal");
	String work_status = properties.getProperty("work_status");
	String group_number = properties.getProperty("group_number");
	String add_app_device = properties.getProperty("add_app_device");
	String time_for_24hour = properties.getProperty("time_for_24hour");
	String enter_position_here = properties.getProperty("enter_position_here");
	String superior_department = properties.getProperty("superior_department");
	String power_standard = properties.getProperty("power_standard");
	String fault_type = properties.getProperty("fault_type");
	String total_days = properties.getProperty("total_days");
	String please_choose_fault_type = properties.getProperty("please_choose_fault_type");
	String pole_number = properties.getProperty("pole_number");
	String app_explain = properties.getProperty("app_explain");
	String please_enter_contact = properties.getProperty("please_enter_contact");
	String company_contact = properties.getProperty("company_contact");
	String modify_account = properties.getProperty("modify_account");
	String search_device_not_exist_or_wrong = properties.getProperty("search_device_not_exist_or_wrong");
	String keck_delete_group_member = properties.getProperty("keck_delete_group_member");
	String this_login_name_has_exist = properties.getProperty("this_login_name_has_exist");
	String enter_company_location_here = properties.getProperty("enter_company_location_here");
	String date = properties.getProperty("date");
	String total_time = properties.getProperty("total_time");
	String time_and_brightness = properties.getProperty("time_and_brightness");
	String kick_delete = properties.getProperty("kick_delete");
	String phone_number_type_not_correct = properties.getProperty("phone_number_type_not_correct");
	String power_rate_factor = properties.getProperty("power_rate_factor");
	String modify_information = properties.getProperty("modify_information");
	String jump_to_strategy_control_page = properties.getProperty("jump_to_strategy_control_page");
	String please_enter_time_for_24hour = properties.getProperty("please_enter_time_for_24hour");
	String company_name = properties.getProperty("company_name");
	String search_seccess_please_look_light_list2_on_left = properties.getProperty("search_seccess_please_look_light_list2_on_left");
	String type_wrong_name_check_special = properties.getProperty("type_wrong_name_check_special");
	String power = properties.getProperty("power");
	String wait_repair = properties.getProperty("wait_repair");
	String choose_strategy = properties.getProperty("choose_strategy");
	String function_value = properties.getProperty("function_value");
	String export_to_excel = properties.getProperty("export_to_excel");
	String app_group_has_assigned = properties.getProperty("app_group_has_assigned");
	String enter_function_Brief_here = properties.getProperty("enter_function_Brief_here");
	String registe = properties.getProperty("registe");
	String make_sure_shut_down_light = properties.getProperty("make_sure_shut_down_light");
	String day = properties.getProperty("day");
	String enter_this_log_name_here = properties.getProperty("enter_this_log_name_here");
	String please_choose_odd_even_day = properties.getProperty("please_choose_odd_even_day");
	String please_enter_repire_explain = properties.getProperty("please_enter_repire_explain");
	String exception = properties.getProperty("exception");
	String detail = properties.getProperty("detail");
	String road_light_list_2 = properties.getProperty("road_light_list_2");
	String road_light_list_1 = properties.getProperty("road_light_list_1");
	String search2 = properties.getProperty("search2");
	String search1 = properties.getProperty("search1");
	String serial_number = properties.getProperty("serial_number");
	String circuit_breaker = properties.getProperty("circuit_breaker");
	String please_choose_department = properties.getProperty("please_choose_department");
	String voltage = properties.getProperty("voltage");
	String lamp_open_circuit = properties.getProperty("lamp_open_circuit");
	String add_strategy = properties.getProperty("add_strategy");
	String you_have_no_permission = properties.getProperty("you_have_no_permission");
	String please_choose_charactor = properties.getProperty("please_choose_charactor");
	String login_name_contain_letter_number_4_16 = properties.getProperty("login_name_contain_letter_number_4_16");
	String road_light_brightness_update_faliue = properties.getProperty("road_light_brightness_update_faliue");
	String invalid = properties.getProperty("invalid");
	String search_get_device = properties.getProperty("search_get_device");
	String endtime_biger_than_starttime = properties.getProperty("endtime_biger_than_starttime");
	String chinese = properties.getProperty("chinese");
	String if_display_LOGO = properties.getProperty("if_display_LOGO");
	String please_enter_serial_number = properties.getProperty("please_enter_serial_number");
	String jiebu = properties.getProperty("jiebu");
	String road_light = properties.getProperty("road_light");
	String enter_person_name_here = properties.getProperty("enter_person_name_here");
	String enter_the_department_here = properties.getProperty("enter_the_department_here");
	String belong_gateway = properties.getProperty("belong_gateway");
	String maintenance_man = properties.getProperty("maintenance_man");
	String please_enter_phone = properties.getProperty("please_enter_phone");
	String light_ratio = properties.getProperty("light_ratio");
	String enter_contact_address_here = properties.getProperty("enter_contact_address_here");
	String light_rate = properties.getProperty("light_rate");
	String address = properties.getProperty("address");
	String road_light_exception = properties.getProperty("road_light_exception");
	String enter_old_password = properties.getProperty("enter_old_password");
	String end_time = properties.getProperty("end_time");
	String group_member = properties.getProperty("group_member");
	String odd = properties.getProperty("odd");
	String please_enter_company_location = properties.getProperty("please_enter_company_location");
	String enter_company_name_here = properties.getProperty("enter_company_name_here");
	String normal_cutoff_device = properties.getProperty("normal_cutoff_device");
	String blockout_time = properties.getProperty("blockout_time");
	String cancel = properties.getProperty("cancel");
	String please_enter_one_time_and_brightness_relation = properties.getProperty("please_enter_one_time_and_brightness_relation");
	String functional_classification = properties.getProperty("functional_classification");
	String arrears = properties.getProperty("arrears");
	String temporary_no_data = properties.getProperty("temporary_no_data");
	String new_password = properties.getProperty("new_password");
	String electricity_set = properties.getProperty("electricity_set");
	String keck_delete_app_group = properties.getProperty("keck_delete_app_group");
	String delete_device = properties.getProperty("delete_device");
	String sensor_standard = properties.getProperty("sensor_standard");
	String total_power = properties.getProperty("total_power");
	String ex_24_hours = properties.getProperty("ex_24_hours");
	String add_account = properties.getProperty("add_account");
	String strategy_manage = properties.getProperty("strategy_manage");
	String please_enter_0_90_number = properties.getProperty("please_enter_0_90_number");
	String divide_group_setting = properties.getProperty("divide_group_setting");
	String add_app_select = properties.getProperty("add_app_select");
	String gateway_location = properties.getProperty("gateway_location");
	String enter_company_contact_here = properties.getProperty("enter_company_contact_here");
	String please_enter_app_explain = properties.getProperty("please_enter_app_explain");
	String please_enter_pole_number = properties.getProperty("please_enter_pole_number");
	String short_circuit = properties.getProperty("short_circuit");
	String road_light_number = properties.getProperty("road_light_number");
	String start_time = properties.getProperty("start_time");
	String clear_search_ = properties.getProperty("clear_search_");
	String road_light_has_shut_status = properties.getProperty("road_light_has_shut_status");
	String please_choose_start_time = properties.getProperty("please_choose_start_time");
	String please_upload_xls_file = properties.getProperty("please_upload_xls_file");
	String delete_all = properties.getProperty("delete_all");
	String voltage_exception = properties.getProperty("voltage_exception");
	String enter_function_classification_here = properties.getProperty("enter_function_classification_here");
	String menber_list = properties.getProperty("menber_list");
	String schedule_adjust_brightness = properties.getProperty("schedule_adjust_brightness");
	String brightness_value = properties.getProperty("brightness_value");
	String repair_register = properties.getProperty("repair_register");
	String brightness_percent = properties.getProperty("brightness_percent");
	String super_manager = properties.getProperty("super_manager");
	String road_light_has_open_status = properties.getProperty("road_light_has_open_status");
	String destroy = properties.getProperty("destroy");
	String electricity_time = properties.getProperty("electricity_time");
	String please_choose_device_type = properties.getProperty("please_choose_device_type");
	String none = properties.getProperty("none");
	String circuit_breaker_abnormality = properties.getProperty("circuit_breaker_abnormality");
	String choose = properties.getProperty("choose");
	String gatewany_number = properties.getProperty("gatewany_number");
	String up_and_down_electricity = properties.getProperty("up_and_down_electricity");
	String app_list = properties.getProperty("app_list");
	String save = properties.getProperty("save");
	String add_divide_group = properties.getProperty("add_divide_group");
	String old_password_wrong = properties.getProperty("old_password_wrong");
	String committing = properties.getProperty("committing");
	String reset = properties.getProperty("reset");
	String click_this_choose_all = properties.getProperty("click_this_choose_all");
	String shut_down_light = properties.getProperty("shut_down_light");
	String please_choose_company = properties.getProperty("please_choose_company");
	String make_sure_adjust_strategy = properties.getProperty("make_sure_adjust_strategy");
	String this_group_can_not_divide_by_power = properties.getProperty("this_group_can_not_divide_by_power");
	String make_sure_up_and_down_electricity_for_select_device = properties.getProperty("make_sure_up_and_down_electricity_for_select_device");
	String deadline = properties.getProperty("deadline");
	String enter_function_key_here = properties.getProperty("enter_function_key_here");
	String number = properties.getProperty("number");
	String longitude = properties.getProperty("longitude");
	String strategy_number = properties.getProperty("strategy_number");
	String export_electricity = properties.getProperty("export_electricity");
	String group_strategy = properties.getProperty("group_strategy");
	String multiple_add = properties.getProperty("multiple_add");
	String delete = properties.getProperty("delete");
	String power_rate = properties.getProperty("power_rate");
	String please_upload_picture_format_file = properties.getProperty("please_upload_picture_format_file");
	String company = properties.getProperty("company");
	String make_sure_add_app_group = properties.getProperty("make_sure_add_app_group");
	String print_voltage = properties.getProperty("print_voltage");
	String please_enter_standard_name = properties.getProperty("please_enter_standard_name");
	String device_group_list = properties.getProperty("device_group_list");
	String remind_infomation = properties.getProperty("remind_infomation");
	String has_repair = properties.getProperty("has_repair");
	String make_sure_adjust_brightness = properties.getProperty("make_sure_adjust_brightness");
	String wrong_search = properties.getProperty("wrong_search");
	String registrant = properties.getProperty("registrant");
	String reset_password = properties.getProperty("reset_password");
	String energy_status = properties.getProperty("energy_status");
	String new_password_contain_letter_number = properties.getProperty("new_password_contain_letter_number");
	String road_light_shut_down_faliue = properties.getProperty("road_light_shut_down_faliue");
	String you_have_not_choose_any_app_group = properties.getProperty("you_have_not_choose_any_app_group");
	String open_road = properties.getProperty("open_road");
	String even = properties.getProperty("even");
	String please_type_device_number = properties.getProperty("please_type_device_number");
	String clear_draw = properties.getProperty("clear_draw");
	String the_packet_has_no_terminal = properties.getProperty("the_packet_has_no_terminal");
	String coordinate_conversion_failed = properties.getProperty("coordinate_conversion_failed");
	String no_data_in_box = properties.getProperty("no_data_in_box");
	String Gatewayrouter_not_this_operations = properties.getProperty("Gatewayrouter_not_this_operations");
	String light_operating_successfully = properties.getProperty("light_operating_successfully");
	String light_operating_err = properties.getProperty("light_operating_err");
	String no_data_any_term = properties.getProperty("no_data_any_term");
	String brightness_adjustment = properties.getProperty("brightness_adjustment");
	String light_pole_number = properties.getProperty("light_pole_number");






%>