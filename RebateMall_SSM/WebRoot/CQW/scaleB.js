;
(function($, window, document, undfined) {
	var RulerDraggings = function(ele, opt) {
		this.$element = ele;
		this.defaults = {};
		this.options = $.extend({}, this.defaults, opt)
	}
	RulerDraggings.prototype = {
		//初始化
		init: function(platformIndexs, cycleIndex) { //第一个参数为平台索引，第二个参数为当前平台的周期索引
			var currentAmounts;
			var defaultAmounts = this.options[platformIndexs][cycleIndex].defaultAmount;
			var minAmounts = this.options[platformIndexs][cycleIndex].minAmount;
			var stepAmounts = this.options[platformIndexs][cycleIndex].stepAmount;
			if (stepAmounts == undefined) {
				stepAmounts = defaultstepAmounts;
			}
			if (defaultAmounts > 0) {
				currentAmounts = defaultAmounts;
			} else {
				currentAmounts = minAmounts + stepAmounts * 3
			}
			myAmounts.eq(platformIndexs).attr("value", currentAmounts);
			myAmounts.eq(platformIndexs).val(currentAmounts);
			this.setInputWidths(platformIndexs);
			this.generatingRulers(platformIndexs, minAmounts, stepAmounts, defaultAmounts);
		},
		setInputWidths: function(platformIndexs) { //设置“我要投资”文本框宽度
			myAmounts.eq(platformIndexs).width(myAmounts.eq(platformIndexs).val().length * 11);
		},
		//生成标尺
		generatingRulers: function(platformIndexs, minAmounts, stepAmounts, defaultAmounts) { //生成标尺
			var currentAmounts;
			if (defaultAmounts == undefined) {
				defaultAmounts = minAmounts + stepAmounts * 3;
			}
			var inputAmount2s = parseInt((defaultAmounts - minAmounts) / stepAmounts) * stepAmounts + minAmounts;
			currentAmounts = inputAmount2s - 12 * stepAmounts;
			//currentMinAmount1[platformIndex1] = currentAmount + stepAmount1;
			for (var m = 0; m < 23; m++) {
				currentAmounts = currentAmounts + stepAmounts;
				if (currentAmounts < minAmounts) {
					if (m == 11) {
						currentAmounts = minAmounts;
						//currentMinAmount1[platformIndex1] = currentAmount + stepAmount1;
						scales.eq(platformIndexs).append("<span>" + currentAmounts + "</span>");
					} else {
						scales.eq(platformIndexs).append("<span></span>");
					}
				} else {
					//currentMaxAmount[platformIndex1] = currentAmount;
					scales.eq(platformIndexs).append("<span>" + currentAmounts + "</span>");
				}
				scales.eq(platformIndexs).width(50 * (m + 1));
			}
			scales.eq(platformIndexs).css("left", parseInt((inputAmount2s - defaultAmounts) / (stepAmounts / 10) * 5) - 450);
		},
		//改变刻度金额
		changeAmounts: function(inputAmounts, platformIndexs, cycleIndex) {
			var currentAmounts;
			var minAmounts = this.options[platformIndexs][cycleIndex].minAmount;
			var stepAmounts = this.options[platformIndexs][cycleIndex].stepAmount;
			if (stepAmounts == undefined) {
				stepAmounts = defaultstepAmounts;
			}
			var inputAmount2s = parseInt((inputAmounts - minAmounts) / stepAmounts) * stepAmounts + minAmounts;
			currentAmounts = inputAmount2s - 12 * stepAmounts;
			//currentMinAmount1[platformIndex1] = currentAmount + stepAmount1;
			var scalesSpans = scales.eq(platformIndexs).children("span");
			var scalesSpanNums = scalesSpans.lenght;
			for (var m = 0; m < 23; m++) {
				currentAmounts = currentAmounts + stepAmounts;
				if (currentAmounts < minAmounts) {
					scalesSpans.eq(m).html("");
					if (m == 11) {
						currentAmounts = minAmounts;
						//currentMinAmount1[platformIndex1] = currentAmount + stepAmount1;
						scalesSpans.eq(m).html(currentAmounts);
					}
				} else {
					//currentMaxAmount[platformIndex1] = currentAmount;
					scalesSpans.eq(m).html(currentAmounts);
				}
			}
			scales.eq(platformIndexs).css("left", parseInt((inputAmount2s - inputAmounts) / (stepAmounts / 10) * 5) - 450);
		},
		//计算收益
		calculateProfits: function(platformIndexs, cycleIndex) {
			//投资周期
			var cycles = this.options[platformIndexs][cycleIndex].cycle;
			//标的类型
			var types = this.options[platformIndexs][cycleIndex].type;

			//原财气加息
			var annualYields = this.options[platformIndexs][cycleIndex].annualYield;
			//平台年化
			var platRates = this.options[platformIndexs][cycleIndex].platRate;
			//综合年化
			var unitRates = this.options[platformIndexs][cycleIndex].unitRate;
			//我的投资金额
			var myInvestmentAmounts = parseInt(myAmounts.eq(platformIndexs).attr("value"));
			
			var companyids = $(".zhidet-rebates").eq(platformIndexs).attr("data");
			if (types == 1) {
				//月标
				//平台利息
				$(".interest-incomes").eq(platformIndexs).html((myInvestmentAmounts * platRates / 1200 * cycles).toFixed(2));
				//财气加息
				$(".total-incomes").eq(platformIndexs).html((myInvestmentAmounts * annualYields / 1200 * cycles).toFixed(2));
				$(".zhidet-rebates").eq(platformIndexs).html((myInvestmentAmounts * unitRates / 1200 * cycles).toFixed(2));
			}else {
				//财气加息
				$(".total-incomes").eq(platformIndexs).html((myInvestmentAmounts * annualYields / 36500 * cycles).toFixed(2));
				//平台利息
				$(".interest-incomes").eq(platformIndexs).html((myInvestmentAmounts * platRates / 36500 * cycles).toFixed(2));
				$(".zhidet-rebates").eq(platformIndexs).html((myInvestmentAmounts * unitRates / 36500 * cycles).toFixed(2));
			}
		}
	}
	$.fn.rulerDraggings = function(options) {
		defaultstepAmounts = 1000; //默认步长
		var platformIndexs = 0; //平台
		var newAmount1s = 0;
		var newAmount2s = 0;
		var scalesXs = 0;
		var copyNums = 0;
		var distances = 0;
		var surplus1s = 0;
		var surplus2s = 0;
		var flags = 0;
		var currentMousexs = 0;
		var isDraggings = false;
		var stoppings;
		//currentMinAmount1 = new Array; //标尺最左侧的值
		//currentMaxAmount = new Array; //标尺最右侧的值
		var currentMinAmounts = 0;
		var currentMaxAmounts = 0;
		var rulers = $(".rulers");
		scales = $(".rulers .scales");
		myAmounts = $(".my-investment-amounts");
		var myDraggings = new RulerDraggings(this, options);
		var totals = myDraggings.$element.length;
		for (var n = 0; n < totals; n++) {
			myDraggings.init(n, 0);
			myDraggings.calculateProfits(n, 0);
		}
		myDraggings.$element.mousedown(function() {
			platformIndexs = $(this).index();
		});
		myAmounts.keyup(function() {
			inputAmounts = 0;
			var minAmounts = myDraggings.options[platformIndexs][0].minAmount;
			if ($(this).val() <= minAmounts) {
				inputAmounts = minAmounts
			} 
			if (minAmounts < parseInt($(this).val()) && parseInt($(this).val()) < 800000) {
				inputAmounts = $(this).val();
			} 
			if($(this).val() >= 800000){
				inputAmounts=800000;
				$(this).val(inputAmounts);
			}
			$(this).attr("value", inputAmounts);
			myDraggings.setInputWidths(platformIndexs);
			myDraggings.changeAmounts(inputAmounts, platformIndexs, 0);
			myDraggings.calculateProfits(platformIndexs, 0);
		});
		myAmounts.blur(function() {
			$(this).val(inputAmounts);
			myDraggings.setInputWidths(platformIndexs);
		})
		rulers.on({
			mousedown: function(event) {
				flags = 0;
				platformIndexs = $(this).parent("div").parent("div").parent(".spro_list div.spro_box").index();
				isDraggings = true;
				stoppings = false;
				currentMousexs = event.pageX;
				scalesXs = scales.eq(platformIndexs).position().left;
				currentAmounts = parseInt(myAmounts.eq(platformIndexs).attr("value"));
				minAmounts = myDraggings.options[platformIndexs][0].minAmount;
				stepAmounts = myDraggings.options[platformIndexs][0].stepAmount;
				return false;
			},
			mousemove: function(event) {

				if (isDraggings) {
					var myInvestmentAmounts = myAmounts.eq(platformIndexs);
					var mouseXs = event.pageX;
					distances = mouseXs - currentMousexs;
					if (parseInt(scales.eq(platformIndexs).children("span").eq(22).html()) >= (800000 + stepAmounts * 12) && distance1 < 0) {
						stoppings = true;
					} else {
						stoppings = false;
					}
					if (stoppings == false) {
						scalesLefts = scalesXs + distances;
						newAmount1s = currentAmounts - distances * stepAmounts / 50;
						//console.log(newAmount1);
						if (newAmount1s < minAmounts) {
							myInvestmentAmounts.attr("value", minAmounts);
							myInvestmentAmounts.val(newAmount2s);
							//scale1.eq(platformIndex1).css("left", "-400px");
							isDraggings = false;
						} else {
							//四舍五入
							newAmount2s = Math.round(newAmount1s / 100) * 100;
							//设置我要投资中的金额；
							//console.log(newAmount1);
							//console.log(newAmount2);
							myInvestmentAmounts.attr("value", newAmount2s);
							myInvestmentAmounts.val(newAmount2s);
							myDraggings.setInputWidths(platformIndexs);
							//移动标尺
							scales.eq(platformIndexs).css("left", scalesLefts);
						}
						myDraggings.calculateProfits(platformIndexs, 0);
					}
				}
			},
			mouseup: function() {
				if (stoppings == false) {
					isDraggings = false;
					currentAmounts = newAmount1s;
					if (flags == 0) {
						//往左拖曳
						if (distances < 0) {
							copyNums = parseInt((Math.abs(distances) + surplus1s) / 50);
							surplus1s = Math.abs(distances) + surplus1s - copyNums * 50; //取整后的剩余部分；
							currentMaxAmounts = parseInt(scales.eq(platformIndexs).children("span").eq(22).html());
							for (var k = 0; k < copyNums; k++) {
								currentMaxAmounts += stepAmounts;
								scales.eq(platformIndexs).append("<span>" + currentMaxAmounts + "</span>");
								scales.eq(platformIndexs).children("span").eq(0).remove();
								scalesLefts += 50;
								scales.eq(platformIndexs).css("left", scalesLefts);

							}
						}
						//往右拖曳
						if (distances > 0) {
							copyNums = parseInt((Math.abs(distances) + surplus2s) / 50);
							surplus2s = Math.abs(distances) + surplus2s - copyNums * 50; //取整后的剩余部分；
							currentMinAmounts = parseInt(scales.eq(platformIndexs).children("span").eq(0).html());
							for (k = 0; k < copyNums; k++) {
								currentMinAmounts -= stepAmounts;
								if (currentMinAmounts >= minAmounts) {
									scale1.eq(platformIndexs).prepend("<span>" + currentMinAmounts + "</span>"); //增加1个span，span的个数为24
								} else {
									currentMinAmounts = minAmounts;
									scales.eq(platformIndexs).prepend("<span></span>");
								}
								scales.eq(platformIndexs).children("span").eq(23).remove(); //增加了1个span后，span的个数为24
								scalesLefts -= 50;
								scales.eq(platformIndexs).css("left", scalesLefts);
							}
						}
						flags = 1;
					}
				}
			},
			mouseleave: function() {
				if (stoppings == false) {
					isDraggings = false;
					currentAmounts = newAmount1s;
					if (flags == 0) {
						//往左拖曳
						if (distances < 0) {
							copyNums = parseInt((Math.abs(distances) + surplu1s) / 50);
							surplu1s = Math.abs(distances) + surplu1s - copyNums * 50; //取整后的剩余部分；
							currentMaxAmounts = parseInt(scales.eq(platformIndexs).children("span").eq(22).html());
							for (var k = 0; k < copyNums; k++) {
								currentMaxAmounts += stepAmounts;
								scales.eq(platformIndexs).append("<span>" + currentMaxAmounts + "</span>");
								scales.eq(platformIndexs).children("span").eq(0).remove();
								scalesLefts += 50;
								scales.eq(platformIndexs).css("left", scalesLefts);

							}
						}
						//往右拖曳
						if (distances > 0) {
							copyNums = parseInt((Math.abs(distances) + surplus2s) / 50);
							surplus2s = Math.abs(distances) + surplus2s - copyNums * 50; //取整后的剩余部分；
							currentMinAmounts = parseInt(scales.eq(platformIndexs).children("span").eq(0).html());
							for (k = 0; k < copyNums; k++) {
								currentMinAmounts -= stepAmounts;
								if (currentMinAmounts >= minAmounts) {
									scales.eq(platformIndexs).prepend("<span>" + currentMinAmounts + "</span>"); //增加1个span，span的个数为24
								} else {
									currentMinAmounts = minAmounts;
									scales.eq(platformIndexs).prepend("<span></span>");
								}
								scales.eq(platformIndexs).children("span").eq(23).remove(); //增加了1个span后，span的个数为24
								scalesLefts -= 50;
								scales.eq(platformIndexs).css("left", scalesLefts);
							}
						}
						flags = 1;
					}
				}
			},
		})
	}

})(jQuery, window, document);