package com.zgx.po;

import java.io.Serializable;


/***
 * 
 * 天气
 * 
 * @author 星月
 *
 */
public class weather implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3056483559054816066L;
    
	/**
	 * 天气状况
	 */
	private String  status;//（天气）状况
	
	private String  temperature;//温度
	
	private String  wind_power;//风力

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	public String getWind_power() {
		return wind_power;
	}

	public void setWind_power(String wind_power) {
		this.wind_power = wind_power;
	}
	
	
	
	

}
