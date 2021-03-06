package com.yuqincar.domain.order;

import java.math.BigDecimal;

import javax.persistence.Entity;

import com.yuqincar.domain.common.BaseEntity;
import com.yuqincar.utils.Text;
import com.yuqincar.utils.TextResolve;

@Entity
public class Price extends BaseEntity {
	@Text("8小时（100公里内）")
	private BigDecimal perDay;

	@Text("4小时（50公里内）")
	private BigDecimal perHalfDay;

	@Text("超公里（每公里）")
	private BigDecimal perMileAfterLimit;

	@Text("超时（每小时）")
	private BigDecimal perHourAfterLimit;

	@Text("机场接送机（50公里/2小时）")
	private BigDecimal perPlaneTime;

	public BigDecimal getPerDay() {
		return perDay;
	}

	public void setPerDay(BigDecimal perDay) {
		this.perDay = perDay;
	}

	public BigDecimal getPerHalfDay() {
		return perHalfDay;
	}

	public void setPerHalfDay(BigDecimal perHalfDay) {
		this.perHalfDay = perHalfDay;
	}

	public BigDecimal getPerMileAfterLimit() {
		return perMileAfterLimit;
	}

	public void setPerMileAfterLimit(BigDecimal perMileAfterLimit) {
		this.perMileAfterLimit = perMileAfterLimit;
	}

	public BigDecimal getPerHourAfterLimit() {
		return perHourAfterLimit;
	}

	public void setPerHourAfterLimit(BigDecimal perHourAfterLimit) {
		this.perHourAfterLimit = perHourAfterLimit;
	}

	public BigDecimal getPerPlaneTime() {
		return perPlaneTime;
	}

	public void setPerPlaneTime(BigDecimal perPlaneTime) {
		this.perPlaneTime = perPlaneTime;
	}	
	public String toPriceDescription(){
		StringBuffer sb=new StringBuffer();
		sb.append(TextResolve.getText("order.Price.perDay")).append("：").append(perDay.toString()).append("；");
		sb.append(TextResolve.getText("order.Price.perHalfDay")).append("：").append(perHalfDay.toString()).append("；");
		sb.append(TextResolve.getText("order.Price.perMileAfterLimit")).append("：").append(perMileAfterLimit.toString()).append("；");
		sb.append(TextResolve.getText("order.Price.perHourAfterLimit")).append("：").append(perHourAfterLimit.toString()).append("；");
		sb.append(TextResolve.getText("order.Price.perPlaneTime")).append("：").append(perPlaneTime.toString()).append("；");
		return sb.toString();
	}
}
