package com.zgx.util;

import java.awt.Dimension;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class TimeFrame extends JFrame {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2421388196440357987L;
	/*
	 * 变量
	 */
	private JPanel timePanel;
	private JLabel timeLabel;
	private JLabel displayArea;
	private String DEFAULT_TIME_FORMAT = "HH:mm:ss";
	private String time;
	private int ONE_SECOND = 1000;

	public TimeFrame() {
		timePanel = new JPanel();
		timeLabel = new JLabel("CurrentTime: ");
		displayArea = new JLabel();

		configTimeArea();

		timePanel.add(timeLabel);
		timePanel.add(displayArea);
		this.add(timePanel);
		this.setDefaultCloseOperation(EXIT_ON_CLOSE);
		this.setSize(new Dimension(200, 70));
		this.setLocationRelativeTo(null);
	}

	/**
	 * 此方法创建一个定时器任务，以更新每秒的时间。
	 */
	private void configTimeArea() {
		Timer tmr = new Timer();
		tmr.scheduleAtFixedRate(new JLabelTimerTask(), new Date(), ONE_SECOND);
	}

	/**
	 * 
	 * 
	 更新时间显示区域的计时器任务
	 * 
	 */
	protected class JLabelTimerTask extends TimerTask {
		SimpleDateFormat dateFormatter = new SimpleDateFormat(
				DEFAULT_TIME_FORMAT);

		@Override
		public void run() {
			time = dateFormatter.format(Calendar.getInstance().getTime());
			displayArea.setText(time);
		}
	}

	public static void main(String arg[]) {
		TimeFrame timeFrame = new TimeFrame();
		timeFrame.setVisible(true);
	}
}/* 何问起 hovertree.com */