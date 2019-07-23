;
(function($, window, document, undfined) {
	var RulerDragging1 = function(ele, opt) {
		this.$element = ele;
		this.defaults = {};
		this.options = $.extend({}, this.defaults, opt)
	}
	RulerDragging1.prototype = {
		//初始化
		init: function(platformIndex1, cycleIndex) { //第一个参数为平台索引，第二个参数为当前平台的周期索引
			var currentAmount1;
			var defaultAmount1 = this.options[platformIndex1][cycleIndex].defaultAmount;
			var minAmount1 = this.options[platformIndex1][cycleIndex].minAmount;
			var stepAmount1 = this.options[platformIndex1][cycleIndex].stepAmount;
			if (stepAmount1 == undefined) {
				stepAmount1 = defaultstepAmount1;
			}
			if (defaultAmount1 > 0) {
				currentAmount1 = defaultAmount1;
			} else {
				currentAmount1 = minAmount1 + stepAmount1 * 3
			}
			myAmount1.eq(platformIndex1).attr("value", currentAmount1);
			myAmount1.eq(platformIndex1).val(currentAmount1);
			this.setInputWidth1(platformIndex1);
			this.generatingRuler1(platformIndex1, minAmount1, stepAmount1, defaultAmount1);
		},
		setInputWidth1: function(platformIndex1) { //设置“我要投资”文本框宽度
			myAmount1.eq(platformIndex1).width(myAmount1.eq(platformIndex1).val().length * 11);
		},
		//生成标尺
		generatingRuler1: function(platformIndex1, minAmount1, stepAmount1, defaultAmount1) { //生成标尺
			var currentAmount1;
			if (defaultAmount1 == undefined) {
				defaultAmount1 = minAmount1 + stepAmount1 * 3;
			}
			var inputAmount21 = parseInt((defaultAmount1 - minAmount1) / stepAmount1) * stepAmount1 + minAmount1;
			currentAmount1 = inputAmount21 - 12 * stepAmount1;
			//currentMinAmount1[platformIndex1] = currentAmount + stepAmount1;
			for (var m = 0; m < 23; m++) {
				currentAmount1 = currentAmount1 + stepAmount1;
				if (currentAmount1 < minAmount1) {
					if (m == 11) {
						currentAmount1 = minAmount1;
						//currentMinAmount1[platformIndex1] = currentAmount + stepAmount1;
						scale1.eq(platformIndex1).append("<span>" + currentAmount1 + "</span>");
					} else {
						scale1.eq(platformIndex1).append("<span></span>");
					}
				} else {
					//currentMaxAmount[platformIndex1] = currentAmount;
					scale1.eq(platformIndex1).append("<span>" + currentAmount1 + "</span>");
				}
				scale1.eq(platformIndex1).width(50 * (m + 1));
			}
			scale1.eq(platformIndex1).css("left", parseInt((inputAmount21 - defaultAmount1) / (stepAmount1 / 10) * 5) - 450);
		},
		//改变刻度金额
		changeAmount1: function(inputAmount1, platformIndex1, cycleIndex) {
			var currentAmount1;
			var minAmount1 = this.options[platformIndex1][cycleIndex].minAmount;
			var stepAmount1 = this.options[platformIndex1][cycleIndex].stepAmount;
			if (stepAmount1 == undefined) {
				stepAmount1 = defaultstepAmount1;
			}
			var inputAmount21 = parseInt((inputAmount1 - minAmount1) / stepAmount1) * stepAmount1 + minAmount1;
			currentAmount1 = inputAmount21 - 12 * stepAmount1;
			//currentMinAmount1[platformIndex1] = currentAmount + stepAmount1;
			var scale1Span1 = scale1.eq(platformIndex1).children("span");
			var scale1SpanNum1 = scale1Span1.lenght;
			for (var m = 0; m < 23; m++) {
				currentAmount1 = currentAmount1 + stepAmount1;
				if (currentAmount1 < minAmount1) {
					scale1Span1.eq(m).html("");
					if (m == 11) {
						currentAmount1 = minAmount1;
						//currentMinAmount1[platformIndex1] = currentAmount + stepAmount1;
						scale1Span1.eq(m).html(currentAmount1);
					}
				} else {
					//currentMaxAmount[platformIndex1] = currentAmount;
					scale1Span1.eq(m).html(currentAmount1);
				}
			}
			scale1.eq(platformIndex1).css("left", parseInt((inputAmount21 - inputAmount1) / (stepAmount1 / 10) * 5) - 450);
		},
		//计算收益
		calculateProfit1: function(platformIndex1, cycleIndex) {
			//投资周期
			var cycle1 = this.options[platformIndex1][cycleIndex].cycle;
			//标的类型
			var type1 = this.options[platformIndex1][cycleIndex].type;
			//原财气加息
			var annualYield1 = this.options[platformIndex1][cycleIndex].annualYield;
			//平台年化
			var platRate1 = this.options[platformIndex1][cycleIndex].platRate;
			//综合年化
			var unitRate1 = this.options[platformIndex1][cycleIndex].unitRate;
			//我的投资金额
			var myInvestmentAmount1 = parseInt(myAmount1.eq(platformIndex1).attr("value"));
			
			var companyid1 = $(".zhidet-rebate1").eq(platformIndex1).attr("data");
			if (type1 == 1) {
				//月标
				//平台利息
				$(".interest-income1").eq(platformIndex1).html((myInvestmentAmount1 * platRate1 / 1200 * cycle1).toFixed(2));
				//财气加息
				$(".total-income1").eq(platformIndex1).html((myInvestmentAmount1 * annualYield1 / 1200 * cycle1).toFixed(2));
				$(".zhidet-rebate1").eq(platformIndex1).html((myInvestmentAmount1 * unitRate1 / 1200 * cycle1).toFixed(2));
			} else {
				//财气加息
				$(".total-income1").eq(platformIndex1).html((myInvestmentAmount1 * annualYield1 / 36500 * cycle1).toFixed(2));
				//平台利息
				$(".interest-income1").eq(platformIndex1).html((myInvestmentAmount1 * platRate1 / 36500 * cycle1).toFixed(2));
				$(".zhidet-rebate1").eq(platformIndex1).html((myInvestmentAmount1 * unitRate1 / 36500 * cycle1).toFixed(2));
			}
		}
	}
	$.fn.rulerDragging1 = function(options) {
		defaultstepAmount1 = 1000; //默认步长
		var platformIndex1 = 0; //平台
		var newAmount11 = 0;
		var newAmount21 = 0;
		var scale1X1 = 0;
		var copyNum1 = 0;
		var distance1 = 0;
		var surplus11 = 0;
		var surplus21 = 0;
		var flag1 = 0;
		var currentMousex1 = 0;
		var isDragging1 = false;
		var stopping1;
		//currentMinAmount1 = new Array; //标尺最左侧的值
		//currentMaxAmount = new Array; //标尺最右侧的值
		var currentMinAmount1 = 0;
		var currentMaxAmount1 = 0;
		var ruler1 = $(".ruler1");
		scale1 = $(".ruler1 .scale1");
		myAmount1 = $(".my-investment-amount1");
		var myDragging1 = new RulerDragging1(this, options);
		var total1 = myDragging1.$element.length;
		for (var n = 0; n < total1; n++) {
			myDragging1.init(n, 0);
			myDragging1.calculateProfit1(n, 0);
		}
		myDragging1.$element.mousedown(function() {
			platformIndex1 = $(this).index();
		});
		myAmount1.keyup(function() {
			inputAmount1 = 0;
			var minAmount1 = myDragging1.options[platformIndex1][0].minAmount;
			if ($(this).val() <= minAmount1) {
				inputAmount1 = minAmount1
			} 
			if (minAmount1 < parseInt($(this).val()) && parseInt($(this).val()) < 800000) {
				inputAmount1 = $(this).val();
			} 
			if($(this).val() >= 800000){
				inputAmount1=800000;
				$(this).val(inputAmount1);
			}
			$(this).attr("value", inputAmount1);
			myDragging1.setInputWidth1(platformIndex1);
			myDragging1.changeAmount1(inputAmount1, platformIndex1, 0);
			myDragging1.calculateProfit1(platformIndex1, 0);
		});
		myAmount1.blur(function() {
			$(this).val(inputAmount1);
			myDragging1.setInputWidth1(platformIndex1);
		})
		ruler1.on({
			mousedown: function(event) {
				flag1 = 0;
				platformIndex1 = $(this).parent("div").parent(".novice_list1 div.clear-fix1").index();
				isDragging1 = true;
				stopping1 = false;
				currentMousex1 = event.pageX;
				scale1X1 = scale1.eq(platformIndex1).position().left;
				currentAmount1 = parseInt(myAmount1.eq(platformIndex1).attr("value"));
				minAmount1 = myDragging1.options[platformIndex1][0].minAmount;
				stepAmount1 = myDragging1.options[platformIndex1][0].stepAmount;
				return false;
			},
			mousemove: function(event) {

				if (isDragging1) {
					var myInvestmentAmount1 = myAmount1.eq(platformIndex1);
					var mouseX1 = event.pageX;
					distance1 = mouseX1 - currentMousex1;
					if (parseInt(scale1.eq(platformIndex1).children("span").eq(22).html()) >= (800000 + stepAmount1 * 12) && distance1 < 0) {
						stopping1 = true;
					} else {
						stopping1 = false;
					}
					if (stopping1 == false) {
						scale1Left1 = scale1X1 + distance1;
						newAmount11 = currentAmount1 - distance1 * stepAmount1 / 50;
						//console.log(newAmount1);
						if (newAmount11 < minAmount1) {
							myInvestmentAmount1.attr("value", minAmount1);
							myInvestmentAmount1.val(newAmount21);
							//scale1.eq(platformIndex1).css("left", "-400px");
							isDragging1 = false;
						} else {
							//四舍五入
							newAmount21 = Math.round(newAmount11 / 100) * 100;
							//设置我要投资中的金额；
							//console.log(newAmount1);
							//console.log(newAmount2);
							myInvestmentAmount1.attr("value", newAmount21);
							myInvestmentAmount1.val(newAmount21);
							myDragging1.setInputWidth1(platformIndex1);
							//移动标尺
							scale1.eq(platformIndex1).css("left", scale1Left1);
						}
						myDragging1.calculateProfit1(platformIndex1, 0);
					}
				}
			},
			mouseup: function() {
				if (stopping1 == false) {
					isDragging1 = false;
					currentAmount1 = newAmount11;
					if (flag1 == 0) {
						//往左拖曳
						if (distance1 < 0) {
							copyNum1 = parseInt((Math.abs(distance1) + surplus11) / 50);
							surplus11 = Math.abs(distance1) + surplus11 - copyNum1 * 50; //取整后的剩余部分；
							currentMaxAmount1 = parseInt(scale1.eq(platformIndex1).children("span").eq(22).html());
							for (var k = 0; k < copyNum1; k++) {
								currentMaxAmount1 += stepAmount1;
								scale1.eq(platformIndex1).append("<span>" + currentMaxAmount1 + "</span>");
								scale1.eq(platformIndex1).children("span").eq(0).remove();
								scale1Left1 += 50;
								scale1.eq(platformIndex1).css("left", scale1Left1);

							}
						}
						//往右拖曳
						if (distance1 > 0) {
							copyNum1 = parseInt((Math.abs(distance1) + surplus21) / 50);
							surplus21 = Math.abs(distance1) + surplus21 - copyNum1 * 50; //取整后的剩余部分；
							currentMinAmount1 = parseInt(scale1.eq(platformIndex1).children("span").eq(0).html());
							for (k = 0; k < copyNum1; k++) {
								currentMinAmount1 -= stepAmount1;
								if (currentMinAmount1 >= minAmount1) {
									scale1.eq(platformIndex1).prepend("<span>" + currentMinAmount1 + "</span>"); //增加1个span，span的个数为24
								} else {
									currentMinAmount1 = minAmount1;
									scale1.eq(platformIndex1).prepend("<span></span>");
								}
								scale1.eq(platformIndex1).children("span").eq(23).remove(); //增加了1个span后，span的个数为24
								scale1Left1 -= 50;
								scale1.eq(platformIndex1).css("left", scale1Left1);
							}
						}
						flag1 = 1;
					}
				}
			},
			mouseleave: function() {
				if (stopping1 == false) {
					isDragging1 = false;
					currentAmount1 = newAmount11;
					if (flag1 == 0) {
						//往左拖曳
						if (distance1 < 0) {
							copyNum1 = parseInt((Math.abs(distance1) + surplus1) / 50);
							surplus1 = Math.abs(distance1) + surplus1 - copyNum1 * 50; //取整后的剩余部分；
							currentMaxAmount1 = parseInt(scale1.eq(platformIndex1).children("span").eq(22).html());
							for (var k = 0; k < copyNum1; k++) {
								currentMaxAmount1 += stepAmount1;
								scale1.eq(platformIndex1).append("<span>" + currentMaxAmount1 + "</span>");
								scale1.eq(platformIndex1).children("span").eq(0).remove();
								scale1Left1 += 50;
								scale1.eq(platformIndex1).css("left", scale1Left1);

							}
						}
						//往右拖曳
						if (distance1 > 0) {
							copyNum1 = parseInt((Math.abs(distance1) + surplus21) / 50);
							surplus21 = Math.abs(distance1) + surplus21 - copyNum1 * 50; //取整后的剩余部分；
							currentMinAmount1 = parseInt(scale1.eq(platformIndex1).children("span").eq(0).html());
							for (k = 0; k < copyNum1; k++) {
								currentMinAmount1 -= stepAmount1;
								if (currentMinAmount1 >= minAmount1) {
									scale1.eq(platformIndex1).prepend("<span>" + currentMinAmount1 + "</span>"); //增加1个span，span的个数为24
								} else {
									currentMinAmount1 = minAmount1;
									scale1.eq(platformIndex1).prepend("<span></span>");
								}
								scale1.eq(platformIndex1).children("span").eq(23).remove(); //增加了1个span后，span的个数为24
								scale1Left1 -= 50;
								scale1.eq(platformIndex1).css("left", scale1Left1);
							}
						}
						flag1 = 1;
					}
				}
			},
		})
	}

})(jQuery, window, document);