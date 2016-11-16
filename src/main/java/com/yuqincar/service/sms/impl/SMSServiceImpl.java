package com.yuqincar.service.sms.impl;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.yuqincar.domain.message.SMSQueue;
import com.yuqincar.service.message.SMSQueueService;
import com.yuqincar.service.sms.SMSService;
import com.yuqincar.utils.Configuration;
import com.yuqincar.utils.DateUtils;
import com.yuqincar.utils.HttpInvoker;
import com.yuqincar.utils.RandomUtil;
import com.yuqincar.utils.SMSToken;

@Service
public class SMSServiceImpl implements SMSService {
		
	private static String SMS_GATE_URL="http://api.189.cn/v2/emp/templateSms/sendSms";
	private static String APP_ID = "593884530000249253";//应用ID------登录平台在应用设置可以找到
	private static String APP_SECRET = "ba1a8529eef141b3d5b631d998f33fd0";//应用secret-----登录平台在应用设置可以找到
	private static int SMS_TRY_TIMES = 6;
	private static String SEND_SUCCESS_TEMPLATE="{\"res_code\":0,\"res_message\":\"Success\",\"idertifier\":\"90610913090118406454\"}";
	
	@Autowired
	private SMSQueueService sMSQueueService;
	
	private void sendSMSToFile(String phoneNumber, String templateId, String content) {
		File file = new File(Configuration.getSmsLogFile());
		PrintWriter pw = null;
		try {
			pw = new PrintWriter(new FileWriter(file, true));
			pw.print(phoneNumber);
			pw.println();
			pw.print(templateId);
			pw.println();
			pw.println(content);
			pw.println();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pw != null)
				pw.close();
		}
	}
	
	private String sendTemplateSMS(String phoneNumber,String templateId, String paramString) throws Exception{
		String postEntity = "app_id=" + APP_ID + "&access_token="
				+ SMSToken.getSMSToken() + "&acceptor_tel=" + phoneNumber + "&template_id="
				+ templateId + "&template_param=" + paramString
				+ "&timestamp=" + URLEncoder.encode(DateUtils.getYMDHMSString(new Date()), "utf-8");
		String resJson = "";
		//验证码短信不需要打开开关。这是为了使测试服务器能够正常发送验证码。
		if("on".equals(Configuration.getSmsSwitch()) || templateId.equals(SMSService.SMS_TEMPLATE_VERFICATION_CODE)){
			resJson = HttpInvoker.httpPost1(SMS_GATE_URL, null, postEntity);
			System.out.println("***resJson="+resJson);
		}else{
			sendSMSToFile(phoneNumber,templateId,paramString);
			resJson=SEND_SUCCESS_TEMPLATE;
		}
		return resJson;
	}

	@Transactional
	public String sendTemplateSMS(String phoneNumber,String templateId, Map<String, String> params) {
		Gson gson = new Gson();
		String template_param = gson.toJson(params);
		
		try{
			String resJson=sendTemplateSMS(phoneNumber,templateId,template_param);
			return resJson;
		}catch(Exception e){
			e.printStackTrace();
			SMSQueue sq=new SMSQueue();
			sq.setPhoneNumber(phoneNumber);
			sq.setTemplateId(templateId);
			sq.setParams(template_param);
			sq.setInQueueDate(new Date());
			sq.setTryTimes(0);
			sMSQueueService.saveSMSQueue(sq);
			return SEND_SUCCESS_TEMPLATE;
		}
	}
	
	@Transactional
	public void sendSMSInQueue(){
		System.out.println("in sendSMSInQueue");
		List<SMSQueue> smsList=sMSQueueService.getAllSMSQueue();
		for(SMSQueue sms:smsList){
			try{
				sendTemplateSMS(sms.getPhoneNumber(),sms.getTemplateId(),sms.getParams());
				sMSQueueService.deleteSMSQueue(sms.getId());
			}catch(Exception e){
				sms.setTryTimes(sms.getTryTimes()+1);
				if(sms.getTryTimes()>=SMS_TRY_TIMES)
					sMSQueueService.deleteSMSQueue(sms.getId());
				else
					sMSQueueService.updateSMSQueue(sms);
			}
		}
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String result = "";
		try {
			Map<String,String> map = new HashMap<String,String>();
			map.put("param1", "手机");
			map.put("param2", RandomUtil.randomFor6());
			result = new SMSServiceImpl().sendTemplateSMS("13883101475",SMSService.SMS_TEMPLATE_VERFICATION_CODE,map);
			System.out.println(result);
			Gson gson = new Gson();
			Map<String,String> jsonMap = gson.fromJson(result,new TypeToken<Map<String, String>>() {
			}.getType());
			System.out.println(jsonMap.get("res_message"));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
