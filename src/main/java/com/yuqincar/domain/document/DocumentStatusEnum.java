package com.yuqincar.domain.document;

import com.yuqincar.domain.common.BaseEnum;

public enum DocumentStatusEnum implements BaseEnum{
	
	UNCHECKED(0,"未审核"),
	
	CHECKING(1,"正在审核"),
	
	CHECKED(2,"通过审核"),
	
	REJECTED(3,"驳回");
	
	DocumentStatusEnum(int id,String label){
		this.id = id;
		this.label = label;
	}
	
	private int id;
	private String label;

	public int getId() {
		return id;
	}

	public String getLabel() {
		return label;
	}
	
	public static DocumentStatusEnum[] getAllEnum() {
		return DocumentStatusEnum.values();
	}

	public static DocumentStatusEnum getById(int id) {
		for (DocumentStatusEnum u : DocumentStatusEnum.values()) {
			if (u.getId() == id)
				return u;
		}
		return null;
	}

	public static DocumentStatusEnum getByLabel(String label) {
		for (DocumentStatusEnum u : DocumentStatusEnum.values()) {
			if (u.getLabel().equals(label))
				return u;
		}
		return null;
	}

}
