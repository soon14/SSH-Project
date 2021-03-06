package com.yuqincar.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import org.apache.struts2.views.jsp.TagUtils;
import org.springframework.core.enums.LabeledEnum;

import com.opensymphony.xwork2.util.ValueStack;
import com.yuqincar.domain.common.BaseEnum;
import com.yuqincar.domain.privilege.User;

public class enumSelectorTags extends TagSupport {
	private static final long serialVersionUID = 1L;
	private String name;
	private String enumName;
	private String style;
	private String cssClass;
	private boolean notNull;
	@SuppressWarnings("unchecked")
	public int doStartTag() throws JspException {
		ValueStack stack = TagUtils.getStack(pageContext);
		BaseEnum be = (BaseEnum) stack.findValue(name);
		StringBuffer options = new StringBuffer();
		JspWriter out = pageContext.getOut();
		Class<BaseEnum> clazz = null;
		int selectedItemValue=-2;
		try {
			selectedItemValue = (be == null ? -1: be.getId());
			clazz = (Class<BaseEnum>) Class.forName("com.yuqincar.domain."+enumName);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		BaseEnum[] objs = clazz.getEnumConstants();  
		if(style==null)
			style="";
		if(cssClass==null)
			cssClass="SelectStyle";
		options.append("<select name="+name+" id="+name+" class=\""+cssClass+"\" style=\""+style+"\">");
		if(!notNull){
			if(selectedItemValue==-1)
				options.append("<option selected  value =\"-1\">所有</option>");
			else {
				options.append("<option value =\"-1\">所有</option>");
			}
		}
        for (BaseEnum obj : objs) {  
            String label =  obj.getLabel();
            int id=obj.getId();
            if(id==selectedItemValue)
            	options.append("<option selected value ="+id+">"+label+"</option>");
            else {
            	 options.append("<option value ="+id+">"+label+"</option>");
			}
        }  
        options.append("</select>");
        try {
			out.println(options);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	public int doEndTag() throws JspException {

		return EVAL_PAGE;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEnumName() {
		return enumName;
	}

	public void setEnumName(String enumName) {
		this.enumName = enumName;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public boolean isNotNull() {
		return notNull;
	}

	public void setNotNull(boolean notNull) {
		this.notNull = notNull;
	}
}
